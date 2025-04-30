import 'package:hive/hive.dart';

part 'stock.g.dart';

@HiveType(typeId: 0)
class StockModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int principal;

  @HiveField(2)
  final int dividend;

  StockModel({required this.name, required this.principal, required this.dividend});

  double get recoveryRate => dividend / principal;
}
