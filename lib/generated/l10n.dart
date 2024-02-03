// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Choose Language`
  String get one {
    return Intl.message(
      'Choose Language',
      name: 'one',
      desc: '',
      args: [],
    );
  }

  /// `Ar`
  String get two {
    return Intl.message(
      'Ar',
      name: 'two',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get three {
    return Intl.message(
      'En',
      name: 'three',
      desc: '',
      args: [],
    );
  }

  /// `Choose Product`
  String get onboardingtitle1 {
    return Intl.message(
      'Choose Product',
      name: 'onboardingtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Easy And Safe Payment`
  String get onboardingtitle2 {
    return Intl.message(
      'Easy And Safe Payment',
      name: 'onboardingtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Order`
  String get onboardingtitle3 {
    return Intl.message(
      'Track Your Order',
      name: 'onboardingtitle3',
      desc: '',
      args: [],
    );
  }

  /// `We Have a 100k+ Products, Choose\n Your products from E-\ncommerce shop.`
  String get onboardingcontent1 {
    return Intl.message(
      'We Have a 100k+ Products, Choose\n Your products from E-\ncommerce shop.',
      name: 'onboardingcontent1',
      desc: '',
      args: [],
    );
  }

  /// `Easy Checkout And Safe Payment \nmethod. Trusted by our Customers \nfrom all over the world.`
  String get onboardingcontent2 {
    return Intl.message(
      'Easy Checkout And Safe Payment \nmethod. Trusted by our Customers \nfrom all over the world.',
      name: 'onboardingcontent2',
      desc: '',
      args: [],
    );
  }

  /// `Best Tracker has been Used For \nTrack your order. You'll know where\n your product is at the moment.`
  String get onboardingcontent3 {
    return Intl.message(
      'Best Tracker has been Used For \nTrack your order. You\'ll know where\n your product is at the moment.',
      name: 'onboardingcontent3',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get onboardingcustombutton {
    return Intl.message(
      'Continue',
      name: 'onboardingcustombutton',
      desc: '',
      args: [],
    );
  }

  /// ` Sign In `
  String get signin {
    return Intl.message(
      ' Sign In ',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get signintitle {
    return Intl.message(
      'Welcome Back',
      name: 'signintitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your email and password or continue with social media`
  String get signincontent {
    return Intl.message(
      'Sign in with your email and password or continue with social media',
      name: 'signincontent',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enteryouremail {
    return Intl.message(
      'Enter your email',
      name: 'enteryouremail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enteryourpassword {
    return Intl.message(
      'Enter your password',
      name: 'enteryourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetpassword {
    return Intl.message(
      'Forget password',
      name: 'forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// ` Don't have an account ? `
  String get donthaveanaccount {
    return Intl.message(
      ' Don\'t have an account ? ',
      name: 'donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up `
  String get signup {
    return Intl.message(
      ' Sign Up ',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Welcome here!`
  String get signuptitle {
    return Intl.message(
      'Welcome here!',
      name: 'signuptitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enteryourusername {
    return Intl.message(
      'Enter your username',
      name: 'enteryourusername',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone`
  String get enteryourphone {
    return Intl.message(
      'Enter your phone',
      name: 'enteryourphone',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with your email and password or continue with social media`
  String get signUpcontent {
    return Intl.message(
      'Sign Up with your email and password or continue with social media',
      name: 'signUpcontent',
      desc: '',
      args: [],
    );
  }

  /// ` Have an account ? `
  String get haveanaccount {
    return Intl.message(
      ' Have an account ? ',
      name: 'haveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Check Email`
  String get checkemail {
    return Intl.message(
      'Check Email',
      name: 'checkemail',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address to recive a verification code. `
  String get forgetpasscontent {
    return Intl.message(
      'Please enter your email address to recive a verification code. ',
      name: 'forgetpasscontent',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifycode {
    return Intl.message(
      'Verify Code',
      name: 'verifycode',
      desc: '',
      args: [],
    );
  }

  /// `Check Code`
  String get checkcode {
    return Intl.message(
      'Check Code',
      name: 'checkcode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the digit code sent to zainabhamdy001@gmail.com`
  String get checkcodecontent {
    return Intl.message(
      'Please enter the digit code sent to zainabhamdy001@gmail.com',
      name: 'checkcodecontent',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetpass {
    return Intl.message(
      'Reset password',
      name: 'resetpass',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newpass {
    return Intl.message(
      'New password',
      name: 'newpass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter new password`
  String get resetpasscontent {
    return Intl.message(
      'Please enter new password',
      name: 'resetpasscontent',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter your password`
  String get reenteryourpassword {
    return Intl.message(
      'Re-Enter your password',
      name: 'reenteryourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Account successfully created`
  String get successsignup {
    return Intl.message(
      'Account successfully created',
      name: 'successsignup',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations`
  String get congratulations {
    return Intl.message(
      'Congratulations',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Registered`
  String get successfullyregistered {
    return Intl.message(
      'Successfully Registered',
      name: 'successfullyregistered',
      desc: '',
      args: [],
    );
  }

  /// `Go To Login`
  String get gotologin {
    return Intl.message(
      'Go To Login',
      name: 'gotologin',
      desc: '',
      args: [],
    );
  }

  /// `Password has been reset successfully`
  String get passwordhasbeenresetsuccessfully {
    return Intl.message(
      'Password has been reset successfully',
      name: 'passwordhasbeenresetsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Can not be embty`
  String get cannotbeembty {
    return Intl.message(
      'Can not be embty',
      name: 'cannotbeembty',
      desc: '',
      args: [],
    );
  }

  /// `Can not be less than`
  String get cannotbelessthan {
    return Intl.message(
      'Can not be less than',
      name: 'cannotbelessthan',
      desc: '',
      args: [],
    );
  }

  /// `Can not be larger than`
  String get cannotbelargerthan {
    return Intl.message(
      'Can not be larger than',
      name: 'cannotbelargerthan',
      desc: '',
      args: [],
    );
  }

  /// `Not valid username`
  String get notvalidusername {
    return Intl.message(
      'Not valid username',
      name: 'notvalidusername',
      desc: '',
      args: [],
    );
  }

  /// `Not valid email`
  String get notvalidemail {
    return Intl.message(
      'Not valid email',
      name: 'notvalidemail',
      desc: '',
      args: [],
    );
  }

  /// `Not valid phone number`
  String get notvalidphonenumber {
    return Intl.message(
      'Not valid phone number',
      name: 'notvalidphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to exit from this app`
  String get doyouwanttoexitfromthisapp {
    return Intl.message(
      'Do you want to exit from this app',
      name: 'doyouwanttoexitfromthisapp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
