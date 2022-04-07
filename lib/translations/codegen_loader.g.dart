// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "hellotext": "Merhaba",
  "goodjobtext": "İyi iş",
  "taskstitle": "Bugün ki işleriniz",
  "taskcount": "{} için {} işiniz var",
  "lifebalancedtext": "Hayatınız dengeli",
  "homesubtıtle": "Bu hafta iş yaşam dengeniz nasıl?",
  "dasboard": {
    "tasks": "Tamamlanan görevleriniz",
    "subtitle": "Toplamda {} adet görev bitirdiniz"
  }
};
static const Map<String,dynamic> en = {
  "hellotext": "Hello",
  "goodjobtext": "Good Job",
  "taskstitle": "Your tasks",
  "taskcount": "You have {} tasks for {} ",
  "lifebalancedtext": "Your life is well-balanced",
  "homesubtıtle": "How is your work life balance this week?",
  "dasboard": {
    "tasks": "Your tasks",
    "subtitle": "You have {} tasks completed all time"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
