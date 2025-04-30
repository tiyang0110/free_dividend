import 'package:flutter/material.dart';
import 'package:free_dividend/models/stock.dart';
import 'package:hive/hive.dart';

class AddStock extends StatefulWidget {
  const AddStock({super.key});

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _principalController = TextEditingController();

  void _saveStock() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final principal = int.parse(_principalController.text);

      final newStock = StockModel(name: name, principal: principal, dividend: 0);

      final box = Hive.box<StockModel>('stocks');
      await box.add(newStock);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
