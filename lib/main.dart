import 'package:flutter/material.dart';
import 'yenioge.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}
List _items =  [
  {
    "baslik": "Merhaba sdad",
    "not": "Bu çok iyi bir not"
  },
  {
    "baslik": "Merhaba 2",
    "not": "Bu çok iyi bir not 2"
  },
  {
    "baslik": "Merhaba 3 ",
    "not": "Bu çok iyi bir not 3"
  }
];
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(eklenecek: {}),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key,required this.eklenecek}) : super(key: key);

  final Map eklenecek;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}


class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();

    if(widget.eklenecek.isNotEmpty)
      {_items.add(widget.eklenecek);}
  }
  // Fetch content from the json file
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'img/logo.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Notlarım'))
            ],

          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(flex: 1,
                child:Image.asset('img/logo.png')),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(Icons.note),
                      title: Text(_items[index]["baslik"]),
                      subtitle: Text(_items[index]["not"]),
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,             MaterialPageRoute(
              builder: (context) => YeniOgeSayfa()));
        },
        tooltip: 'Yeni Öğe Ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}
