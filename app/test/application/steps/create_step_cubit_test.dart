import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vision_director/application/steps/create_step/create_step_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
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

  group('CreateStepCubit', () {
    group('ChangeName', () {
      final mockStep = getStepFixture();
      final name = mockStep.name.getOrCrash();

      blocTest<CreateStepCubit, CreateStepState>(
        'emits the new [StepName]',
        build: () => mockHydratedStorage(() => CreateStepCubit(repository)),
        act: (cubit) => cubit.changeName(name),
        expect: () => [
          CreateStepState.initial().copyWith(
            step: CreateStepState.initial().step.copyWith(
                  name: StepName(name),
                ),
            stepFailureOrSuccessOption: none(),
          ),
        ],
      );
    });

    group('CreateStep', () {
      final scenarioId = getRandomId();
      final mockStep = getStepInputFixture();
      final state = CreateStepState.initial();

      test('initial CreateStepState should be CreateStepState.initial()', () {
        mockHydratedStorage(() {
          final cubit = CreateStepCubit(repository);
          // assert
          expect(cubit.state, equals(CreateStepState.initial()));
        });
      });

      blocTest<CreateStepCubit, CreateStepState>(
        'emits [unit] for successful step creation',
        setUp: () => when(
          () => repository.createSteps(
            scenarioId,
            [mockStep],
            any(),
          ),
        ).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 1),
            () => right(unit),
          ),
        ),
        build: () => mockHydratedStorage(() => CreateStepCubit(repository)),
        seed: () => state.copyWith(step: mockStep),
        act: (cubit) => cubit.createStep(scenarioId, 0),
        expect: () => [
          state.copyWith(
            step: mockStep,
            isSubmitting: true,
            showErrorMessages: false,
            stepFailureOrSuccessOption: none(),
          ),
          state.copyWith(
            step: mockStep,
            isSubmitting: false,
            showErrorMessages: true,
            stepFailureOrSuccessOption: some(right(unit)),
          ),
        ],
        verify: (_) {
          verify(
            () => repository.createSteps(
              scenarioId,
              [mockStep],
              any(),
            ),
          ).called(1);
        },
      );

      blocTest<CreateStepCubit, CreateStepState>(
        'emits [StepFailure] for unsuccessful step creation',
        setUp: () => when(
          () => repository.createSteps(
            scenarioId,
            [mockStep],
            any(),
          ),
        ).thenAnswer(
          (_) => Future.delayed(
            const Duration(milliseconds: 1),
            () => left(const StepFailure.unexpected()),
          ),
        ),
        build: () => mockHydratedStorage(() => CreateStepCubit(repository)),
        seed: () => state.copyWith(step: mockStep),
        act: (cubit) => cubit.createStep(scenarioId, 0),
        expect: () => [
          state.copyWith(
            step: mockStep,
            isSubmitting: true,
            showErrorMessages: false,
            stepFailureOrSuccessOption: none(),
          ),
          state.copyWith(
            step: mockStep,
            isSubmitting: false,
            showErrorMessages: true,
            stepFailureOrSuccessOption:
                some(left(const StepFailure.unexpected())),
          ),
        ],
        verify: (_) {
          verify(
            () => repository.createSteps(
              scenarioId,
              [mockStep],
              any(),
            ),
          ).called(1);
        },
      );

      blocTest<CreateStepCubit, CreateStepState>(
        'emits [StepFailure] if the total duration is too long',
        build: () => mockHydratedStorage(() => CreateStepCubit(repository)),
        seed: () => state.copyWith(step: mockStep),
        act: (cubit) =>
            cubit.createStep(scenarioId, Guidelines.maxTotalDuration),
        expect: () => [
          state.copyWith(
            step: mockStep,
            isSubmitting: false,
            showErrorMessages: true,
            stepFailureOrSuccessOption: some(left(const StepFailure.tooLong())),
          ),
        ],
        verify: (_) {
          verifyNever(
            () => repository.createSteps(
              scenarioId,
              [mockStep],
              any(),
            ),
          );
        },
      );
    });
  });
}
