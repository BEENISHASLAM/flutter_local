import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/homeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'controller/chnageLanguageController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> ChangeLanguageController())
        ],
      child: Consumer<ChangeLanguageController>(
        builder:(context, provider, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              locale:provider.appLocale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                Locale('en'),
                Locale('es'),
                Locale('ur'),
              ],
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Homescreen()
          );
        }
      )
    );
  }
}


