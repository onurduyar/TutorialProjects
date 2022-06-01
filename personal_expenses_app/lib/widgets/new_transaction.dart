import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/widgets/adaptive_text_button.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({required this.addTx, Key? key}) : super(key: key);
  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmonut = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmonut <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmonut, _selectedDate);
    Navigator.pop(context);
  }

  void _showDatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : DateFormat.yMd()
                                .format(_selectedDate!)
                                .toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 30),
                    AdaptiveTextButton(
                        text: 'Choose Date', buttonHandler: _showDatepicker),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
