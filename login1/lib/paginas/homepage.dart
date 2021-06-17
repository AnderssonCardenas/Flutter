import 'package:flutter/material.dart';
import 'package:login1/main.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      home: inicio(),
    );
  }
}

class inicio extends StatefulWidget {
  inicio({Key? key}) : super(key: key);

  @override
  _inicioState createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Prueba tabs'),
            leading: Icon(Icons.menu),
          ),
          bottomNavigationBar: Container(
            color: Colors.blue,
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.add_photo_alternate_outlined)),
                Tab(
                  icon: Icon(Icons.settings),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  'Inicio',
                ),
              ),
              Center(
                child: Text(
                  'Mensajes',
                ),
              ),
              Center(
                child: Text(
                  'Subir foto',
                ),
              ),
              Center(
                child: Text(
                  'Configuración',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
