import 'package:flutter/material.dart';

class Aktivitas extends StatefulWidget {
  const Aktivitas({Key? key}) : super(key: key);

  @override
  _AktivitasState createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Aktivitas'), titleTextStyle: TextStyle(color: Colors.red.shade900),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(50),
            child: InkWell(
              onTap: (){},
              splashColor:Colors.red[900],
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.manage_accounts, size: 70, color: Color.fromARGB(255, 183, 28, 28),),
                  Text("Aktivitas", style: TextStyle(fontSize: 17.8))
                ],
              ),
            ),
          ),
          Card(
           margin: const EdgeInsets.all(50),
           child: InkWell(
             onTap: (){},
             splashColor:Colors.red[900],
             child:  Column(
               mainAxisSize: MainAxisSize.min,
               children: const <Widget>[
                 Icon(Icons.manage_history_sharp, size: 70, color: Color.fromARGB(255, 183, 28, 28),),
                 Text("Riwayat", style: TextStyle(fontSize: 17.8))
                ],
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}