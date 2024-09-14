
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePackages(List<Package> packages) async {
  final CollectionReference packageCollection = FirebaseFirestore.instance.collection('packages');
  await packageCollection.get();
  for (var i = 0; i < packages.length; i++) {
    final package = packages[i];
    await packageCollection.doc('package_$i').set(package.toMap());
  }
}