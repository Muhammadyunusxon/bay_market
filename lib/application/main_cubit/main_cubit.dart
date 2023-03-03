import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  changePage(int select) {
    emit(state.copyWith(select: select));
  }
}
