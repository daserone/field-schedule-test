import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final DateTime createdAt;

  User({required this.name, required this.email, required this.createdAt});
}
