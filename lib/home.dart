import 'package:flutter/material.dart';
import 'package:qwerty/beranda.dart';
import 'package:qwerty/aktivitas.dart';
import 'package:qwerty/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  void deleteData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
    pref.remove("user");
  }

  void navLoginPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }

  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _ListPage = <Widget>[
      //const Text('Beranda'),
      const beranda(),
      const Aktivitas(),
      const Text('Mobil'),
      const Text('Akun')
    ];

    final _bottomNavBarItem = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Beranda',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: 'Aktivitas',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.motorcycle_rounded),
        label: 'Kendaraan',
      ),
      const BottomNavigationBarItem(
          icon: Icon(Icons.location_history), label: 'Akun'),
    ];

    final _bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red[900],
      items: _bottomNavBarItem,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Colors.white54,
      selectedItemColor: Colors.white,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: _ListPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
