import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[500],
      title: Container(
        // height: height,
        child: Text("Expense Tracker")
      ),
    );
  }
}