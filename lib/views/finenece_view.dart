import 'package:flutter/material.dart';

class Expense {
  String category;
  double amount;
  String date;
  String notes;

  Expense(
      {required this.category,
      required this.amount,
      required this.date,
      required this.notes});
}

class Income {
  String category;
  double amount;
  String date;
  String notes;

  Income(
      {required this.category,
      required this.amount,
      required this.date,
      required this.notes});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenses = [];
  List<Income> incomes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpenseScreen(
                      onSave: (expense) {
                        setState(() {
                          expenses.add(expense);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Add Expense'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddIncomeScreen(
                      onSave: (income) {
                        setState(() {
                          incomes.add(income);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Add Income'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddExpenseScreen extends StatefulWidget {
  final Function(Expense) onSave;

  AddExpenseScreen({required this.onSave});

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: 'Notes',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Expense expense = Expense(
                  category: categoryController.text,
                  amount: double.parse(amountController.text),
                  date: dateController.text,
                  notes: notesController.text,
                );
                widget.onSave(expense);
                Navigator.pop(context);
              },
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddIncomeScreen extends StatefulWidget {
  final Function(Income) onSave;

  AddIncomeScreen({required this.onSave});

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: 'Notes',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Income income = Income(
                  category: categoryController.text,
                  amount: double.parse(amountController.text),
                  date: dateController.text,
                  notes: notesController.text,
                );
                widget.onSave(income);
                Navigator.pop(context);
              },
              child: Text('Save Income'),
            ),
          ],
        ),
      ),
    );
  }
}
