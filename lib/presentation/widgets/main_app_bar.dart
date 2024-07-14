import 'package:flutter/material.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final List<Widget>? actions;

  final Widget? leading;

  final bool isSmallText;

  const MainAppBar(
      {super.key,
      this.title,
      this.actions,
      this.leading,
      this.isSmallText = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: title != null
            ? CustomText(
                title!,
                style: isSmallText
                    ? AppTextStyles.appbarTitleMedium
                    : AppTextStyles.appbarTitle,
              )
            : Image.asset(
                'assets/images/logo.png',
                height: 40,
                width: 100,
              ),
        centerTitle: false,
        leading: leading,
        actions: actions,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.darkBlue,
                AppColors.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
    );
  }
}
