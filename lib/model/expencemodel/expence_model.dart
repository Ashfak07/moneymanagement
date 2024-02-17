import 'package:hive_flutter/hive_flutter.dart';
part 'expence_model.g.dart';

@HiveType(typeId: 2)
class expence {
  @HiveField(0)
  final String incometype;
  @HiveField(1)
  final String descr;
  @HiveField(2)
  final int amount;

  expence({
    required this.incometype,
    required this.descr,
    required this.amount,
  });
}
