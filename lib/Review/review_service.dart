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
      dynamic isSecondTime = _sharedPreferences.getBool(KEY) as bool;
      if (isSecondTime != null && !isSecondTime) {
        _sharedPreferences.setBool(KEY, false);
        return false;
      } else if (isSecondTime != null && isSecondTime) {
        _sharedPreferences.setBool(KEY, false);
        return true;
      } else {
        _sharedPreferences.setBool(KEY, true);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> showRating() async {
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
