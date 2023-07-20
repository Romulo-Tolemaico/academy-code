import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getInvernadero() async {
  List invernadero = [];
  CollectionReference collectionReferenceInvernadero =
      db.collection('invernadero');
  QuerySnapshot queryInvernadero = await collectionReferenceInvernadero.get();
  queryInvernadero.docs.forEach((element) {
    invernadero.add(element.data());
  });

  return invernadero;
}
