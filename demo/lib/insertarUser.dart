import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import 'consultaApi.dart';

class InsertarUser extends StatefulWidget {
  const InsertarUser({Key? key}) : super(key: key);

  @override
  State<InsertarUser> createState() => _InsertarUserState();
}

class _InsertarUserState extends State<InsertarUser> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rolController = TextEditingController();
  final TextEditingController _documentoController = TextEditingController();

  void _enviarFormulario() async{
    if(_formkey.currentState!.validate()){
      final String apiUrl="http://10.190.82.208/registro";
      final Map<String, dynamic> requestBody={
        'password':_passwordController.text,
        'last_login':null,
        'is_superuser':true,
        'username':_usernameController.text,
        'first_name':_firstNameController.text,
        'last_name':_lastNameController.text,
        'email':_emailController.text,
        'is_staff':false,
        'is_active':true,
        'date_joined':"2023/07/27",
        'rol':_rolController.text,
        'imagen':null,
        'documento':_documentoController.text,
      };

      Navigator.push(context,MaterialPageRoute(builder: (context) => home()));


      final respuesta = await HP.post(Uri.parse(apiUrl),
        headers: {
          'Content-type':'application/json'
        },
        body: json.encode(requestBody),
      );

      if (respuesta.statusCode==200){
        print('datos enviados miso');
      }else{
        print('error en el envio');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("insertar user"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _documentoController,
                decoration: InputDecoration(labelText: "documento"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Nombre de Usuario"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: "Nombre"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: "Apellido"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Correo Electronico"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Contraseña"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _rolController,
                decoration: InputDecoration(labelText: "Rol"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: _enviarFormulario,
                  child: Text("Enviar datos")
              )
            ],
          ),
        ),
      ),
    );
  }
}
