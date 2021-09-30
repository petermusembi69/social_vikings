import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ask_question_state.dart';
part 'ask_question_cubit.freezed.dart';

class AskQuestionCubit extends Cubit<AskQuestionState> {
  AskQuestionCubit() : super(const AskQuestionState.initial());
}
