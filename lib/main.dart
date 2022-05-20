// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

import 'model/data.dart';
import 'model/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Attendance',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Attendance'),
        ),
        body: Card(
          child: FutureBuilder<List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Text('username'),
                        ),
                        DataColumn(
                          label: Text('content'),
                        ),
                      ],
                      rows: data!
                          .map((data) => DataRow(cells: [
                                DataCell(Text(data.username)),
                                DataCell(Text(data.content)),
                              ]))
                          .toList()),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
