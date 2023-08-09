import 'package:flutter/material.dart';

class CustomLoader
{
  static Future<void> showLoader({
    required BuildContext context,
    required Future<dynamic> future,
    Widget? loadingWidget,
    bool isImageUpload = false,
  }) async {
    showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0.7,),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: loadingWidget ?? const CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Handle error if needed
              return const Center(
                child: Text('Error occurred!'),
              );
            } else {
              if (isImageUpload) {
                return Container();
              } else {
                Navigator.pop(context);
              }
              return Container();
            }
          },
        );
      },
    );
  }

  static void goToPage({
    required BuildContext context,
    required Widget widget,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
