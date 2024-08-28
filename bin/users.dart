class Users {
  int id;
  String name;
  String username;
  String email;
  


  Users({required this.id, required this.name, required this.username, required this.email});

  // Método para crear una instancia de Post a partir de un JSON
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}

