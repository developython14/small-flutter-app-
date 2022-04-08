import 'package:flutter/material.dart';

class belk extends StatefulWidget {
  @override
  State<belk> createState() => _belkState();
}

class _belkState extends State<belk> {
  DateTime data = DateTime(4, 17, 1998);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Column(children: [
          Text("mustapha born  on ${data.year}/${data.month}/${data.day}"),
          ElevatedButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1998),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date == null) return;
                setState(() {
                  data = date;
                });
              },
              child: Text("choose your date "))
        ]),
      );
    });
  }
}
