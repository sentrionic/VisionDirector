import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBoxes {
  static const onboardingBox = "onboarding";
  static const onboardingTimeline = "onboarding-timeline";
  static const onboardingEditor = "onboarding-editor";
  static const onboardingPreview = "onboarding-preview";
}

Future<void> setupHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(HiveBoxes.onboardingBox);
}
