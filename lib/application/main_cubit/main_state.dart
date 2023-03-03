part of 'main_cubit.dart';

class MainState {
  int selected;

  MainState({this.selected = 0});

  MainState copyWith({int? select}) {
    return MainState(selected: select ?? selected);
  }
}
