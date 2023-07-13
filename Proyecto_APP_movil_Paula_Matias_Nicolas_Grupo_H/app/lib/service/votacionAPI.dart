import 'package:flutter/material.dart';
import 'package:ejemplo/service/voter.dart';
import 'package:ejemplo/screen/authorization.dart';



class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  final _formKey = GlobalKey<FormState>();
  String _sectionToken = '';
  String _attendance = '';
  int _choice = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votar'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Token de sección UUIDv4'),
              onSaved: (value) {
                _sectionToken = value ?? '';
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Fecha de Votacion'),
              onSaved: (value) {
                _attendance = value ?? '';
              },
            ),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(labelText: 'Voto'),
              value: _choice,
              items: List<DropdownMenuItem<int>>.generate(
                10,
                    (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text((index + 1).toString()),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _choice = value ?? 1;
                });
              },
            ),
            ElevatedButton(
              child: Text('Enviar voto'),
              onPressed: () async {
                _formKey.currentState?.save();
                Map<String, dynamic> voteData = {
                  'sectionToken': _sectionToken,
                  'attendance': _attendance,
                  'choice': _choice,
                };
                String jwt = await VoterService.getJwt(eltokeenn);
                print('\n\n\n\n*********************el JWT: $jwt \n\n\n\n');
                bool success = await VoterService.vote(jwt, voteData);
                if (success == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Voto realizado con éxito')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al realizar el voto')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
