import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_ecommerce_delivery_app/core/common/model/user_model.dart';
import 'package:simple_ecommerce_delivery_app/core/hive/hive_service.dart';
import 'package:simple_ecommerce_delivery_app/features/profile_tab/service/profile_service.dart';
import 'package:simple_ecommerce_delivery_app/init_dependencies.dart';

final profileCtrProvider =
    StateNotifierProvider.autoDispose<_ProfileCtr, ProfileState>(
      (ref) => _ProfileCtr(
        ref,
        profileService: serviceLocator(),
        hiveService: serviceLocator(),
      ),
    );

class _ProfileCtr extends StateNotifier<ProfileState> {
  final Ref ref;
  final ProfileService profileService;
  final HiveService hiveService;
  _ProfileCtr(
    this.ref, {
    required this.profileService,
    required this.hiveService,
  }) : super(ProfileState(user: AsyncValue.loading()));
}

class ProfileState {
  final AsyncValue<UserModel> user;
  final bool? buttonLoading;

  ProfileState({required this.user, this.buttonLoading});

  ProfileState copyWith({AsyncValue<UserModel>? user, bool? buttonLoading}) {
    return ProfileState(
      user: user ?? this.user,
      buttonLoading: buttonLoading ?? this.buttonLoading,
    );
  }
}
