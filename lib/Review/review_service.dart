import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/provider/shared_prefences_helper.dart';

const KEY = 'FIRST_TIME_OPEN';

class ReviewService {
  late SharedPreferences _sharedPreferences;

  final InAppReview _inAppReview = InAppReview.instance;
  Future<bool> isSecondTimeOpen() async {
    _sharedPreferences = await SharedPreferencesHelper.instance;
    try {
      dynamic isSecondTime = _sharedPreferences.getBool(KEY);
      if (isSecondTime != null && !isSecondTime) {
        print('1. if');
        _sharedPreferences.setBool(KEY, false);
        return false;
      } else if (isSecondTime != null && isSecondTime) {
        print('2. if');
        _sharedPreferences.setBool(KEY, false);
        return true;
      } else {
        print('1. else');
        _sharedPreferences.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      print('hata : ${e.toString()}');
      return false;
    }
  }

  Future<bool> showRating() async {
    print('shoe calisti');
    try {
      final available = await _inAppReview.isAvailable();
      if (available) {
        _inAppReview.requestReview();
      } else {
        _inAppReview.openStoreListing(
          appStoreId: 'com.yagizdokumaci.todomoon',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
