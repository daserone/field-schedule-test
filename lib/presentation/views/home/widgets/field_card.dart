import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_agenda/core/utils/date_utils.dart';
import 'package:test_agenda/data/models/field_model.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class FieldCard extends StatelessWidget {
  final FieldModel field;
  const FieldCard({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(field.images?.first.url ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      field.name ?? '',
                      style: CustomTextStyles.customTextStylePoppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //rain probability
                    Row(
                      children: [
                        const Icon(
                          Icons.cloudy_snowing,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomText(
                          '30%',
                          style: CustomTextStyles.customTextStylePoppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomText(
                  field.type ?? '',
                  style: CustomTextStyles.customTextStylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          context.go('/new-schedule/${field.id}');
                        },
                        child: const Text('Reservar')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
