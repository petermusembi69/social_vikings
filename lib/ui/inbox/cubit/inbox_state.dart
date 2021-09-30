part of 'inbox_cubit.dart';

@freezed
abstract class InboxState with _$InboxState {
  const factory InboxState.initial() = _Initial;
}
