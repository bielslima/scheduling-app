import 'package:flutter/material.dart';
import 'package:scheduling_app/src/presentation/constants/app_colors.dart';

class ScButton extends StatelessWidget {
  final bool loading;
  final bool disabled;
  final Function()? onTap;
  final Widget child;

  const ScButton({
    Key? key,
    required this.child,
    this.disabled = false,
    this.loading = false,
    this.onTap,
  }) : super(key: key);

  MaterialStateProperty<EdgeInsetsGeometry?>? paddingBtn() {
    if (!loading) {
      return MaterialStateProperty.all(
        const EdgeInsets.all(
          16,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading || disabled ? null : onTap,
      style: ButtonStyle(
        enableFeedback: false,
        padding: paddingBtn(),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(
          disabled ? const Color(0xffE6E6E6) : AppColors.primary,
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => AppColors.primaryGrey,
        ),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<MaterialState> states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: loading
          ? const Padding(
              padding: EdgeInsets.all(14),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : child,
    );
  }
}
