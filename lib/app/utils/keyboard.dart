import 'package:flutter/cupertino.dart';

class KeyboardUtils {
  static hideKeyboard(BuildContext context) {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    //   FocusManager.instance.primaryFocus?.unfocus();
    // }

    // SystemChannels.textInput.invokeMethod('TextInput.hide');
    //
    FocusNode blankNode = FocusNode(); //空白焦点
    FocusScope.of(context).requestFocus(blankNode); //指定为空白焦点
  }
}
