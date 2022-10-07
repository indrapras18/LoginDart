import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<List> _log() async {
    final response =
        await http.post("http://localhost/wait/akses/login.php", body: {
      "nama": usernameController.text,
      "password": passwordController.text,
    });

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Login"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: new InputDecoration(
                    hintText: "Masukan usernmae anda",
                    labelText: "username",
                    icon: Icon(Icons.people)),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: new InputDecoration(
                    hintText: "Masukan Password anda",
                    labelText: "Password",
                    icon: Icon(Icons.lock)),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _log;
                },
                icon: Icon(Icons.save, size: 18),
                label: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
