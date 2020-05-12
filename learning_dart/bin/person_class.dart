class Person {
  String firstName;

  Person(this.firstName);

  void printName() {
    print(firstName);
  }
}

void main() {
  var person = Person('Vishnu Prabhu');
  person.printName();
}