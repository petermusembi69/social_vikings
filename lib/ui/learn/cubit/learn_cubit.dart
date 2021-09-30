import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn_state.dart';
part 'learn_cubit.freezed.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit() : super(const LearnState.initial());
}
