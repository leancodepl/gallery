import 'package:gallery/keys.dart';
import 'package:gallery/main.dart';
import 'package:patrol/patrol.dart';

Future<void> startApp(PatrolTester $) async {
  await $.pumpWidgetAndSettle(const GalleryApp());
}

<<<<<<< Updated upstream
Future<void> enterMailSystem(PatrolTester $) async {
  await $(K.studyDemoList).tap();
  await $(K.email).waitUntilVisible();
}
=======
Future<void> navigateToEmail(PatrolTester $) async {
  await $(K.studyDemoList).tap();
  await $(K.email).waitUntilVisible();
}
>>>>>>> Stashed changes
