import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutCubit extends Cubit<int> {
  MainLayoutCubit() : super(0);
  int selectedPage = 0;
  void init([int? initially]) => changePage(initially);
  void changePage(int? index) {
    if (index == null) return;
    selectedPage = index;
    emit(index);
  }
}
