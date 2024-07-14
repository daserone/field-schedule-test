import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/data/models/field_model.dart';
import 'package:test_agenda/domain/provider/field_provider.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/views/home/widgets/field_card.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class FieldList extends StatelessWidget {
  const FieldList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Canchas',
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Consumer<FieldProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: 360,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.fieldList.length,
                    itemBuilder: (context, index) {
                      FieldModel field = provider.fieldList[index];

                      return FieldCard(field: field);
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
