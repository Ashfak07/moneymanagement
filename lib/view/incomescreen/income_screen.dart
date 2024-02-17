import 'package:flutter/material.dart';
import 'package:moneymanagement/model/incomemodel/income_model.dart';
import 'package:moneymanagement/viewmodel/icome_viewmodel.dart';
import 'package:provider/provider.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  void initState() {
    Provider.of<IncomeViewModel>(context, listen: false).loadDb();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var incomeprovider = Provider.of<IncomeViewModel>(context, listen: false);
    TextEditingController incometype = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController amount = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('enter location'),
                  content: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'income type',
                              prefixIcon: Icon(Icons.money)),
                          controller: incometype,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'description',
                                prefixIcon: Icon(Icons.money)),
                            controller: desc),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'amount',
                              prefixIcon: Icon(Icons.money)),
                          controller: amount,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: Text(
                        "save",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        incomeprovider.addIncome(Income(
                            incometype: incometype.text,
                            descr: desc.text,
                            amount: int.parse(amount.text)));
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: incomeprovider.incomeService.incomeList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(
                      'incomeType:  ${incomeprovider.incomeService.incomeList[index].incometype}'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          'desc:  ${incomeprovider.incomeService.incomeList[index].descr}'),
                      Text(
                          'Amount:  ${incomeprovider.incomeService.incomeList[index].amount}'),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      incomeprovider.incomeService.Deletename(index);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
