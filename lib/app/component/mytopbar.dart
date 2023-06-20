import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTopBar extends StatefulWidget implements PreferredSizeWidget {
  final ImageProvider? backgroundImage;
  final Widget? middle;
  final Widget? trailing;
  final Color? foregroundColor;

  const MyTopBar({
    super.key,
    this.middle,
    this.trailing,
    this.foregroundColor,
    this.backgroundImage,
  });

  @override
  State<MyTopBar> createState() => _MyTopBarState();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}

class _MyTopBarState extends State<MyTopBar> {
  @override
  Widget build(BuildContext context) {
    var parentRoute = ModalRoute.of(context);
    var haveParent = (parentRoute?.canPop ?? false) ||
        (parentRoute?.impliesAppBarDismissal ?? false);
    return Container(
      decoration: BoxDecoration(
          image: widget.backgroundImage == null
              ? null
              : DecorationImage(
                  image: widget.backgroundImage!, fit: BoxFit.fill)),
      child: SafeArea(
        child: NavigationToolbar(
            leading: haveParent ? const MyBackButton() : null,
            middle: widget.middle,
            trailing: widget.trailing),
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        splashRadius: 24,
        color: color,
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else {
            Navigator.maybePop(context);
          }
        },
      ),
    );
  }
}
