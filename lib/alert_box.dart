import 'package:flutter/material.dart';

class MyAlertbox extends StatefulWidget {
  final int min;
  final int max;
  final bool isMin;
  MyAlertbox({this.min = 0, this.max = 1, required this.isMin});

  @override
  _MyAlertboxState createState() => _MyAlertboxState();
}

class _MyAlertboxState extends State<MyAlertbox> {
  int updatedMin = 0;
  int updatedMax = 15;
  @override
  void initState() {
    updatedMin = widget.min;
    updatedMax = widget.max;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('change value'),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.grey.withOpacity(0.3),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: TextFormField(
          initialValue: "${widget.isMin ? updatedMin : updatedMax}",
          decoration: InputDecoration(
            hintText: "Enter ${widget.isMin ? "min" : "max"} value",
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              if (widget.isMin) updatedMin = int.parse(value);
            } else
              updatedMax = int.parse(value);
            print(value);
          },
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
          width: 700,
          child: TextButton(
            onPressed: () {
              if (widget.isMin) {
                Navigator.pop(context, updatedMin);
              } else {
                Navigator.pop(context, updatedMax);
              }
            },
            child: Text("update"),
          ),
        )
      ],
    );
  }
}
