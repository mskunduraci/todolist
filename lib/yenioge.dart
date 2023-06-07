import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import 'main.dart';
class YeniOgeSayfa extends StatefulWidget {
  const YeniOgeSayfa({Key? key}) : super(key: key);
  @override
  State<YeniOgeSayfa> createState() => _YeniOgeState();
}
String str='';
class _YeniOgeState extends State<YeniOgeSayfa> {

  TextEditingController yapilacakController=new TextEditingController();
  TextEditingController baslikController=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'img/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Yeni Not Ekle'))
          ],

        ),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: baslikController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Başlık',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: yapilacakController,
                maxLines: 17,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birşeyler yazın...',
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          var obj={};
            String baslik=baslikController.text;
            String notlar=yapilacakController.text;
            try {

               obj = {
                  "baslik": baslik,
                  "not": notlar,
              };

            } catch(e) {
              print(e);
            }
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AnaSayfa(eklenecek: obj)),
                  ModalRoute.withName('/'),
                );

        },
        tooltip: 'Kaydet',
        child: const Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}