import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Shopping cart system', nativeAutomation: true, ($) async {
    await startFlutterGallery($);
    await $(K.shrineAppTab)
        .scrollTo(scrollable: $(K.studyDemoList).$(Scrollable));
    await $.pumpAndSettle();
    await $(K.shrineAppTab).tap();
    await $(K.shrineUsernameField).enterText('123');
    await $(K.shrinePasswordField).enterText('123');
    await $('NEXT').tap();
    await testCartForEachCategory($);
  });
}

Future<void> testCartForEachCategory(PatrolTester $) async {
  final shoppingCategories = ['ACCESSORIES', 'CLOTHING', 'HOME'];
  for (int i = 0; i < shoppingCategories.length; i++) {
    await $(K.shrineContextMenu).tap();
    await $(shoppingCategories[i]).tap();
    final accesoryProduct = $(K.productStackList).at(0).$(K.productItem).text;
    await $(K.productStackList).at(0).tap();
    await $(K.shoppingCartButton).tap();
    expect($(accesoryProduct), findsAtLeastNWidgets(2));
    await $(K.shoppingCartReturn).tap();
  }
}
