import 'package:flutter/material.dart';
import 'package:ejemplo/screen/course_result_screen.dart';

/*class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Resultado de todos los cursos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseResultScreen(allCourses: true),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Resultado de curso específico'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseResultScreen(allCourses: false),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}*/

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Resultado de todos los cursos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseResultScreen(allCourses: true),
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Resultado de curso específico'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseResultScreen(allCourses: false),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
