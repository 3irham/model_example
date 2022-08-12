import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:model_example/models/product.dart';
import 'dart:io';
import 'dart:math';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final Faker fake = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
          'http://picsum.photos/id/$index/200',
          faker.food.restaurant(),
          10000 + Random().nextInt(100000),
          faker.lorem.sentences(1).toString());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('MarketPlace'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(
              dummyData[index].imageURL,
            ),
            footer: Container(
              height: 75,
              alignment: Alignment.center,
              color: Color(0xFFF5F5F5).withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dummyData[index].judul,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Color.fromARGB(249, 255, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Rp ${dummyData[index].harga.toString()}"),
                  Text(
                    dummyData[index].deskripsi,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
