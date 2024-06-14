// import 'package:flutter/material.dart';
// import 'package:qwerty/thamrin.dart';

// class FormPage extends StatefulWidget {
//   const FormPage({Key? key}) : super(key: key);

//   @override
//   _FormPageState createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _licensePlateController = TextEditingController();
//   String _vehicleType = 'Mobil'; // Default value

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.red[900],
//         title: Align(
//               alignment: Alignment.topLeft, // Mengatur teks ke atas
//               child: Text('Registrasi')
//         ),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(10),
//           ),

//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(labelText: 'Nama'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Masukkan nama';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   controller: _licensePlateController,
//                   decoration: InputDecoration(labelText: 'Plat Nomor'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Masukkan plat nomor';
//                     } else if (value.length < 9 || value.length > 11) {
//                       return 'Plat nomor harus terdiri dari 9 hingga 11 karakter';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 DropdownButtonFormField<String>(
//                   value: _vehicleType,
//                   decoration: InputDecoration(labelText: 'Jenis Kendaraan'),
//                   onChanged: (newValue) {
//                     setState(() {
//                       _vehicleType = newValue!;
//                     });
//                   },
//                   items: <String>['Mobil', 'Motor']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Proses formulir
//                       // Misalnya, simpan data atau lanjut ke langkah berikutnya
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Formulir terkirim')));
//                     }
//                     if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => thamrin()),
//                         );
//                       }
//                   },
//                   child: Text('Selanjutnya'),

//                   ),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     if (_formKey.currentState!.validate()) {
//                   //       Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(builder: (context) => thamrin()),
//                   //       );
//                   //     }
//                   //   },
//                   //   child: Text('Selanjutnya'),
//                   // ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _licensePlateController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _licensePlateController = TextEditingController();
  String _vehicleType = 'Mobil';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://192.168.67.184:8080/register'),
        body: {
          'name': _nameController.text,
          'license_plate': _licensePlateController.text,
          'vehicle_type': _vehicleType,
        },
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registrasi gagal, coba lagi!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan nama';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _licensePlateController,
                decoration: InputDecoration(labelText: 'Plat Nomor'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan plat nomor';
                  } else if (value.length < 9 || value.length > 11) {
                    return 'Plat nomor harus terdiri dari 9 hingga 11 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _vehicleType,
                decoration: InputDecoration(labelText: 'Jenis Kendaraan'),
                onChanged: (newValue) {
                  setState(() {
                    _vehicleType = newValue!;
                  });
                },
                items: <String>['Mobil', 'Motor']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Registrasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
