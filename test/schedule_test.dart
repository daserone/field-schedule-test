import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'dart:io';

import 'package:test_agenda/data/models/schedule_model.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';

void initHive() {
  var path = Directory.current.path;
  Hive.init('$path/test/hive_testing_path');
  Hive.registerAdapter(ScheduleModelAdapter());
}

void main() {
  initHive();
  late ScheduleProvider scheduleProvider;
  late DateTime date;
  setUp(() async {
    await setUpTestHive();
    scheduleProvider = ScheduleProvider();
    date = DateTime.parse("2021-12-23 11:47:00");
  });

  tearDown(() async {
    await tearDownTestHive();
  });
  group('Schedule Provider', () {
    test('check initial value of the list', () {
      expect(scheduleProvider.scheduleList.length, 0);
    });

    test('add value to box', () async {
      await scheduleProvider.createItem(ScheduleModel(
          fieldName: 'Cancha A',
          username: 'user',
          rainProbability: 'LLuvioso',
          date: date,
          fieldId: 1));

      expect(scheduleProvider.scheduleList.length, 1);
      expect(scheduleProvider.scheduleList[0].fieldId, 1);
    });

    test('clear box', () async {
      await scheduleProvider.clearBox();
      expect(scheduleProvider.scheduleList.length, 0);
    });
  });
}
