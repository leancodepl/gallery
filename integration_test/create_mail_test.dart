import 'src/common_methods.dart';
import 'package:patrol/patrol.dart';
import 'package:gallery/keys.dart';

void main() {
  patrolTest('Create new mail', nativeAutomation: true, ($) async {
    await startApp($);
    await enterMailSystem($);
    await $(K.ReplyFab).tap();
    await $(K.subjectTextField).enterText('Lorem ipsum');
    await $(K.mailTextContent).enterText('Lorem ipsum');
    await $(K.mailSendButton).tap();
    await $(K.email).waitUntilVisible();
  });
}
