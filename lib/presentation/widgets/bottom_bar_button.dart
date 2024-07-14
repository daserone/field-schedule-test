import 'package:flutter/material.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class BottomBarButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final bool isActive;
  final Function onPressed;
  const BottomBarButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 5),
            CustomText(
              title,
              style: AppTextStyles.bottomBarTitle.copyWith(
                color: isActive ? AppColors.white : AppColors.black,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
