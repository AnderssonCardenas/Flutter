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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(colors: [
                Colors.blue.shade900,
                Colors.blue.shade600,
                Colors.blue.shade400,
                Colors.blue.shade100,
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial nova'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  '¡Bienvenido querido usuario!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Arial nova'),
                ),
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[50],
                          ),
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.message),
                              hintText: 'Introduzca su email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                        ),
                        SizedBox(
                          height: 0.4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[50],
                          ),
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Introduzca su contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                  primary: Colors.blue.shade800,
                                  elevation: 0,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Arial nova'),
                                ),
                                onPressed: () => iniciarsesion()),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                  primary: Colors.blue.shade800,
                                  elevation: 0,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  'Registrarse',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Arial nova'),
                                ),
                                onPressed: () => registro()),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        GestureDetector(
                          child: Text(
                            'Olvidé mi contraseña',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontFamily: 'Arial nova'),
                          ),
                          onTap: () {
                            //redirección a la página de recuperar contraseña
                          },
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(15),
                              ),
                              onPressed: () {},
                              child: Container(
                                child: Image(
                                  image: NetworkImage(
                                      "https://cdn3.iconfinder.com/data/icons/logos-brands-3/24/logo_brand_brands_logos_google-256.png"),
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(15),
                              ),
                              onPressed: () {},
                              child: Container(
                                child: Image(
                                    image: NetworkImage(
                                        "https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Facebook_colored_svg_copy-256.png"),
                                    width: 40,
                                    height: 40),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(15),
                              ),
                              onPressed: () {},
                              child: Container(
                                child: Image(
                                    image: NetworkImage(
                                        "https://cdn3.iconfinder.com/data/icons/google-material-design-icons/48/ic_local_phone_48px-256.png"),
                                    width: 40,
                                    height: 40),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          decoration: BoxDecoration(),
        ),
      ),
    );
  }
}

