import 'dart:html';

import 'package:flutter/material.dart';

import '../model/model.dart';
import '../services/api_service.dart';

class MandiList extends StatefulWidget {
  const MandiList({super.key});

  @override
  _MandiListState createState() => _MandiListState();
}

class _MandiListState extends State<MandiList> {
  late Future<String> futureData;
  late List<Mandi> mandies;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mandi List'),
      ),
      body: FutureBuilder<String>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            mandies = parseMandi(snapshot.data!);
            return ListView.builder(
              itemCount: mandies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(mandies[index].commodity),
                  subtitle: Text('Price: ${mandies[index].modalPrice.toString()}'),
                  // Add more details if needed
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}