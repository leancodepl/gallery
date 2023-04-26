import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Shopping cart system', nativeAutomation: true, ($) async {
    await startFlutterGallery($);
    await testShrineLoginSystem($);
    await testCartForEachCategory($);
    await testBasketProductRemoval($);
    await testBasketClear($);
    await $(K.shoppingCartReturn).tap();
    await $(K.shrineContextMenu).tap();
    await $('LOGOUT').tap();
  });
}

Future<void> testShrineLoginSystem(PatrolTester $) async {
  await $(K.shrineAppTab)
      .scrollTo(scrollable: $(K.studyDemoList).$(Scrollable));
  await $.pumpAndSettle();
  await $(K.shrineAppTab).tap();
  await $(K.shrineUsernameField).enterText('123');
  await $(K.shrinePasswordField).enterText('123');
  await $('NEXT').tap();
}

Future<void> testCartForEachCategory(PatrolTester $) async {
  final shoppingCategories = ['ACCESSORIES', 'CLOTHING', 'HOME'];
  for (int i = 0; i < shoppingCategories.length; i++) {
    await $(K.shrineContextMenu).tap();
    await $(shoppingCategories[i]).tap();
    final firstCategoryProduct =
        $(K.productStackListTile).at(0).$(K.basketItemName).text;
    await $(K.productStackListTile).at(0).tap();
    await $(K.shoppingCartButton).tap();
    await $(K.shoppingCartItemTile).$(firstCategoryProduct).waitUntilVisible();
    await $(K.shoppingCartReturn).tap();
  }
}

Future<void> testBasketProductRemoval(PatrolTester $) async {
  await $(K.shoppingCartButton).tap();
  final basketProduct =
      $(K.shoppingCartItemTile).evaluate().first.widget as SelectableText;
  final deletedProduct = basketProduct.data;
  await $(K.removeBasketProductButton).tap();
  expect($(deletedProduct), findsNothing);
}

Future<void> testBasketClear(PatrolTester $) async {
  await $(K.clearBasketButton).tap();
  await $(K.shoppingCartButton).tap();
  expect($(K.shoppingCartItemTile), findsNothing);
}
