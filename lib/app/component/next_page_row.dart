import 'package:flower/app/theme/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'more_button.dart';

class NextPageRow extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;

  const NextPageRow({this.onPressed, this.size = 20, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MoreButton(
              text: AppString.nextPage, size: size, onPressed: onPressed),
          SizedBox(width: 20.w)
        ],
      ),
    );
  }
}
