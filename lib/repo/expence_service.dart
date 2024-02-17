import 'package:hive/hive.dart';
import 'package:moneymanagement/model/expencemodel/expence_model.dart';

class ExpenceService {
  List<expence> incomeList = [];
  final db = Hive.box('localDb');

  void AddIncome(expence data) {
    incomeList.add(data);
    print(incomeList);
    updateDb();
  }

  loadDb() async {
    final List dbData = db.get('ExpenceList');
    incomeList = dbData
        .map((e) =>
            expence(incometype: e.incometype, descr: e.descr, amount: e.amount))
        .toList();
    print(incomeList);
  }

  void Deletename(int index) {
    incomeList.removeAt(index);
    updateDb();
  }

  void updateDb() {
    db.put('ExpenceList', incomeList);
  }
}
