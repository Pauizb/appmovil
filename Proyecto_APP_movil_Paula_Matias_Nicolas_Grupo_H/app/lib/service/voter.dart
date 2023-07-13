import 'dart:core';
import 'dart:convert';
import 'package:ejemplo/screen/authorization.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ejemplo/screen/home.dart';

class VoterService {
  static const String _host = "https://api.sebastian.cl";
  static const String _apiTkn = "GRUPO-H-CPYD";
  static const String _apiKey = "871ea4a45c9f40b69a0db64a38e7d1c8";
  static const String _jsonMime = "application/json";

  static Future<bool> login(BuildContext context) async {
    Uri url = Uri.parse(_host + "/UtemAuth/v1/tokens/login");
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final responseJson = json.decode(response.body);
      final String redirect = responseJson['redirectUrl'];
      final String token = responseJson['token'];
      if (redirect.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AuthorizationScreen(url: redirect, token: token),
          ),
        );
      }
    }

    return true;
  }

  static Future<String> getJwt(String token) async {
    Uri url = Uri.parse(_host + '/UtemAuth/v1/tokens/'+ token +'/jwt');
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'X-API-TOKEN': _apiTkn,
      'X-API-KEY': _apiKey
    };

    String jwt = "";
    String mensaje;
    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    print("\n\n\n\n\n\n");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseJson = json.decode(response.body);
      jwt = responseJson['jwt'];
      print('\n\n\nEL VALOR DEL JTW ES (vote): $jwt \n\n\n');
    }
    else
    {
      var responseJson = json.decode(response.body);
      mensaje = responseJson['message'];
      print('el mensaje de error es: $mensaje \n\n\n');
    }

    return jwt;
  }
  static Future<bool> vote(String jwt, Map<String, dynamic> voteData) async {
    Uri url = Uri.parse(_host + '/feeling/v1/voter/vote');
    Map<String, String> headers = {
      'accept': _jsonMime,
      'Content-Type': _jsonMime,
      'Authorization': 'Bearer $jwt',
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(voteData));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  }
  static Future<List<dynamic>> getCourses(String jwt) async {
    final url = Uri.parse(_host + '/feeling/v1/voter/courses');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    };

    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    print("print de getCourses\n\n\n\n\n\n");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //final courses = jsonResponse['courses'];
      return jsonResponse;
    } else {
      throw Exception('Error al obtener la lista de cursos');
    }
  }

  static Future<List<dynamic>> getresults(String jwt) async {
    final url = Uri.parse(_host + '/feeling/v1/voter/results');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //final courses = jsonResponse['courses'];
      return jsonResponse;
    } else {
      throw Exception('Error al obtener la lista de cursos');
    }
  }



}

