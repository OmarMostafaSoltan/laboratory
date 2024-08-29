import 'package:al_ansary/store_data/branches_locations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveBranches(List<BrancheData> branches) async {
  final CollectionReference branchesCollection = FirebaseFirestore.instance.collection('branches');
  await branchesCollection.get();
  for (var i = 0; i < branches.length; i++) {
    final branch = branches[i];
    await branchesCollection.doc('branch_$i').set(branch.toMap());
  }
}
