import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expenses_items.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenseslist, {super.key, required this.onRemoveExpense});

  final List<Expense> expenseslist;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseslist.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenseslist[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        ),
        onDismissed: (direction){
          onRemoveExpense(expenseslist[index]);
        },
        child: ExpensesItems(expenseslist[index])
      ),
    );
  }
}
