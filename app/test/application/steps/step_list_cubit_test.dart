import 'package:bloc_test/bloc_test.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

import '../../fixtures/faker.dart';
import '../../fixtures/step_fixtures.dart';
import '../helpers/hydrated_cubit.dart';

class MockStepRepository extends Mock implements IStepRepository {}

void main() {
  late MockStepRepository repository;

  setUp(() {
    repository = MockStepRepository();
  });

  void _setUpGetStepsSuccess(List<Step> steps, String scenarioId) {
    when(() => repository.getSteps(scenarioId)).thenAnswer(
      (_) => Future.delayed(
        const Duration(milliseconds: 1),
        () => right(steps),
      ),
    );
  }

  group('StepListCubit', () {
    final scenarioId = getRandomId();
    final steps = getStepListFixture();

    test('initial StepListState should be StepListState.initial()', () {
      mockHydratedStorage(() {
        final cubit = StepListCubit(repository);
        // assert
        expect(cubit.state, equals(const StepListState.initial()));
      });
    });

    blocTest<StepListCubit, StepListState>(
      'emits [loadInProgress, loadSuccess] states for successful step list fetch',
      setUp: () => _setUpGetStepsSuccess(steps, scenarioId),
      build: () => mockHydratedStorage(() => StepListCubit(repository)),
      act: (cubit) => cubit.getSteps(scenarioId),
      expect: () => [
        const StepListState.loadInProgress(),
        StepListState.loadSuccess(steps),
      ],
      verify: (_) {
        verify(() => repository.getSteps(scenarioId)).called(1);
      },
    );

    blocTest<StepListCubit, StepListState>(
      'emits [loadInProgress, loadFailure] states for unsuccessful step list fetch',
      setUp: () => when(() => repository.getSteps(scenarioId)).thenAnswer(
        (_) => Future.delayed(
          const Duration(milliseconds: 1),
          () => left(const StepFailure.unexpected()),
        ),
      ),
      build: () => mockHydratedStorage(() => StepListCubit(repository)),
      act: (cubit) => cubit.getSteps(scenarioId),
      expect: () => [
        const StepListState.loadInProgress(),
        const StepListState.loadFailure(StepFailure.unexpected())
      ],
      verify: (_) {
        verify(() => repository.getSteps(scenarioId)).called(1);
      },
    );
  });

  group('AddNewSteps', () {
    final scenarioId = getRandomId();
    final steps = getStepListFixture();
    final mockStep = getStepFixture(position: steps.length + 1);

    blocTest<StepListCubit, StepListState>(
      'successfully adds the new step',
      build: () => mockHydratedStorage(() => StepListCubit(repository)),
      seed: () => StepListState.loadSuccess(steps),
      act: (cubit) => cubit.addNewSteps([mockStep]),
      expect: () => [
        StepListState.loadSuccess([...steps, mockStep])
      ],
    );

    test('adds the new step to the end of the list', () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);

        _setUpGetStepsSuccess(steps, scenarioId);
        await cubit.getSteps(scenarioId);

        // act
        cubit.addNewSteps([mockStep]);

        // assert
        expect(
          cubit.state,
          equals(
            StepListState.loadSuccess(
              [...steps, mockStep],
            ),
          ),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSteps) {
            expect(stateSteps.length, steps.length + 1);
            expect(stateSteps.last, mockStep);
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });

    test(
        'does not add the step if the state is not StepListState.loadSuccess()',
        () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);

        // act
        cubit.addNewSteps([mockStep]);

        // assert
        expect(cubit.state, equals(const StepListState.initial()));
      });
    });
  });

  group('RemoveStep', () {
    final scenarioId = getRandomId();
    final steps = getStepListFixture();
    final mockStep = getStepFixture(position: steps.length + 1);

    blocTest<StepListCubit, StepListState>(
      'successfully removes the step for the given stepId',
      build: () => mockHydratedStorage(() => StepListCubit(repository)),
      seed: () => StepListState.loadSuccess([...steps, mockStep]),
      act: (cubit) => cubit.removeStep(mockStep),
      expect: () => [
        StepListState.loadSuccess(steps),
      ],
    );

    test('removes the step from the list', () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);
        _setUpGetStepsSuccess([...steps, mockStep], scenarioId);
        await cubit.getSteps(scenarioId);

        // act
        cubit.removeStep(mockStep);

        // assert
        expect(
          cubit.state,
          equals(StepListState.loadSuccess(steps)),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSteps) {
            expect(stateSteps.length, steps.length);
            expect(
              stateSteps.where((s) => s.id == mockStep.id).firstOrNull,
              null,
            );
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });

    test(
        'does not remove the step if the state is not StepListState.loadSuccess()',
        () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);

        // act
        cubit.removeStep(mockStep);

        // assert
        expect(cubit.state, equals(const StepListState.initial()));
      });
    });

    test('does not remove a step if it cannot find a step for the id',
        () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);
        _setUpGetStepsSuccess(steps, scenarioId);
        await cubit.getSteps(scenarioId);

        // act
        cubit.removeStep(mockStep);

        // assert
        expect(
          cubit.state,
          equals(StepListState.loadSuccess(steps)),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSteps) {
            expect(stateSteps.length, steps.length);
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });
  });

  group('UpdateStep', () {
    final scenarioId = getRandomId();
    final steps = getStepListFixture();
    final mockStep = getStepFixture(position: steps.length + 1);
    final editedStep = mockStep.copyWith(name: StepName(getRandomName()));

    blocTest<StepListCubit, StepListState>(
      'successfully edits the step for the given step',
      build: () => mockHydratedStorage(() => StepListCubit(repository)),
      seed: () => StepListState.loadSuccess([...steps, mockStep]),
      act: (cubit) => cubit.updateStep(editedStep),
      expect: () => [
        StepListState.loadSuccess([...steps, editedStep]),
      ],
    );

    test('successfully edits the step', () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);
        _setUpGetStepsSuccess([...steps, mockStep], scenarioId);
        await cubit.getSteps(scenarioId);

        // act
        cubit.updateStep(editedStep);

        // assert
        expect(
          cubit.state,
          equals(
            StepListState.loadSuccess([...steps, editedStep]),
          ),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSteps) {
            expect(stateSteps.length, steps.length + 1);
            expect(stateSteps.last, editedStep);
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });

    test(
        'does not edit the step if the state is not StepListState.loadSuccess()',
        () {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);
        // act
        cubit.updateStep(mockStep);

        // assert
        expect(cubit.state, equals(const StepListState.initial()));
      });
    });

    test('does not edit a step if it cannot find the step', () async {
      mockHydratedStorage(() async {
        // arrange
        final cubit = StepListCubit(repository);
        _setUpGetStepsSuccess(steps, scenarioId);
        await cubit.getSteps(scenarioId);

        // act
        cubit.updateStep(mockStep);

        // assert
        expect(
          cubit.state,
          equals(StepListState.loadSuccess(steps)),
        );

        cubit.state.maybeWhen(
          loadSuccess: (stateSteps) {
            expect(stateSteps.length, steps.length);
          },
          // Wrong state so throw error
          orElse: () => expect(true, false),
        );
      });
    });
  });
}
