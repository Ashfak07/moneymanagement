import 'package:flutter/material.dart';
import 'package:moneymanagement/viewmodel/theme_services.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Card(
              child: ListTile(
                  title: Text('Darkmode/lightmode'),
                  trailing: Switch(
                      value: Provider.of<ThemeServicesProvider>(context)
                          .isDarkModeOn,
                      onChanged: (_) {
                        Provider.of<ThemeServicesProvider>(context,
                                listen: false)
                            .Chandetheme();
                      })),
            ),
          ],
        )));
  }
}
