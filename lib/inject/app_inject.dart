

import 'package:chat_app/inject/auth_inject.dart';
import 'package:chat_app/inject/message_inject.dart';

class AppInject{

      static injectAll() async {
          await AuthInject.injectAll();
          await MessageInject.injectAll();
      }
}