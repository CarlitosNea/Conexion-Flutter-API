import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:demo/consultaApi.dart';
import 'package:http/http.dart' as HP;

class IniciarSesionView extends StatefulWidget {
  const IniciarSesionView({Key? key}) : super(key: key);

  @override
  State<IniciarSesionView> createState() => _IniciarSesionViewState();
}

class _IniciarSesionViewState extends State<IniciarSesionView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Future<void> _enviarInicioSesion() async{
    print("entrada 1");
    final Map<String, String> data ={
      'username' : _usernameController.text,
      'password' : _passwordController.text,
    };
    print('dos');
    try{
      final response = await HP.post(
        Uri.parse('http://10.190.82.208/iniciarSesion'),
        headers: {
          'content-type' : 'application/json'
        },
        body: json.encode(data)
      );
      if(response.statusCode == 200){
        print('ok');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => home()),
        );
      } else{
        print('error en la solicitud: ${response.statusCode}');
        print('error : ${response.body}');
      }
    } catch(e){
      print('excepcion: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('iniciar sesion')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Nombre de usuario"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: _enviarInicioSesion,
                child: Text('Iniciar Sesion')
            )
          ],
        ),
      ),
    );
  }
}


