class NumberValidator{
  static bool isNumberFormatNotValid(String value) {
    String p = r'^[0-9]+$';
    RegExp regExp = RegExp(p);
    if (!regExp.hasMatch(value) || value == null){
      return true;
    } else{
      return false;
    }
  }
}