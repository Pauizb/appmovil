import 'package:flutter/material.dart';
import 'package:ejemplo/screen/home.dart';
import 'package:ejemplo/screen/login.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'package:ejemplo/screen/authorization.dart';
import 'package:http/http.dart' as http;
import 'package:ejemplo/service/voter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ejemplo/service/votacionAPI.dart';
import 'package:ejemplo/screen/course_list_screen.dart';
import 'package:ejemplo/screen/course_list_screen.dart';
import 'package:ejemplo/screen/result_screen.dart';
import 'package:ejemplo/screen/integrantes.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Pantalla de Inicio',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  void navigateTo(BuildContext context, String route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceholderScreen(route)));
  }

  void listarCursos(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CourseListScreen()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("\n            MENU",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ) ,),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/vector-gratis/fondo-degradado-morfismo-vidrio_52683-86366.jpg?w=1380&t=st=1689216038~exp=1689216638~hmac=06983d1247955e1f8dcbe19712d8f76068638dabd3fdfa890d0d4dc929c41c2d"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.grey[200],
              title: Text('Listar cursos'),
              onTap: () => listarCursos(context),
              //onTap: () => navigateTo(context, 'Listar cursos'),
            ),
            ListTile(
              title: Text('Votar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VoteScreen()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.grey[200],
              title: Text('Vista de resultados'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Vista de integrantes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntegranteScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center( child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://static.vecteezy.com/system/resources/previews/003/557/168/non_2x/vote-paper-on-election-box-vector.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Bienvenido a la app de votación\n\n                      UTEM',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24, color: Colors.black87),
          ),
        ),
      ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Estás en la pantalla de $title'),
      ),
    );
  }
}
