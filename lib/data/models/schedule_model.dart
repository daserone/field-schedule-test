import 'package:hive/hive.dart';
part 'schedule_model.g.dart';

@HiveType(typeId: 0)
class ScheduleModel extends HiveObject {
  @HiveField(0)
  String fieldName;
  @HiveField(1)
  String username;
  @HiveField(2)
  String rainProbability;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  int fieldId;

  ScheduleModel(
      {required this.fieldName,
      required this.username,
      required this.rainProbability,
      required this.date,
      required this.fieldId});
}
