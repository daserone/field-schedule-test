import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/data/models/schedule_model.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';
import 'package:test_agenda/presentation/views/schedule/widgets/my_schedule_card.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';

class MyScheduleList extends StatelessWidget {
  const MyScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, provider, child) {
        return provider.userScheduleList.isEmpty
            ? const Center(child: CustomText('No ha realizado reservas'))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: provider.userScheduleList.length,
                itemBuilder: (context, index) {
                  ScheduleModel schedule = provider.userScheduleList[index];

                  return MyScheduleCard(schedule: schedule);
                },
              );
      },
    );
  }
}
