import 'package:gallery/keys.dart';
import 'package:patrol/patrol.dart';

import 'src/common_methods.dart';

void main() {
  patrolTest('Create new mail', nativeAutomation: true, ($) async {
<<<<<<< Updated upstream
    await startApp($);
    await enterMailSystem($);
    await $(K.replyFab).tap();
=======
    await startAppTest($);
    await navigateToEmail($);
    await $(K.ReplyFab).tap();
>>>>>>> Stashed changes
    await $(K.subjectTextField).enterText('Lorem ipsum');
    await $(K.mailTextContent).enterText('Lorem ipsum');
    await $(K.mailSendButton).tap();
    await $(K.email).waitUntilVisible();
  });
}
