import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IntegranteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integrantes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                'Nicolas Ruiz Riesco',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              '"Estudiante de ingeniería civil en computación de quinto año, tengo 23 años de edad, amante de la tecnología"',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                'Paula Ruiz Bustos',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              '"Estudiante de ingeniería civil en computación de quinto año, tengo 22 años de edad, me gusta la música"',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                'Matias Zapata',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              '"Estudiante de ingeniería civil en computación de quinto año, tengo 25 años de edad, me gustan los videojuegos"',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Grupo H: "Hacer lo que nos gusta"',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
