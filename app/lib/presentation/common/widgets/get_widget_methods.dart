import 'package:flutter/material.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';

/// Returns an [Icons] identifier based on the provided [status].
IconData getProjectStatusIcon(Status status) {
  switch (status) {
    case Status.inProgress:
      return Icons.hourglass_bottom;
    case Status.inReview:
      return Icons.update;
    case Status.finished:
      return Icons.check;
  }
}
