import 'package:patrol/patrol.dart';
import 'package:gallery/main.dart';
import 'package:gallery/keys.dart';
import 'package:flutter/foundation.dart';

Future<void> startAppTest(PatrolTester $) async {
  await $.pumpWidgetAndSettle(const GalleryApp());
}
