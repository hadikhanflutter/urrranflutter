import 'package:apiswork/apis/utilities/rest_api_utilities.dart';
import 'package:http/http.dart' as http;

import '../model/model_post.dart';

class NamazApiServices {
  static var client = http.Client();
  static List<Datum> listName = [];
  static List<Datum> listDate = [];

  static Future<List<Datum>> loadPrayerTiming() async {
    final response = await http.get(Uri.parse(RestApiUtilites().product_url));

    if (response.statusCode == 200) {
      PrayersTiming prayersTiming = prayersTimingFromMap(response.body);

      return prayersTiming.data!;
    } else {
      return listName;
    }
  }

  static Future<List<Datum>> loadprayerTimingDate() async {
    final response = await http.get(Uri.parse(RestApiUtilites().product_url));
    if (response.statusCode == 200) {
      PrayersTiming prayersTimingDate = prayersTimingFromMap(response.body);

      return prayersTimingDate.data!;
    } else {
      return listDate;
    }
  }
}
