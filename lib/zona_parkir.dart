import 'package:flutter/material.dart';


class thamrin extends StatefulWidget {
  const thamrin({Key? key}) : super(key: key);

  @override
  _thamrinState createState() => _thamrinState();
}

class _thamrinState extends State<thamrin>{
  List<bool> parkingSpaces = List.generate(20, (index) => false);

  void toggleParkingSpace(int index) {
    setState(() {
      parkingSpaces[index] = !parkingSpaces[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Parking'),
      ),
      body: GridView.builder(
        itemCount: parkingSpaces.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              toggleParkingSpace(index);
            },
            child: Container(
              margin: EdgeInsets.all(8),
              color: parkingSpaces[index] ? Colors.white54 : Colors.green,
              child: Center(
                child: Text(
                  'Slot ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

