
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Package>> readPackage() async {
  final CollectionReference packageCollection = FirebaseFirestore.instance.collection('packages');
  
  // Fetch all documents in the collection
  final QuerySnapshot querySnapshot = await packageCollection.get();
  
  // Convert the documents into a list of Package objects
  List<Package> packages = querySnapshot.docs.map((doc) {
    return Package.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
  
  
  return packages;
}