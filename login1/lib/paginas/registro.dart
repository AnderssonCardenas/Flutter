import 'package:flutter/material.dart';

class registrarse extends StatelessWidget {
  const registrarse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: formregistro());
  }
}

class formregistro extends StatefulWidget {
  formregistro({Key? key}) : super(key: key);

  @override
  _formregistroState createState() => _formregistroState();
}

class _formregistroState extends State<formregistro> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _emailregistro = '';
  String _passwordregistro = '';

  void _validacionregistro() {
    FormState? _formstate = _formkey.currentState;
    if (_formstate!.validate()) {
      _formstate.save();
    }
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
                            'REGISTRARSE',
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
                            onSaved: (value) => _emailregistro = value!,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Contraseña',
                                hintText: 'Introduzca una contraseña',
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
                            onSaved: (value) => _passwordregistro = value!,
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
                                  onPressed: () => _validacionregistro()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))),
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
