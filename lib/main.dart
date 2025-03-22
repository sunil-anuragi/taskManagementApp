import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:jewellery/base/base_bloc.dart';
import 'package:jewellery/base/base_state.dart';
import 'package:jewellery/common/helper/route/route_manager.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/route_const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConst.splashScreen,
      getPages: AppRouteManager.pages,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      theme: ThemeData(
          bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
              color: AppColorConsts.transparentColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColorConsts.transparentColor,
                  statusBarBrightness: Brightness.dark),
              elevation: 0)),
    );
  }

  Widget loader() {
    return const Scaffold(
        body: Center(
            child:
                CircularProgressIndicator(color: AppColorConsts.primaryColor)));
  }

  @override
  BaseBloc? getBaseBloc() {
    return null;
  }
}
