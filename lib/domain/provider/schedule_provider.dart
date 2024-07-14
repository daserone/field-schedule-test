import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_agenda/data/constants.dart';
import 'package:test_agenda/data/models/schedule_model.dart';

class ScheduleProvider extends ChangeNotifier {
  List<ScheduleModel> _scheduleList = [];
  late Box<ScheduleModel> box;

  List<ScheduleModel> get scheduleList {
    return _scheduleList;
  }

  //user schedule list 'Andrea';
  List<ScheduleModel> get userScheduleList {
    return _scheduleList
        .where((schedule) => schedule.username.toLowerCase() == 'andrea')
        .toList();
  }

  // Create new note
  Future<void> createItem(ScheduleModel schedule) async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    await box.add(schedule);
    _scheduleList.add(schedule);
    _scheduleList = box.values.toList();
    _scheduleList.sort(
      (b, a) => a.date.compareTo(b.date),
    );
    notifyListeners();
  }

  Future<void> getItems() async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    _scheduleList = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteItem(ScheduleModel schedule) async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    await box.delete(schedule.key);
    _scheduleList = box.values.toList();
    notifyListeners();
  }

  Future<void> clearBox() async {
    Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    box.clear();
  }

  bool checkIfRepeated(int field, DateTime newDate) {
    List<ScheduleModel> checkList = [];
    checkList = _scheduleList
        .where((schedule) =>
            (schedule.date == newDate) && (schedule.fieldId == field))
        .toList();

    return checkList.length >= 3;
  }
}
