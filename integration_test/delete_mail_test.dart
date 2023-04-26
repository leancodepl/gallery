import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Delete existing mail', nativeAutomation: true, ($) async {
    await startFlutterGallery($);
    await navigateToEmail($);
    await $(K.email).tap();
    final deletedSubject =
        $(K.emailSubject).evaluate().first.widget as SelectableText;
    final subjectText = deletedSubject.data;
    await $(K.deleteMessage).tap();
    expect($(subjectText), findsNothing);
    await $(K.inboxList).tap();
    await $(K.inboxListTiles).containing('Bin').tap();
    await $(subjectText).waitUntilVisible();
    await $(K.email).waitUntilVisible();
  });
}
