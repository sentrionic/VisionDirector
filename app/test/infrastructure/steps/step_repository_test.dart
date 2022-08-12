import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';
import 'package:vision_director/infrastructure/steps/step_repository.dart';

import '../../fixtures/faker.dart';
import '../../fixtures/fixture_reader.dart';
import '../../fixtures/step_fixtures.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late StepRepository repository;
  late MockDioClient client;

  setUp(() {
    client = MockDioClient();
    repository = StepRepository(client);
  });

  group('StepRepository', () {
    group('GetSteps', () {
      final data = fixture('step_list.json');
      final result = json.decode(data);
      final List<Step> steps = [];
      result.forEach((s) => steps.add(StepDto.fromJson(s).toDomain()));
      final scenarioId = getRandomId();

      test(
        "should perform a GET request to the network to get the scenario's steps",
        () async {
          // arrange
          when(() => client.get('/scenarios/$scenarioId/steps')).thenAnswer(
            (_) async => Response(
              data: data,
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: '/scenarios/$scenarioId/steps'),
            ),
          );

          // act
          repository.getSteps(scenarioId);

          // assert
          verify(
            () => client.get(
              '/scenarios/$scenarioId/steps',
            ),
          ).called(1);
        },
      );

      test(
        'should return a list of steps when the response code is 200 (success)',
        () async {
          // arrange
          when(() => client.get('/scenarios/$scenarioId/steps')).thenAnswer(
            (_) async => Response(
              data: data,
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: '/scenarios/$scenarioId/steps'),
            ),
          );

          // act
          final result = await repository.getSteps(scenarioId);

          // assert
          expect(result.isRight(), true);
          expect(result.getOrElse(() => []), equals(steps));
        },
      );

      test(
        'should return a StepFailure when DioError is thrown',
        () async {
          // arrange
          when(() => client.get('/scenarios/$scenarioId/steps')).thenThrow(
            DioError(
              requestOptions: RequestOptions(
                path: '/scenarios/$scenarioId/steps',
                method: "GET",
              ),
            ),
          );

          // act
          final result = await repository.getSteps(scenarioId);

          // assert
          expect(result.isLeft(), true);

          final value = result.fold(id, id);

          expect(
            value,
            equals(const StepFailure.unexpected()),
          );
        },
      );
    });

    group("CreateSteps", () {
      final scenarioId = getRandomId();
      final mockStep = getStepInputFixture();

      void setUpHttpSuccess() {
        when(
          () => client.post(
            any(),
            data: any(named: "data"),
            onSendProgress: any(named: "onSendProgress"),
          ),
        ).thenAnswer(
          (_) async => Response(
            statusCode: 201,
            requestOptions:
                RequestOptions(path: '/scenarios/$scenarioId/steps'),
          ),
        );
      }

      void setUpHttpFailure() {
        when(
          () => client.post(
            any(),
            data: any(named: "data"),
            onSendProgress: any(named: "onSendProgress"),
          ),
        ).thenThrow(
          DioError(
            requestOptions: RequestOptions(
              path: '/scenarios/$scenarioId/steps',
              method: "POST",
            ),
          ),
        );
      }

      test(
        "should perform a POST request to the network to create the step with the given name",
        () async {
          // arrange
          setUpHttpSuccess();

          // act
          repository.createSteps(scenarioId, [mockStep], (sent, total) {});

          // assert
          verify(
            () => client.post(
              '/scenarios/$scenarioId/steps',
              data: any(named: "data"),
              onSendProgress: any(named: "onSendProgress"),
            ),
          ).called(1);
        },
      );

      test(
        'should return [unit] when the response code is 201 (created)',
        () async {
          // arrange
          setUpHttpSuccess();

          // act
          final result = await repository.createSteps(
            scenarioId,
            [mockStep],
            (sent, total) {},
          );

          // assert
          expect(result.isRight(), true);
          final value = result.fold(id, id);

          expect(
            value,
            unit,
          );
        },
      );

      test(
        'should return a StepFailure when DioError is thrown',
        () async {
          // arrange
          setUpHttpFailure();

          // act
          final result = await repository.createSteps(
            scenarioId,
            [mockStep],
            (sent, total) {},
          );

          // assert
          expect(result.isLeft(), true);

          final value = result.fold(id, id);

          expect(
            value,
            equals(const StepFailure.unexpected()),
          );
        },
      );
    });
  });
}
