class AppConstants {
  static String APP_NAME = "Trokis";
  static String bearerToken = "bearerToken";
  static String email = "email";
  static String textColor = "textColor";
  static String name = "name";
  static String userId = "userId";
  static String isLogged = "isLogged";
  static String subscription = "subscription";
  static String themeUrl = "themeUrl";
  // share preference Key
  static String THEME = "theme";
  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';

  static RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp passwordValidator = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  static bool validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$');
    return regex.hasMatch(value);
  }
  // static List<LanguageModel> languages = [
  //   LanguageModel( languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   LanguageModel( languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
  // ];
}
