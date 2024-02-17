import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:moneymanagement/model/expencemodel/expence_model.dart';
import 'package:moneymanagement/model/incomemodel/income_model.dart';
import 'package:moneymanagement/repo/income_service.dart';
import 'package:moneymanagement/view/bottom_navigation/bottom_navigation.dart';
import 'package:moneymanagement/view/theam.dart';
import 'package:moneymanagement/viewmodel/expence_viewmodel.dart';
import 'package:moneymanagement/viewmodel/icome_viewmodel.dart';
import 'package:moneymanagement/viewmodel/theme_services.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(IncomeAdapter());
  Hive.registerAdapter(expenceAdapter());
  var box = await Hive.openBox('localDb');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeServicesProvider()),
      ChangeNotifierProvider(create: (context) => IncomeViewModel()),
      ChangeNotifierProvider(create: (context) => ExpenceViewModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServicesProvider>(
        builder: (context, themeService, child) {
      return MaterialApp(
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          title: 'Flutter Demo',
          theme: Apptheam.lightTheme,
          darkTheme: Apptheam.darkTheme,
          home: Bottomnav());
    });
  }
}
