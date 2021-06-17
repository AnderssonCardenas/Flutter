import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login1/paginas/homepage.dart';
import 'package:login1/paginas/registro.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loginpage());
  }
}

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String emailCorrecto = 'andersson@gmail.com';
  String passwordcorrecto = '12345678';

  String email = '';
  String password = '';

  void registro() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => registrarse()));
  }

  void iniciarsesion() {
    FormState? _formstate = _formkey.currentState;
    if (_formstate!.validate()) {
      _formstate.save();
      if (emailCorrecto.toLowerCase() == email.toLowerCase() &&
          passwordcorrecto == password) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homepage()));
      } else {
        return alerta();
      }
    }
  }

  void alerta() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Email o contraseña incorrecto'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Aceptar'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.fromLTRB(80, 110, 80, 110),
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial nova'),
                      ),
                      Image(
                        image: NetworkImage(
                            "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-group-256.png"),
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.message),
                            labelText: 'Email',
                            hintText: 'Introduzca un email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe llenar el campo';
                          } else {
                            if (value.contains(' ')) {
                              return 'El email contiene espacio';
                            }
                          }
                          return null;
                        },
                        onSaved: (value) => email = value!,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Contraseña',
                            hintText: 'Introduzca su contraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Debe llenar el campo';
                          } else {
                            if (value.length < 6) {
                              return 'La contraseña debe tener más de 6 caracteres';
                            }
                          }
                          return null;
                        },
                        onSaved: (value) => password = value!,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Registrarse',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Arial nova'),
                              ),
                              color: Colors.blue[600],
                              onPressed: () => registro()),
                          RaisedButton(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Arial nova'),
                              ),
                              color: Colors.blue[600],
                              onPressed: () => iniciarsesion()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
      ),
    );
  }
}
