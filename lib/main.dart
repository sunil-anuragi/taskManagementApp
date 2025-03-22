import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jewellery/base/base_bloc.dart';
import 'package:jewellery/base/base_state.dart';
import 'package:jewellery/common/helper/route/route_manager.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/route_const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await FCMManager().initializeMain();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const App(),
  );
}
class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<App> with WidgetsBindingObserver {
  // Future<void>? loadAsync;
  // AppLinks? _appLinks;
  // StreamSubscription<Uri>? _linkSubscription;
  // final box = GetStorage();

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addObserver(this);
  //   // applinks
  //   initDeepLinks();
  //   // for using snack-bar & other features
  //   Utils();
  //   // setup preferences
  //   AppPreferenceManager().init();
  //   // localization
  //   // loadAsync = AppI18n.loadTranslations();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _linkSubscription?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // scaffoldMessengerKey: Utils().snackBarKey,
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

  // Future<void> initDeepLinks() async {
  //   while (box.read(AppPrefKeys.accessToken) == null) {
  //     await Future.delayed(const Duration(milliseconds: 100));
  //   }
  //   _appLinks = AppLinks();
  //   _linkSubscription = _appLinks!.uriLinkStream.listen((uri) {
  //     // Get.snackbar(uri.toString(), "");
  //     debugPrint('onAppLink: $uri ');
  //     openAppLink(uri);
  //   });
  // }

  // Future<void> openAppLink(Uri uri) async {
  //   final accessToken = await box.read(AppPrefKeys.accessToken);
  //   if (accessToken == null) {
  //     debugPrint("Access token is null.");
  //     // Handle the case when the token is not available
  //     Get.snackbar("Error", "Access token not available.");
  //     return;
  //   }
  //   // Get.snackbar(uri.pathSegments.last, "");
  //   Get.toNamed(RouteConst.productDetailsScreen,
  //       arguments: {"id": uri.pathSegments.last, "type": 1});
  // }

}
