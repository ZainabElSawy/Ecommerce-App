part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
class SettingsLoading extends SettingsState {}

class SettingsSuccess extends SettingsState {
  final SettingsModel settings;
  SettingsSuccess(this.settings);
}

class SettingsServerFailure extends SettingsState {
  final String errMessage;
  SettingsServerFailure(this.errMessage);
}

class SettingsNetworkFailure extends SettingsState {
  final String errMessage;
  SettingsNetworkFailure(this.errMessage);
}