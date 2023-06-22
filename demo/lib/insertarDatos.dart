import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;
import 'consultaApi.dart';

class Insertar extends StatefulWidget {
  const Insertar({Key? key}) : super(key: key);

  @override
  State<Insertar> createState() => _InsertarState();
}

class _InsertarState extends State<Insertar> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();

  void _enviarFormulario() async{
    if(_formkey.currentState!.validate()){
      final String apiUrl="http://10.190.80.47/insertar";
      final Map<String, dynamic> requestBody={
        'documento':_documentoController.text,
        'nombre':_nombreController.text,
        'apellido':_apellidoController.text,
        'correo':_correoController.text,
        'telefono':_telefonoController.text,
        'direccion':_direccionController.text,
        'genero':_generoController.text,
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
        title:  Text("insertar datos"),
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
                controller: _nombreController,
                decoration: InputDecoration(labelText: "nombre"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(labelText: "apellido"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _correoController,
                decoration: InputDecoration(labelText: "correo"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(labelText: "telefono"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(labelText: "direccion"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _generoController,
                decoration: InputDecoration(labelText: "genero"),
                validator: (value){
                  if (value!.isEmpty){
                    return 'Este campo no puede estar vacio';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
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
