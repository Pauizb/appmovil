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

  Future<void> obtenerResultados() async {
    final url = Uri.parse('https://api.sebastian.cl/feeling/v1/voter/results');
    String eljwt = await VoterService.getJwt(eltokeenn);
    final headers = {'Authorization': 'Bearer $eljwt'};

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          results = jsonResponse['results'];
        });
      } else {
        print('Error al obtener los resultados: ${response.statusCode}');
      }
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
            title: Text('Token: ${result['token']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha de la operación: ${result['attendance']}'),
                Text('Votación: ${result['choice']}'),
                // Agrega aquí los demás campos que deseas mostrar
              ],
            ),
          );
        },
      ),
    );
  }
}
