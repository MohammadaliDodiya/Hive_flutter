import 'package:expance_tracker_hive/Model/transaction.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class TransactionModel extends ChangeNotifier {
  int totalAmount = 0;
  int totalIncome = 0;
  int totalexpanse = 0;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  initHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(TrasacationsAdapter());
    await Hive.openBox<Trasacations>('transactions');
  }

  hiveListen() => Hive.box<Trasacations>('transactions').listenable();
  addTranscation({title, desc, amount, isExpanse}) async {
    var now = new DateTime.now();
    var date = new DateFormat('yyyy-MM-dd').format(now);
    await Hive.box<Trasacations>('transactions').add(Trasacations(
        title: title,
        desc: desc,
        money: int.parse(amount),
        isExpanse: isExpanse,
        date: "$date"));
  }

  deleteByIndex(index) async {
    await Hive.box<Trasacations>('transactions').deleteAt(index);
  }

  deleteAll() async {
    await Hive.box<Trasacations>('transactions')
        .deleteAll(await Hive.box<Trasacations>('transactions').keys);
    // print(await Hive.box<Trasacations>('transactions').keys);
  }

  readAllTransactionAmount() async {
    totalAmount = 0;
    totalIncome = 0;
    totalexpanse = 0;
    for (int i = 0; i < Hive.box<Trasacations>('transactions').length; i++) {
      if (Hive.box<Trasacations>('transactions').getAt(i)!.isExpanse == false) {
        totalIncome = totalIncome +
            await Hive.box<Trasacations>('transactions').getAt(i)!.money;
      } else {
        totalexpanse = totalexpanse +
            await Hive.box<Trasacations>('transactions').getAt(i)!.money;
      }

      totalAmount = totalIncome - totalexpanse;
    }
    notifyListeners();
  }
}
