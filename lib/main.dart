import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Student {
  late String name;
  late int mid;
  late int fin;
  late String son;
  Student(this.name, this.mid, this.fin, this.son);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _grade1Controller = TextEditingController();

  List<Student> list = [];

  String hesapla(int puan) {
    if (puan <= 100 && puan >= 85) {
      return "AA";
    } else if (puan >= 70) {
      return "BB";
    } else if (puan >= 60) {
      return "CC";
    } else if (puan >= 50) {
      return "DD";
    } else if (puan < 50 && puan > 0) {
      return "FF";
    } else {
      return "Hatalı not girişi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Grades App'),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListTile(
                  title: Text(list[index].name),
                  leading: Text(list[index].son),
                ),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Enter Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _gradeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Mid term",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _grade1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Enter Final",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ])
              ]),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                  minimumSize:  Size.fromHeight(45.0)
                ),
                label: const Text(
                  "Add Student",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () => setState(() {
                  int mid = int.parse(_gradeController.text.toString());
                  int finall = int.parse(_grade1Controller.text.toString());
                  var temp = (mid * 0.4) + (finall * 0.6);
                  int hes = temp.round();
                  print(hes);
                  String gelendeger = hesapla(hes);
                  list.add(Student(
                      _nameController.text,
                      int.parse(_gradeController.text),
                      int.parse(_grade1Controller.text),
                      gelendeger));
                }),
              )),
        ]));
  }
}
