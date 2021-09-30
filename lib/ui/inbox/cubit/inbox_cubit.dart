import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_state.dart';
part 'inbox_cubit.freezed.dart';

class InboxCubit extends Cubit<InboxState> {
  InboxCubit() : super(const InboxState.initial());
}
