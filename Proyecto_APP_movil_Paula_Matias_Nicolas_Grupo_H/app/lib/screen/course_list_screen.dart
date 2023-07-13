import 'package:flutter/material.dart';
import 'package:ejemplo/service/voter.dart';
import 'package:ejemplo/screen/authorization.dart';

class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<dynamic> courses = [];

  @override
  void initState() {
    super.initState();
    cargarCursos();
  }

  void cargarCursos() async {
    final jwt = await VoterService.getJwt(eltokeenn);
    try {
      final fetchedCourses = await VoterService.getCourses(jwt);
      setState(() {
        courses = fetchedCourses;
      });
    } catch (e) {
      print('Error al obtener la lista de cursos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cursos'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${course['code']}'),
                Text('Activo: ${course['active']}'),
                Text('Semestre: ${course['semester']}'),
                Text('Token: ${course['token']}'),
                Text('Año: ${course['year']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
