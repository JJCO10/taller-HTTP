import 'dart:convert';
import 'package:http/http.dart' as http;
import 'users.dart';

void main() async{

  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await http.get(url);

  print(response);

  if (response.statusCode == 200) {
    // Parsear la respuesta JSON a una lista
    List<dynamic> jsonData = json.decode(response.body);

    // Crear una lista de Users
    List<Users> users = jsonData.map((json) => Users.fromJson(json)).toList();

    // Mostrar los datos
    filtrarUsuariosPorUsername(users);
    contarUsuariosConEmailBiz(users);
  } else {
    // Manejo de errores
    print('Error al obtener los datos: ${response.statusCode}');
  }

}

void filtrarUsuariosPorUsername(List<Users> users) {
  print('Usuarios con nombre de usuario de más de 6 caracteres:');
  users.where((user) => user.username.length > 6).forEach((user) {
    print('id: ${user.id}, username: ${user.username}');
  });
  print('---');
}


void contarUsuariosConEmailBiz(List<Users> users) {
  int count = users.where((user) => user.email.endsWith('@biz')).length;
  print('Cantidad de usuarios con email de dominio "biz": $count');
}