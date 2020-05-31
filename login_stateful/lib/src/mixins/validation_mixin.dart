import 'package:form_field_validator/form_field_validator.dart';

mixin ValidationMixin {
  String validateEmail(String value) {
    return MultiValidator([
      RequiredValidator(errorText: 'Please enter a valid email'),
      EmailValidator(errorText: 'Please enter a valid email!'),
    ]).call(value);
  }

  String validatePassword(String value) {
    return MultiValidator([
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be atleast 8 digits long'),
      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
          errorText: 'password must have atleast one special character'),
    ]).call(value);
  }
}
