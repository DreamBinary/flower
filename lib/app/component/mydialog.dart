import 'package:flower/app/component/next_page_row.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class ScrollDialog extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final String bgPath;
  final VoidCallback? onPressed;

  const ScrollDialog(
      {super.key,
      required this.title,
      required this.bgPath,
      required this.children,
      this.onPressed});

  @override
  State<ScrollDialog> createState() => _ScrollDialogState();
}

class _ScrollDialogState extends State<ScrollDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 550.h,
        width: 300.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkYellow, width: 2),
            image: DecorationImage(
                image: AssetImage(widget.bgPath), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 15.h),
                child: Text(
                  widget.title,
                  style: AppTS.fontSize24.copyWith(color: AppColors.darkRed),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.children,
                  ),
                ),
              ),
              NextPageRow(
                size: 15,
                onPressed: widget.onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  final String title;
  final Widget child;
  final String bgPath;

  const MyDialog({
    super.key,
    required this.title,
    required this.bgPath,
    required this.child,
  });

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 550.h,
        width: 300.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkYellow, width: 2),
            image: DecorationImage(
                image: AssetImage(widget.bgPath), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 15.h),
                child: Text(
                  widget.title,
                  style: AppTS.fontSize24.copyWith(color: AppColors.darkRed),
                ),
              ),
              Expanded(
                child: widget.child,
              ),
              const NextPageRow(size: 15)
            ],
          ),
        ),
      ),
    );
  }
}
