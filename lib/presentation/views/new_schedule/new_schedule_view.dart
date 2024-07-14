import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/core/utils/date_utils.dart';
import 'package:test_agenda/data/models/field_model.dart';
import 'package:test_agenda/domain/provider/position_provider.dart';
import 'package:test_agenda/presentation/views/new_schedule/widgets/carousel_slider.dart';
import 'package:test_agenda/presentation/views/new_schedule/widgets/new_schedule_form.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class NewScheduleView extends StatelessWidget {
  final FieldModel field;
  const NewScheduleView({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FieldCarousel(images: field.images ?? []),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        field.name ?? '',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //price per hour of the field
                      CustomText(
                        '\$${field.price ?? ''}',
                        style: CustomTextStyles.customTextStylePoppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // type  | por hora
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        field.type ?? '',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      CustomText(
                        'por hora',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      CustomText(
                        'Disponible: ',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CustomText(
                        getTimeFromString(field.availableFrom ?? ''),
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        'a',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        getTimeFromString(field.availableTo ?? ''),
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // current location
                  Consumer<PositionProvider>(
                    builder: (context, positionProvider, child) {
                      return Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.gray,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: CustomText(
                              positionProvider.address ?? '',
                              style: CustomTextStyles.customTextStylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            NewScheduleForm(
              field: field,
            ),
          ],
        ),
      ),
    );
  }
}
