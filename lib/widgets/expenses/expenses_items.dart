import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Row(children: [
          Text('\$${expense.amount}'),
          const Spacer(),
          Row(
            children: [
              Icon(categoryIcon[expense.category]),
              const SizedBox(width: 10),
              Text(expense.formattedDate)
            ],
          )
        ])
      ]),
    ));
  }
}
