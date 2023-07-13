import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ejemplo/screen/authorization.dart';
import 'package:ejemplo/service/voter.dart';


class CourseResultScreen extends StatefulWidget {
  final bool allCourses;

  CourseResultScreen({required this.allCourses});

  @override
  _CourseResultScreenState createState() => _CourseResultScreenState();
}

class _CourseResultScreenState extends State<CourseResultScreen> {
  List<dynamic> results = [];
  TextEditingController _sectionCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!widget.allCourses) {
      _showSectionCodeDialog();
    } else {
      obtenerResultadosCurso('');
    }
  }

  Future<void> obtenerResultadosCurso(String sectionCode) async {
    String url = '';

    if (widget.allCourses) {
      url = 'https://api.sebastian.cl/feeling/v1/voter/results';
    } else {
      url = 'https://api.sebastian.cl/feeling/v1/$sectionCode/results';
    }

    final headers = {'Authorization': 'Bearer $eltokeenn'};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          results = jsonResponse['results'];
        });
      } else {
        print('Error al obtener los resultados del curso: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener los resultados del curso: $e');
    }
  }

  Future<void> _showSectionCodeDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingresar Código de Sección'),
          content: TextField(
            controller: _sectionCodeController,
            decoration: InputDecoration(hintText: 'Código de Sección'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                obtenerResultadosCurso(_sectionCodeController.text);
              },
              child: Text('Aceptar'),
            ),
            if (widget.allCourses)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  obtenerResultadosCurso('');
                },
                child: Text('Resultado de todos los cursos'),
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _sectionCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.allCourses ? 'Resultados de todos los cursos' : 'Resultados del curso específico'),
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

