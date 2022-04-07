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
  "homescreen": {
    "hello_text": "Merhaba",
    "subtitle_text": "Bu hafta iş yaşam dengeniz nasıl?",
    "goodjob_text": "İyi iş {}!",
    "goodjob_subtitle_text": "Hayatınız gayet dengeli",
    "taskstitle": "İşleriniz",
    "taskssubtitle": "{} tarihi için {} işiniz var"
  },
  "dashboard": {
    "tasktitle": "İşleriniz",
    "taskssubtitle": "Toplamda {} tane iş bitirmişsiniz",
    "alertdialog": {
      "title": "Emin misiniz?",
      "subtitle": "Tamamlanmış tüm işleriniz silinecek. Bunun farkındasınız değil mi?",
      "delete": "Tamamlanmış tüm işleri sil!",
      "cancel": "Vazgeç"
    }
  },
  "profile": {
    "completed_text": "Tamamlanmış",
    "uncompleted_text": "Tamamlanmamış",
    "alltasks_text": "Tüm İşleriniz",
    "title": "Profil",
    "stats": "İstatistik"
  }
};
static const Map<String,dynamic> en = {
  "homescreen": {
    "hello_text": "Hello",
    "subtitle_text": "How is your work life balance this week?",
    "goodjob_text": "Good Job {}!",
    "goodjob_subtitle_text": "Your life is well-balanced",
    "taskstitle": "Your tasks",
    "taskssubtitle": "You have {} tasks for {} {}"
  },
  "dashboard": {
    "tasktitle": "Your tasks",
    "taskssubtitle": "You have {} tasks completed all time",
    "alertdialog": {
      "title": "Are you sure?",
      "subtitle": "You do realize that all todos you complete will be deleted, right?",
      "delete": "Delete completed todos!",
      "cancel": "Cancel"
    }
  },
  "profile": {
    "completed_text": "Completed",
    "uncompleted_text": "Uncomplete",
    "alltasks_text": "All Tasks",
    "title": "Profile",
    "stats": "Statistics"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
