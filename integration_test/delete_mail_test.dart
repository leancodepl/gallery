import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/studies/rally/formatters.dart';
import 'package:patrol/patrol.dart';
import 'src/common_methods.dart';
import 'package:gallery/keys.dart';

void main() {
  patrolTest('Delete existing mail', nativeAutomation: true, ($) async {
    await startAppTest($);
    await navigateToEmail($);
    await $(K.email).tap();
    final deletedSubject =
        $(K.emailSubject).evaluate().first.widget as SelectableText;
    final subjectText = deletedSubject.data;
    await $(K.deleteMessage).tap();
    expect($(subjectText), findsNothing);
    await $(K.inboxList).tap();
    await $(K.inboxListTiles).at(3).tap();
    expect($(subjectText), findsOneWidget);
    await $(K.email).waitUntilVisible();
  });
}
