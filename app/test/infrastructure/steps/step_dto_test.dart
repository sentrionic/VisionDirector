import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/infrastructure/common/media_dto.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tStepDto = StepDto(
    id: "e371b735-7153-47df-b140-3ff51e7325be",
    name: "Join Project",
    createdAt: "2022-01-27T14:32:17.931842+01:00",
    updatedAt: "2022-01-31T16:09:41.260692+01:00",
    duration: 5,
    position: 2,
    isLocked: false,
    isCompleted: false,
    transition: "None",
    media: MediaDto(
      fileUrl:
          "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-27_14-32-17.jpg",
      fileName: "join-project_2022-01-27_14-32-17.jpg",
      mimeType: "image/jpg",
    ),
    audio: MediaDto(
      fileUrl:
          "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-31_16-09-41.aac",
      fileName: "join-project_2022-01-31_16-09-41.aac",
      mimeType: "audio/mp3",
    ),
    thumbnail:
        "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-27_14-32-17.jpg",
  );

  final tStep = Step(
    id: "e371b735-7153-47df-b140-3ff51e7325be",
    name: StepName("Join Project"),
    createdAt: "2022-01-27T14:32:17.931842+01:00",
    updatedAt: "2022-01-31T16:09:41.260692+01:00",
    duration: const Duration(seconds: 5),
    position: 2,
    isLocked: false,
    isCompleted: false,
    transition: StepTransition.none,
    media: const Media(
      fileUrl:
          "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-27_14-32-17.jpg",
      fileName: "join-project_2022-01-27_14-32-17.jpg",
      mimeType: "image/jpg",
    ),
    audio: const Media(
      fileUrl:
          "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-31_16-09-41.aac",
      fileName: "join-project_2022-01-31_16-09-41.aac",
      mimeType: "audio/mp3",
    ),
    thumbnail:
        "http://192.168.2.123:5000/media/096035bd-1ba7-49b3-ad31-3b00cb3476b0/41654356-5107-4899-b0c8-bb5f26c4b7ec/join-project_2022-01-27_14-32-17.jpg",
  );

  group('StepDto.fromJson', () {
    test(
      'should return a valid DTO when the JSON is valid',
      () async {
        // arrange
        final jsonMap = json.decode(fixture('step.json'));

        // act
        final result = StepDto.fromJson(jsonMap);

        // assert
        expect(result, tStepDto);
      },
    );

    test(
      'should return a domain model from the StepDto',
      () async {
        // arrange
        final jsonMap = json.decode(fixture('step.json'));

        // act
        final result = StepDto.fromJson(jsonMap);

        // assert
        expect(result.toDomain(), tStep);
      },
    );
  });
}
