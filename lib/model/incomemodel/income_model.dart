import 'package:hive_flutter/hive_flutter.dart';
part 'income_model.g.dart';

@HiveType(typeId: 1)
class Income {
  @HiveField(0)
  final String incometype;
  @HiveField(1)
  final String descr;
  @HiveField(2)
  final int amount;

  Income({
    required this.incometype,
    required this.descr,
    required this.amount,
  });
}
