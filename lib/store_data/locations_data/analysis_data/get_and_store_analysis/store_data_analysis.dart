
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveAnalysis(List<Analysis> analyses) async {
  final CollectionReference analysesCollection = FirebaseFirestore.instance.collection('analyses');
  await analysesCollection.get();
  for (var i = 0; i < analyses.length; i++) {
    final analysis = analyses[i];
    await analysesCollection.doc('analysis_$i').set(analysis.toMap());
  }
}