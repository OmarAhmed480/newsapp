import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/provider/app_language_provider.dart';
import 'package:newsapp/provider/app_them_provider.dart';
import 'package:newsapp/ui/home/homeScreen.dart';
import 'package:newsapp/ui/splashScreen/splash_Screen.dart';
import 'package:newsapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
        ChangeNotifierProvider(create: (context) => AppThemProvider(),),

      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(393, 852),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: AppRoutes.splashRouteName,
        routes: {
         AppRoutes.splashRouteName: (context) => SplashScreen(),
          AppRoutes.homeRouteName: (context) => HomeScreen(),
        },

        locale: Locale(languageProvider.appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

 Future<void>  initSharedPreferences() async {

    var themProvider  =Provider.of<AppThemProvider>(context,listen: false);
    var languageProvider= Provider.of<AppLanguageProvider>(context,listen: false);

   await themProvider.loadThem();
   await languageProvider.loadLanguage();

 }
}
