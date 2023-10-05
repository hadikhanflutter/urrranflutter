import 'package:apiswork/apis/utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RestApiUtilites {
  static String Url =
      'http://api.aladhan.com/v1/calendarByCity/2017/4?city=Abbottabad&country=Pakistan&method';
  final product_url = '${Url}=2';

  static Widget ShowLoadingView(BuildContext, context, String loading) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Lottie.asset(AppAssets.loading),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Loading'),
        ],
      ),
    );
  }
}
