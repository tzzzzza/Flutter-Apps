import 'package:expense_tracker/widgets/expenses/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expenses_list.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenseList = [
    Expense(
        title: "Learning Flutter",
        amount: 39.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 12.35,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = expenseList.indexOf(expense);
    setState(() {
      expenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenseList.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("No Expense found. Please add some!"));

    if (expenseList.isNotEmpty) {
      mainContent = ExpensesList(expenseList, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Expenses Tracker"), actions: [
        IconButton(
          onPressed: _openAddExpensesOverlay,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          Chart(expenses: expenseList),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
