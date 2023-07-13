import 'dart:convert';
import 'package:ejemplo/screen/authorization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ejemplo/service/voter.dart';

class AllResultsScreen extends StatefulWidget {
  @override
  _AllResultsScreenState createState() => _AllResultsScreenState();
}

class _AllResultsScreenState extends State<AllResultsScreen> {
  List<dynamic> results = [];

  @override
  void initState() {
    super.initState();
    obtenerResultados();
  }

  void obtenerResultados() async {
    final eljwt = await VoterService.getJwt(eltokeenn);
    try {
      final fetchedCourses = await VoterService.getresults(eljwt);
        setState(() {
          results = fetchedCourses;
          print(results);
          print("\n\n\n\n");
        });
    } catch (e) {
      print('Error al obtener los resultados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de todos los cursos'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return ListTile(
            title: Text(result['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${result['code']}'),
                Text('Token: ${result['token']}'),
                Text('Semestre: ${result['semester']}'),
                Text('Año: ${result['year']}'),
                Text('Activo: ${result['active']}'),
                Text('Promedio: ${result['avg']}'),
                Text('Total: ${result['total']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}