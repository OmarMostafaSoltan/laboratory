import 'package:bloc/bloc.dart';



class SelectanalysesCubit extends Cubit<List<dynamic>>{
  SelectanalysesCubit() : super([]);

   // Add an item to the selected list
  void addItem(dynamic item) {
    if (!state.contains(item)) {
      emit([...state, item]);
    }
  }

  // Remove an item from the selected list
  void removeItem(dynamic item) {
    emit(state.where((element) => element != item).toList());
  }

  // Clear the list of selected items
  void clearItems() {
    emit([]);
  }

  


  // Check if the item is already selected
  bool isSelected(item) {
    return state.contains(item);
  }





}
