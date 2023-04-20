import 'package:gallery/keys.dart';
import 'package:gallery/main.dart';
import 'package:patrol/patrol.dart';

Future<void> startApp(PatrolTester $) async {
  await $.pumpWidgetAndSettle(const GalleryApp());
}

Future<void> enterMailSystem(PatrolTester $) async {
  await $(K.studyDemoList).tap();
  await $(K.email).waitUntilVisible();
}
