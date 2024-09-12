import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  final String _validUsername = 'admin';
  final String _validPassword = 'admin';

  void _validateCredentials() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == _validUsername && password == _validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Credenciales inválidas';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue, // Color de fondo más oscuro
              Colors.lightBlue, // Color de fondo más claro
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red,
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 30),
            Image.network(
              'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9hL8LX8SJ4auWlPI_HvLHd9a6LE6czKxzUYYGZHu2c_PE6VC00cy3z4yuuTuCEwtZlhgcis5coLhtbZXCo9BsZ1GMzRd-B1Bh3lDzn8dzLUSgr0til-43fLjKuuMDX7Lwx0HRAxSvU5ahdeaJPdRf4euPl_stim_FCx58Fnz4eDjrM5tMb8cMR560FQ_p/s256/5087579.png',
              height: 150,
            ),
            const SizedBox(height: 30),
            const Text(
              "Digite los datos de acceso en los campos de abajo",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            CupertinoTextField(
              controller: _usernameController,
              cursorColor: Colors.lightBlue,
              padding: EdgeInsets.all(15),
              placeholder: "Usuario",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
              cursorColor: Colors.lightBlue,
              padding: EdgeInsets.all(15),
              placeholder: "Contraseña",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.blueAccent, // Color azul claro para el botón
                child: const Text(
                  "Accesar",
                  style: TextStyle(
                      color: Colors.white, // Color del texto en el botón
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: _validateCredentials,
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue, // Color de fondo más oscuro
              Colors.lightBlue, // Color de fondo más claro
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenido!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
