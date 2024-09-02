import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../controller/chnageLanguageController.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
enum Language  {English, spanish, urdu}
class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepPurpleAccent,
        title: Text(AppLocalizations.of(context)!.hello, style: TextStyle(
          color: Colors.white
        ),),
        actions: [
         Consumer <ChangeLanguageController>(
             builder: (context, provider, child){
               return  PopupMenuButton(
                   onSelected: (Language item){
                     if(Language.English.name == item.name){
                       provider.changeLanguage(Locale('en'));
                     }
                     else if(Language.urdu.name == item.name){
                       provider.changeLanguage(Locale('ur'));
                     }
                     else{
                       provider.changeLanguage(Locale('es'));
                     }
                   },
                   itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                     const PopupMenuItem<Language>(
                       value: Language.English,
                       child: Text('English'),
                     ), const PopupMenuItem<Language>(
                       value: Language.spanish,
                       child: Text('Spanish'),
                     ),
                     const PopupMenuItem<Language>(
                       value: Language.urdu,
                       child: Text('Urdu'),
                     ),
                   ]
               );
             })

        ],
      ),
      body: Column(
        children: [
          Text(AppLocalizations.of(context)!.hello)
        ],
      ),
    );
  }
}
