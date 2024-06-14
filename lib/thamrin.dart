import 'package:flutter/material.dart';

class thamrin extends StatefulWidget {
  const thamrin({Key? key}) : super(key: key);

  @override
  _thamrinState createState() => _thamrinState();
}

class _thamrinState extends State<thamrin>{
  int selectedSlot = -1;
  List<bool> parkingSpacesTop = List.generate(5, (index) => false);
  List<bool> parkingSpacesBottom = List.generate(5, (index) => false);

  void toggleParkingSpaceTop(int index) {
    setState(() {
      if (selectedSlot == index) {
        selectedSlot = -1;
      } else {
        selectedSlot = index;
      }
      for (int i = 0; i < parkingSpacesTop.length; i++) {
        if (i != index) {
          parkingSpacesTop[i] = false;
        }
      }
    });
  }

  void toggleParkingSpaceBottom(int index) {
    setState(() {
      if (selectedSlot == index + 5) {
        selectedSlot = -1;
      } else {
        selectedSlot = index + 5;
      }
      for (int i = 0; i < parkingSpacesBottom.length; i++) {
        if (i != index) {
          parkingSpacesBottom[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Zona Parkir'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: parkingSpacesTop.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 5 slot per baris
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    toggleParkingSpaceTop(index);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: selectedSlot == index ? Colors.red : parkingSpacesTop[index] ? Colors.red : Colors.green,
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
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: parkingSpacesBottom.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 5 slot per baris
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    toggleParkingSpaceBottom(index);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: selectedSlot == index + 5 ? Colors.red : parkingSpacesBottom[index] ? Colors.red : Colors.green,
                    child: Center(
                      child: Text(
                        'Slot ${index + 6}',
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
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: selectedSlot != -1
                ? () {
                    // Implementasi logika beli
                    // Misalnya, tampilkan pesan bahwa pembelian berhasil
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Pembelian berhasil! Slot ${selectedSlot + 1} telah dibeli.'),
                      ),
                    );
                    setState(() {
                      if (selectedSlot < 5) {
                        parkingSpacesTop[selectedSlot] = true;
                      } else {
                        parkingSpacesBottom[selectedSlot - 5] = true;
                      }
                    });
                  }
                : null,
            child: Text('Beli'),
          ),
        ],
      ),
    );
  }
}
