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
    },
    "title": "Panel"
  },
  "profile": {
    "completed_text": "Tamamlanmış",
    "uncompleted_text": "Tamamlanmamış",
    "alltasks_text": "Tüm İşleriniz",
    "title": "Profil",
    "stats": "İstatistik"
  },
  "changename": {
    "name_tf": "İsim",
    "surname_tf": "Soyad",
    "title": "İsminizi Değiştirin",
    "cancel_btn": "Vazgeç",
    "done_btn": "Değiştir"
  },
  "addtodo": {
    "title": "İş Ekle",
    "title_tf": "Başlık",
    "desc_tf": "Açıklama",
    "category_tf": "Kategori",
    "date": "Tarih Seçin\nVarsayılan Tarih: {}",
    "time": "Saat Seçin\nVarsayılan Saat: {}",
    "add_btn": "İş Ekle",
    "cancel_btn": "Vazgeç",
    "selected": "Seçilen {}",
    "error_text": "Lütfen {} giriniz"
  },
  "edittodo": {
    "title": "İşi Düzenle",
    "title_tf": "Başlık",
    "category_tf": "Kategori",
    "desc_tf": "Açıklama",
    "selecteddate": "Seçilen Tarih : {}",
    "selectedtime": "Seçilen Saat : {}",
    "default_date": "Varsayılan Tarih : {}",
    "default_time": "Varsayılan Saat : {}",
    "edit_btn": "Düzenlemeyi bitir",
    "close_btn": "Kapat"
  },
  "welcomescreen": {
    "title": "Hoşgeldin",
    "subtitle": "Size hitap etmek için lütfen adınızı ve soyadınızı belirtin",
    "done_button": "Tamam",
    "name_tf": "İsim",
    "surname_tf": "Soyad"
  }
};
static const Map<String,dynamic> en = {
  "homescreen": {
    "hello_text": "Hello",
    "subtitle_text": "How is your work life balance this week?",
    "goodjob_text": "Good Job {}!",
    "goodjob_subtitle_text": "Your life is well-balanced",
    "taskstitle": "Your tasks",
    "taskssubtitle": "You have {} tasks for {}"
  },
  "dashboard": {
    "tasktitle": "Your tasks",
    "taskssubtitle": "You have {} tasks completed all time",
    "alertdialog": {
      "title": "Are you sure?",
      "subtitle": "You do realize that all todos you complete will be deleted, right?",
      "delete": "Delete completed todos!",
      "cancel": "Cancel"
    },
    "title": "Dashboard"
  },
  "profile": {
    "completed_text": "Completed",
    "uncompleted_text": "Uncomplete",
    "alltasks_text": "All Tasks",
    "title": "Profile",
    "stats": "Statistics"
  },
  "changename": {
    "name_tf": "Name",
    "surname_tf": "Surname",
    "title": "Change Name",
    "cancel_btn": "Cancel",
    "done_btn": "Done"
  },
  "addtodo": {
    "title": "Add Todo",
    "title_tf": "Title",
    "desc_tf": "Description",
    "category_tf": "Category",
    "date": "Select Date\nDefault Date: {}",
    "time": "Select Time\nDefault Time : {}",
    "add_btn": "Add Todo",
    "cancel_btn": "Cancel",
    "selected": "Selected {}",
    "error_text": "Please enter {}"
  },
  "edittodo": {
    "title": "Edit Task",
    "title_tf": "Title",
    "category_tf": "Category",
    "desc_tf": "Description",
    "selecteddate": "Selected Date : {}",
    "selectedtime": "Selected Time : {}",
    "default_date": "Default Date : {}",
    "default_time": "Default Time : {}",
    "edit_btn": "Finish editing",
    "close_btn": "Close"
  },
  "welcomescreen": {
    "title": "Welcome",
    "subtitle": "Please provide your name and surname to address you",
    "done_button": "Done",
    "name_tf": "Name",
    "surname_tf": "Surname"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
