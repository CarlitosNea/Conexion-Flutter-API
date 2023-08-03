import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HP;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<dynamic> datos=[];

  Future<void> consultaDatos() async{

    final url=Uri.parse("http://10.190.82.208/cliente");
    final respuesta = await HP.get(url);
    if (respuesta.statusCode==200){ //es 200 si la conexion es correcta
      print('conectado exitosamente');
      final jsonResponse=json.decode(respuesta.body);
      setState(() {
        datos=jsonResponse;
        print(datos);
      });
    }
    else{
      print('Error en la conexion');
    }
  }
  void initState(){
    super.initState();
    consultaDatos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta Datos'),
      ),
      body:
      ListView.builder(itemCount: datos.length,
        itemBuilder: (context,index){
          final item=datos[index];
          return ListTile(
            title: Text(item['documento']),
            subtitle: Row(
              children: [
                Text(item['nombre']),
                SizedBox(height: 10,),
                Text(item['apellido']),
                SizedBox(height: 10,),
                Text(item['correo']),
              ],
            ),

          );
        },
      ),
    );
  }
}
