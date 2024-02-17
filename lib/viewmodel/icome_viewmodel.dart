import 'package:flutter/material.dart';
import 'package:moneymanagement/model/incomemodel/income_model.dart';
import 'package:moneymanagement/repo/income_service.dart';

class IncomeViewModel with ChangeNotifier {
  IncomeScreenService incomeService = IncomeScreenService();

  void addIncome(Income income) {
    notifyListeners();
    return incomeService.AddIncome(income);
  }

  void deletedata(int index) {
    notifyListeners();
    return incomeService.Deletename(index);
  }

  void loadDb() {
    return incomeService.loadDb();
  }

  // void getTotal() {
  //   return incomeService.gettotal(Income);
  // }
}
