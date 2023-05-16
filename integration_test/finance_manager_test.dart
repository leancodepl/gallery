import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Test Navigation in finance manager', nativeAutomation: true,
      ($) async {
    await startFlutterGallery($);
    await testRallyLoginSystem($);
    await testRallyOvervierviewCategory($);
    await $(K.financeCategoryMenu).at(1).tap();
    await testCategory($);
    await swipeUntilVisible(
        $: $,
        finder: $('BILLS'),
        view: $(TabBarView),
        step: const Offset(-300, 0));
    await testCategory($);
    await swipeUntilVisible(
        $: $,
        finder: $('BUDGETS'),
        view: $(TabBarView),
        step: const Offset(-300, 0));
    await testCategory($);
  });
}

Future<void> testRallyLoginSystem(PatrolTester $) async {
  await $(K.rallyAppTab).scrollTo(scrollable: $(K.studyDemoList).$(Scrollable));
  await $.pumpAndSettle();
  await $(K.rallyAppTab).tap();
  await $(K.rallyUsernameField).enterText('123');
  await $(K.rallyPasswordField).enterText('123');
  await $(K.rallyLoginButton).tap();
}

Future<void> testRallyOvervierviewCategory(PatrolTester $) async {
  await $('Accounts').scrollTo();
  await $('Bills').scrollTo();
  await $('Budgets').scrollTo();
}

Future<void> testCategory(PatrolTester $) async {
  final centralAmount =
      $(K.totalCenterAmount).evaluate().first.widget as SelectableText;
  final totalValue =
      double.parse(centralAmount.data!.substring(1).replaceAll(',', ''))
          .floorToDouble();
  double valuesSum = 0;
  final maxElementsValue = $(K.singleValueInList).evaluate().length;
  for (int i = 0; i < maxElementsValue; i++) {
    final singleAmount = double.parse(
        $(K.singleValueInList).at(i).text!.substring(1).replaceAll(',', ''));
    valuesSum += singleAmount;
  }
  print(valuesSum.floorToDouble());
  if (valuesSum.floorToDouble() != totalValue) {
    throw Exception('Total value not legitemate with summary values');
  }
}

Future<void> swipeUntilVisible({
  required PatrolTester $,
  required Finder finder,
  required Finder view,
  int maxIteration = 100,
  Offset step = const Offset(-200, 0),
  Duration duration = const Duration(milliseconds: 100),
}) async {
  var viewPatrolFinder = $(view);
  viewPatrolFinder = (await viewPatrolFinder.waitUntilVisible()).first;
  var iterationsLeft = maxIteration;
  while (iterationsLeft > 0 && finder.hitTestable().evaluate().isEmpty) {
    await $.tester.drag(viewPatrolFinder, step);
    await $.pumpAndSettle();
    iterationsLeft -= 1;
  }
}
