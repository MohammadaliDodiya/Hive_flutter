import 'package:hive_flutter/hive_flutter.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Trasacations {
  @HiveField(1)
  String title;

  @HiveField(2)
  String desc;

  @HiveField(3)
  int money;

  @HiveField(4)
  bool isExpanse;

  @HiveField(5)
  String date;

  Trasacations({
    required this.title,
    required this.desc,
    required this.money,
    required this.isExpanse,
    required this.date,
  });
}
