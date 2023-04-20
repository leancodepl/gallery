import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Create new mail', nativeAutomation: true, ($) async {
    await startApp($);
    await navigateToEmail($);
    await $(K.email).tap();
    final deletedSubject =
        $(K.emailSubject).evaluate().first.widget as SelectableText;
    final subjectText = deletedSubject.data;
    await $(K.starEmailButton).tap();
    await $(K.mailBackButton).tap();
    await $(K.inboxList).tap();
    await $(K.inboxListTiles).at(1).tap();
    expect($(subjectText), findsOneWidget);
  });
}
