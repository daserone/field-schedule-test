import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/data/models/schedule_model.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';
import 'package:test_agenda/presentation/views/home/widgets/schedule_card.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, provider, child) {
        return provider.scheduleList.isEmpty
            ? const Center(child: CustomText('No se han realizado reservas'))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: provider.scheduleList.length,
                itemBuilder: (context, index) {
                  ScheduleModel schedule = provider.scheduleList[index];

                  return ScheduleCard(schedule: schedule);
                },
              );
      },
    );
  }
}
