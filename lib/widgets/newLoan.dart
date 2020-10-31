import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewLoan extends StatefulWidget {
  final Function addLoanFun;
  NewLoan(this.addLoanFun);

  @override
  _NewLoanState createState() => _NewLoanState();
}


class _NewLoanState extends State<NewLoan> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedInitialDate;
  DateTime _selectedFinalDate;

  void _presentInitialDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((initialpickedDate) {
      if (initialpickedDate == null) {
        return;
      }
      setState(() {
        _selectedInitialDate = initialpickedDate;
      });
    });
  }

  void _presentFinalDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedFinalDate = pickedDate;
      });
    });
  }

  void _submit() {
    widget.addLoanFun(_nameController.text, _amountController.text, _selectedInitialDate, _selectedFinalDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Card(
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom ,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Nombre'),
                      controller: _nameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Monto'),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedInitialDate == null
                                  ? 'Fecha inicial no seleccionada'
                                  : 'Fecha inicial:${DateFormat.yMd().format(_selectedInitialDate)}',
                            ),
                          ),
                          FlatButton(
                            child: Text(
                              'Seleccionar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.green,
                            onPressed: _presentInitialDatePicker,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(_selectedFinalDate == null
                                ? 'Fecha limite no seleccionada'
                                : 'Fecha limite:${DateFormat.yMd().format(_selectedFinalDate)}'),
                          ),
                          FlatButton(
                            child: Text(
                              'Seleccionar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.red,
                            onPressed: _presentFinalDatePicker,
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            child: Text(
                              'Agregar prestamo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: _submit,
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          );
  }
}