import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/language_cach_helper.dart';

part 'locale_state.dart';
class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState());
  Future<void> getSavedLanguage() async {
    final String? cachedLanguageCode =
        await LanguageCachHelper().getCachedLanguageCode();
    emit(
      ChangeLocaleState(
        locale: cachedLanguageCode != null ? Locale(cachedLanguageCode) : null,
      ),
    );
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCachHelper().cachLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
