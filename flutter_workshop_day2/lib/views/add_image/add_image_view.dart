library add_image_view;

import 'package:flutter/material.dart';
import 'package:flutter_workshop_day2/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'add_image_view_model.dart';

part 'add_image_mobile.dart';
part 'add_image_tablet.dart';
part 'add_image_desktop.dart';

class AddImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddImageViewModel>.reactive(
      viewModelBuilder: () => AddImageViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (BuildContext context, AddImageViewModel viewModel, Widget child) {
        return ScreenTypeLayout(
          mobile: _AddImageMobile(viewModel),
          desktop: _AddImageDesktop(viewModel),
          tablet: _AddImageTablet(viewModel),  
        );
      }
    );
  }
}
