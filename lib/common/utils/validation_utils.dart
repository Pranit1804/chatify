enum ValidationType { name, text, email, phone }

class ValidationUtils {
  static get emailRegEx => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static get zipCodeRegex => RegExp(r'^\d{6}$');
  static get phoneNumber =>
      RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
  static get nameRegEx =>
      RegExp(r"^[a-zA-Z]+(([',\.\-\s][a-zA-Z ])?[a-zA-Z]*)*$");

  static String? validator(
      String? value, ValidationType type, String fieldName) {
    String? concatText = value?.trim();
    if (type == ValidationType.text) {
      if (concatText == null || concatText.isEmpty) {
        return 'Please enter your $fieldName';
      }
    } else if (type == ValidationType.name) {
      if (concatText == null || concatText.isEmpty) {
        return 'Please enter your $fieldName';
      }
      if (!nameRegEx.hasMatch(concatText)) {
        return 'Please enter a valid $fieldName';
      }
    } else if (type == ValidationType.email) {
      if (concatText == null || concatText.isEmpty) {
        return 'Please enter your $fieldName';
      }
      if (!emailRegEx.hasMatch(concatText)) {
        return 'Please enter a valid $fieldName';
      }
    } else if (type == ValidationType.phone) {
      if (!phoneNumber.hasMatch(concatText)) {
        return 'Please enter a valid $fieldName';
      }
    }

    return null;
  }
}
