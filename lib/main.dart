import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  /*
  * SALVANDO DADOS NO FIREBASE
  */
  Firestore.instance
      .collection("mensagens")
      .document()
      .setData({"Ok Ok ": "Teste", "From": "Allef", "read": false});

  /*
  * LENDO DADOS NO FIREBASE
  */
  QuerySnapshot snapshot =
      await Firestore.instance.collection("mensagens").getDocuments();
  snapshot.documents.forEach((d) {
    d.reference.updateData({"lido": true});
    print(d.data);
  });

  /*
  * LENDO DADOS NO FIREBASE POR ID
  */
  DocumentSnapshot snapshot2 =
      await Firestore.instance.collection("mensagens").document("msg2").get();
  print(snapshot2.data);
  print(snapshot2.documentID);

  /*
  * LENDO MODIFICAÇÕES DO BD EM TEMPO REAL
  */
  Firestore.instance.collection("mensagens").snapshots().listen((dado) {
    dado.documents.forEach((f){
      print(f.data);
    });
  });

  /*
  * LENDO MODIFICAÇÕES DO DOCUMENTO EM TEMPO REAL
  */
  Firestore.instance.collection("mensagens").document("UK0W3tjeWbajdJAMwGYM").snapshots().listen((dado) {
      print(dado.data);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
