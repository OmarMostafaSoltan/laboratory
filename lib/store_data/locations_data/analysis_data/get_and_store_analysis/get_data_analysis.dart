
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Analysis>> readAnalysis() async {
  final CollectionReference analysesCollection = FirebaseFirestore.instance.collection('analyses');
  
  // Fetch all documents in the collection
  final QuerySnapshot querySnapshot = await analysesCollection.get();
  
  // Convert the documents into a list of Analysis objects
  List<Analysis> analyses = querySnapshot.docs.map((doc) {
    return Analysis.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
  
  
  return analyses;
}