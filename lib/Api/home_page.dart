import 'package:flutter/material.dart';
import 'package:qwerty/Api/products.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:qwerty/Api/product_card.dart';
// import 'product_card.dart';
// import 'products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Products>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://192.168.10.239:8000/produk'));

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => Products.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Products>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<Products>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<Products>)[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductCard(
                              products: Products(
                                  idProduk: post.idProduk,
                                  namaProduk: post.namaProduk,
                                  hargaProduk: post.hargaProduk),
                              width: 0,
                            ),
                            const SizedBox(height: 20)
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: (snapshot.data as List<Products>).length);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
