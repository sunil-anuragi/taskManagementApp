import 'package:jewellery/common/helper/app_preference_manager.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Utils {
  static final Utils _instance = Utils._internal();

  Utils._internal();

  factory Utils() {
    return _instance;
  }

  final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: AppColorConsts.primaryColor);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSnackBarWithoutScaffold(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: AppColorConsts.primaryColor);
    snackBarKey.currentState?.hideCurrentSnackBar();
    snackBarKey.currentState?.showSnackBar(snackBar);
  }

  void hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> connectSocket() async {
    final userUUID = AppPreferenceManager().getString("current_user_uuid");
    if (kDebugMode) {
      print('////////////////// Socket connection logged in : $userUUID');
    }

    //SocketManager.initialize(userUUID: userUUID ?? '');
  }
  String formattedTime(int time) // --> time in form of seconds
  {
    final int sec = time % 60;
    final int min = (time / 60).floor();
    return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
  }
}
