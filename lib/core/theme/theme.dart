import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';

final appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primary, //icons, ...
    secondary: AppColors.white,
  );

  ///
  final AppBarTheme appBarTheme = AppBarTheme(
    color: AppColors.white,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 3,
    foregroundColor: AppColors.black,
    iconTheme: IconThemeData(
      color: AppColors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: AppTextStyles.appbarTitle,
  );

  /// General checkbox
  final CheckboxThemeData checkboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.all(AppColors.white),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return AppColors.primary;
      }
      return AppColors.gray.withOpacity(0.5);
    }),
    side: MaterialStateBorderSide.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return BorderSide(color: AppColors.primary, width: 1);
      }
      return BorderSide(color: AppColors.gray, width: 1);
    }),
  );

  /// General Radio
  final RadioThemeData radioThemeData = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray;
      },
    ),
  );

  ///switch theme
  final switchThemeData = SwitchThemeData(
    trackOutlineColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      return AppColors.gray.withOpacity(0.1);
    }),
    trackOutlineWidth: MaterialStateProperty.resolveWith<double>(
      (Set<MaterialState> states) {
        return 0.5;
      },
    ),
    thumbColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        return AppColors.white;
      },
    ),
    thumbIcon: MaterialStateProperty.resolveWith<Icon>(
      (Set<MaterialState> states) {
        return Icon(Icons.circle, size: 20, color: AppColors.white);
      },
    ),
    trackColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray.withOpacity(0.5);
      },
    ),
  );

  //general input decoration

  /// Default text
  final TextTheme textTheme = TextTheme(bodyMedium: AppTextStyles.body);

  //dialogs
  final DialogTheme dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: AppColors.white,
  );

  //elevated button
  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.gray.withOpacity(0.5);
          }
          return AppColors.primary;
        },
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (Set<MaterialState> states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return AppColors.white;
        },
      ),
    ),
  );

  return ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
    iconTheme: IconThemeData(
      color: AppColors.black,
    ),
    appBarTheme: appBarTheme,
    textTheme: textTheme,
    checkboxTheme: checkboxTheme,
    radioTheme: radioThemeData,
    primaryColor: AppColors.primary,
    colorScheme: colorScheme,
    switchTheme: switchThemeData,
    dialogTheme: dialogTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    brightness: Brightness.light,
    indicatorColor: AppColors.primary,
  );
}
