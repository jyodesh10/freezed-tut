import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial(true));

  changeTheme() {
    state.isDark == false ? emit(state.copyWith(isDark: true)) : emit(state.copyWith(isDark: false));
  }
}
