import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/models/expense.dart';
class AddNewExpense extends StatefulWidget{
  AddNewExpense({super.key});

  @override
  State<AddNewExpense> createState() {
    return _AddNewExpenseState();
    // throw(UnimplementedError);
  }
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();
  final List<String> list = ['One', 'Two', 'Three'];
  DateTime? _selectedDateTime;


  @override
  void initState() {
    super.initState();
  }

  void _presentDateTimePicker() async {
      final _pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year-1, DateTime.now().month, DateTime.now().day),
          lastDate: DateTime.now()
      );

      setState(() {
        _selectedDateTime = _pickedDate;
      });
  }

  String get formattedDateTime {
    return DateFormat.yMMMd().format(_selectedDateTime!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: double.infinity,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(7.5),
        child: Form(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Title"),
                   TextFormField(
                     maxLength: 50,
                     decoration: const InputDecoration(
                       hintText: 'Enter title',
                     ),
                     validator: (String? value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter title';
                       }
                       return null;
                     },
                   )
                 ],
               ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amount"),
                          TextFormField(
                            // Add your TextField properties here
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Add some spacing between the columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Second TextField:"),
                          Row(
                            children: [
                              Text(_selectedDateTime == null ? 'No date selected' : formattedDateTime),
                              Spacer(),
                              IconButton(
                                  onPressed: _presentDateTimePicker,
                                  icon: Icon(Icons.calendar_month)
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: double.infinity, // Set the container width to take up the full width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Category"),
                    DropdownButton<Category>(
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      isExpanded: true,
                      value: Category.leisure,
                      onChanged: (Category? value) {
                        setState(() {
                          if (value != null) {
                            print(value); // This will print the enum value (e.g., Category.FirstCategory)
                            print(value.toString()); // This will print the string representation of the enum value (e.g., "Category.FirstCategory")
                          }
                        });
                      },
                      items: Category.values.map((Category item) {
                        return DropdownMenuItem<Category>(
                          value: item,
                          child: Text(item.toString()), // Display the string representation of the enum in the dropdown
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}