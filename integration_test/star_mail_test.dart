import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Star mail message', nativeAutomation: true, ($) async {
    await startFlutterGallery($);
    await navigateToEmail($);
    await $(K.email).tap();
    final deletedSubject =
        $(K.emailSubject).evaluate().first.widget as SelectableText;
    final subjectText = deletedSubject.data;
    await $(K.starEmailButton).tap();
    await $(K.replyExit).tap();
    await $(K.inboxList).tap();
    await $(K.inboxListTiles).containing('Starred').tap();
    expect($(subjectText), findsOneWidget);
  });
}
