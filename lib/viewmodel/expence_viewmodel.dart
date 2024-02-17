import 'package:flutter/foundation.dart';
import 'package:moneymanagement/model/expencemodel/expence_model.dart';
import 'package:moneymanagement/repo/expence_service.dart';

class ExpenceViewModel with ChangeNotifier {
  ExpenceService incomeService = ExpenceService();
  void addIncome(expence income) {
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
}
