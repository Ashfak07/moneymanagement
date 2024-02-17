import 'package:flutter/material.dart';
import 'package:moneymanagement/model/incomemodel/income_model.dart';
import 'package:moneymanagement/viewmodel/icome_viewmodel.dart';
import 'package:moneymanagement/viewmodel/theme_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int Totalamount = 0;
  List totalprice = [];
  @override
  void initState() {
    gettotal(Income) {
      totalprice.add(Provider.of<IncomeViewModel>(context, listen: false)
          .incomeService
          .incomeList);
      totalprice.forEach((element) {
        Totalamount += element as int;
      });
      print(Totalamount);
    }

    Provider.of<IncomeViewModel>(context, listen: false).loadDb();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: theme.textTheme.titleMedium,
        ),
        actions: [
          Switch(
              value: Provider.of<ThemeServicesProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServicesProvider>(context, listen: false)
                    .Chandetheme();
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Current Balance:'),
                Text(Totalamount.toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}
