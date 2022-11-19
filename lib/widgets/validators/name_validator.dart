// Validates email format
class NameValidator{
  static bool isNameFormatNotValid(String value) {
    String p = '[a-zA-Z]';
    RegExp regExp = RegExp(p);
    if (!regExp.hasMatch(value) || value == null){
      return true;
    } else{
      return false;
    }
  }
}
