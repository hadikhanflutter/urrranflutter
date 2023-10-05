import 'package:codingsq/apis/products/utilities/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RestApiUtilities {
  static String url = 'https://fakestoreapi.com/'; //production url
  static final product_url = "${url}products"; // dev...

  static final error_404 = "Resource not found";
  static final error_401 = "Unathorized error";
  static final error_time_out = "time out error";
  static final error_internet_issue = " connect with internet";
  static final error_unknown = "unknown Error";

  static String GetresponseError(int status) {
    switch (status) {
      case 404:
        return error_404;
      case 401:
        return error_401;
      case 420:
        return error_time_out;
      case 430:
        return error_internet_issue;

      default:
        return error_unknown;
    }
  }

  static void GetPrintHeaderBodyUrlResponse(url, header, body, response) {
    print('GetResponse: url : $url');
    print('GetResponse: header : $header');
    print('GetResponse: body : $body');
    print('GetResponse: response : ${response.statusCode},${response.body}');
  }

  static Widget ShowLoadingView(BuildContext, context) {
    return Container(
      width: 145,
      height: 145,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Lottie.asset(AppAssets.loading_view),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Loading Data',
          )
        ],
      ),
    );
  }

  static ShowLoadingViewDialog(BuildContext, context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: ShowLoadingView(BuildContext, context),
      ),
    );
  }

  static ShowMessageView(BuildContext, context, String path, String title) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Lottie.asset(path),
          ),
          SizedBox(
            height: 20,
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  static ShowErrorWithReloadView(
      BuildContext, context, String path, String title, onTapp) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ShowMessageView(
            BuildContext,
            context,
            path,
            title,
          ),
          TextButton(
            onPressed: onTapp,
            child: Text('Reload'),
          ),
        ],
      ),
    );
  }
}
