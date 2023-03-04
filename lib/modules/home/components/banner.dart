import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/eazy_spaces.dart';
import 'CarouselImage.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 150,
        width: double.infinity,
        child:  Carousel());
  }
}
