void main(List<String> arguments) {
  var name = myName();
  print('My name is $name');
  
  var dynamicVariable = dynamicTypeFunction();
  print(dynamicVariable);
}

String myName() {
  return 'Vishnu Prabhu';
}

dynamicTypeFunction() {
  return 'Vishnu PRabhu';
}