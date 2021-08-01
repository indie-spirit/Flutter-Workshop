import 'package:flutter/cupertino.dart';
import 'package:flutter_workshop_day2/views/add_image/add_image_view.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_workshop_day2/core/logger.dart';

class HomeViewModel extends BaseViewModel {
  Logger log;

  HomeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  navigateToAddImage(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => AddImageView(),
      ),
    );
  }
}
