import 'package:hive/hive.dart';
import 'package:moneymanagement/model/incomemodel/income_model.dart';

class IncomeScreenService {
  List<Income> incomeList = [];
  final db = Hive.box('localDb');

  void AddIncome(Income data) {
    incomeList.add(data);
    print(incomeList);
    updateDb();
  }

  loadDb() async {
    final List dbData = db.get('IncomeList');
    incomeList = dbData
        .map((e) =>
            Income(incometype: e.incometype, descr: e.descr, amount: e.amount))
        .toList();
    print(incomeList);
  }

  void Deletename(int index) {
    incomeList.removeAt(index);
    updateDb();
  }

  void updateDb() {
    db.put('IncomeList', incomeList);
  }

  gettotal() {
    incomeList.forEach((element) {});
  }
}
