import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/domain/provider/weather_provider.dart';

@override
Widget dateSelector(
    BuildContext context, TextEditingController controller, String hint) {
  return TextFormField(
    readOnly: true,
    controller: controller,
    autofocus: false,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      hintText: 'Seleccione fecha',
      labelText: hint,
      filled: true,
      hoverColor: AppColors.lightScaffoldBackgroundColor,
      focusColor: AppColors.lightScaffoldBackgroundColor,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.secondaryBackgroundColor, width: 1.0),
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.secondaryBackgroundColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.secondaryBackgroundColor, width: 1.0),
      ),
      fillColor: AppColors.lightScaffoldBackgroundColor,
      suffixIcon: IconButton(
        iconSize: 16,
        icon: const Icon(Icons.keyboard_arrow_down),
        onPressed: () async {
          var picker = await showDatePicker(
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.fromSwatch()
                        .copyWith(primary: AppColors.primary),
                    dialogBackgroundColor:
                        AppColors.lightScaffoldBackgroundColor,
                  ),
                  child: child!,
                );
              },
              locale: const Locale("es", "ES"),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900, DateTime.now().month),
              lastDate: DateTime(2101));

          if (picker != null) {
            final weatherProvider =
                Provider.of<WeatherProvider>(context, listen: false);
            // Unix time, UTC time zone

            final unixTime = picker.toUtc().millisecondsSinceEpoch ~/ 1000;
            weatherProvider.getWeather(context, unixTime.toString());

            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            final String formatted = formatter.format(picker);

            controller.text = formatted;
          }
        },
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Seleccione una fecha";
      }
      return null;
    },
  );
}
