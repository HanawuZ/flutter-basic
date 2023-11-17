import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/add_new_expense.dart';

class ExpenseTrackerAppBar extends StatefulWidget implements PreferredSizeWidget{
  const ExpenseTrackerAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<ExpenseTrackerAppBar> createState() {
    return _ExpenseTrackerAppBarState();
    // throw(UnimplementedError);
  }
}

class _ExpenseTrackerAppBarState extends State<ExpenseTrackerAppBar>{

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddNewExpense();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[200],
      title: Container(
        child: Text(
          "Expense Tracker",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, size: 35, color: Colors.white,),
          // tooltip: 'Show Snackbar',
          onPressed:  _openAddExpenseOverlay

        ),
      ],
    );
  }
}