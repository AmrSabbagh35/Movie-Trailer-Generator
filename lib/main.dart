import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_ui/assets.dart';
import 'package:video_ui/translations/codegen_loader.g.dart';
import 'dart:async';
import 'screens/Homescreen.dart';

Future<void> main() async {
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyLocalization(
        path: 'assets/translations',
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        useFallbackTranslations: true,
        fallbackLocale: Locale('en'),
        startLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#121212"),
        dividerTheme: DividerThemeData(
          color: Colors.white,
          thickness: 2,
          endIndent: 10,
          indent: 10,
        ),
        textTheme: TextTheme(),
      ),
      // theme: ThemeData(
      //     textTheme: TextTheme(
      //         bodyText1: TextStyle(fontSize: 3, color: Colors.white))),
      builder: (context, navigator) {
        var lang = Localizations.localeOf(context).languageCode;
        return Theme(
          data: ThemeData(fontFamily: lang == 'ar' ? 'Taj' : 'Bebu'),
          child: navigator,
        );
      },
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Video Trailer UI',
      home: AnimatedSplashScreen(
        splash: Assets.cut,
        splashTransition: SplashTransition.fadeTransition,
        centered: true,
        backgroundColor: HexColor("#121212"),
        animationDuration: Duration(
          seconds: 1,
        ),
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 300,
        nextScreen: Homescreen(),
      ),
    );
  }
}
