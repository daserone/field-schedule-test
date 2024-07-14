import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_agenda/core/theme/color_constants.dart';

@override
Widget timePicker(
    BuildContext context, TextEditingController controller, String hint) {
  return TextFormField(
    readOnly: true,
    controller: controller,
    autofocus: false,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      hintText: 'Seleccione hora',
      labelText: hint,
      filled: true,
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
          var picker = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.input);

          if (picker != null) {
            final DateFormat formatter = DateFormat('HH:mm');

            final String formatted = formatter
                .format(DateTime(2021, 1, 1, picker.hour, picker.minute));
            controller.text = formatted;
          }
        },
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Seleccione una hora";
      }
      return null;
    },
  );
}
