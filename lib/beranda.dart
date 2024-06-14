import 'package:flutter/material.dart';
import 'package:qwerty/formulir.dart';
// import 'package:qwerty/thamrin.dart';
// import 'package:qwerty/thamrin.dart';
//import 'package:qwerty/zona_parkir.dart';

class beranda extends StatefulWidget {
  const beranda({Key? key}) : super(key: key);

  @override
  _berandaState createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.red[900],
        title: Align(
            alignment: Alignment.bottomLeft, // Mengatur teks ke atas
            child: Text('PARKIRKU')),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.park,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Thamrin Park", style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const thamrin()) );
              // },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.family_restroom_rounded,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Alun-Alun", style: TextStyle(fontSize: 15.8))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const thamrin()) );
              // },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.sports_soccer,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Stadion", style: TextStyle(fontSize: 15.8))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const thamrin()) );
              // },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Alun-Alun", style: TextStyle(fontSize: 15.8))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const thamrin()) );
              // },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Alun-Alun", style: TextStyle(fontSize: 15.8))
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            child: InkWell(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const thamrin()) );
              // },
              splashColor: Colors.red[900],
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 70,
                      color: Color.fromARGB(255, 183, 28, 28),
                    ),
                    Text("Alun-Alun", style: TextStyle(fontSize: 15.8))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
