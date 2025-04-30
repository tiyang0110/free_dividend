import 'package:flutter/material.dart';
import 'package:free_dividend/models/stock.dart';
import 'package:free_dividend/screens/launch_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(StockModelAdapter());
  await Hive.openBox<StockModel>('stocks');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LaunchScreen());
  }
}
