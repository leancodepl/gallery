import 'src/common_methods.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('Starting application', nativeAutomation: true, ($) async {
    await startAppTest($);
  });
}