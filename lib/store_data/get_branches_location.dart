

import 'package:almokhtabarlab/store_data/branches_locations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<BrancheData>> readBranches() async {
  final CollectionReference branchesCollection = FirebaseFirestore.instance.collection('branches');
  
  // Fetch all documents in the collection
  final QuerySnapshot querySnapshot = await branchesCollection.get();
  
  // Convert the documents into a list of BrancheData objects
  List<BrancheData> branches = querySnapshot.docs.map((doc) {
    return BrancheData.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
  
  print(branches);
  return branches;
}

