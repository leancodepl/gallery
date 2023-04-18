import 'src/common_methods.dart';
import 'package:patrol/patrol.dart';
import 'package:gallery/keys.dart';

void main() {
  patrolTest('Create new mail', nativeAutomation: true, ($) async {
    await startAppTest($);
    await $(K.studyDemoList).tap();
    await $(K.mailList).waitUntilVisible();
    await $(K.createMailButton).tap();
    await $(K.subjectTextField).enterText('Lorem ipsum');
    await $(K.mailTextContent).enterText('Lorem ipsum');
    await $(K.mailSendButton).tap();
    await $(K.mailList).waitUntilVisible();
  });
}
