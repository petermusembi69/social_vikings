import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_policy_state.dart';
part 'privacy_policy_cubit.freezed.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit() : super(const PrivacyPolicyState.initial());
}
