import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/value_objects.dart';

part 'scenario_dto.freezed.dart';
part 'scenario_dto.g.dart';

@freezed
class ScenarioDto with _$ScenarioDto {
  const ScenarioDto._();

  const factory ScenarioDto({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required String owner,
    required bool isOwner,
    required int stepCount,
    required String status,
    required int duration,
    String? url,
    String? thumbnail,
    String? description,
  }) = _ScenarioDto;

  Scenario toDomain() {
    return Scenario(
      id: id,
      name: ScenarioName(name),
      createdAt: createdAt,
      updatedAt: updatedAt,
      owner: owner,
      isOwner: isOwner,
      stepCount: stepCount,
      status: Status.values.firstWhere(
        (e) => describeEnum(e).toLowerCase() == status.toLowerCase(),
      ),
      duration: duration,
      url: url,
      thumbnail: thumbnail,
      description:
          description != null ? ScenarioDescription(description!) : null,
    );
  }

  factory ScenarioDto.fromDomain(Scenario scenario) {
    return ScenarioDto(
      id: scenario.id,
      name: scenario.name.getOrCrash(),
      createdAt: scenario.createdAt,
      updatedAt: scenario.updatedAt,
      owner: scenario.owner,
      isOwner: scenario.isOwner,
      stepCount: scenario.stepCount,
      status: scenario.status.name,
      duration: scenario.duration,
      url: scenario.url,
      thumbnail: scenario.thumbnail,
      description: scenario.description?.getOrCrash(),
    );
  }

  factory ScenarioDto.fromJson(Map<String, dynamic> json) =>
      _$ScenarioDtoFromJson(json);
}
