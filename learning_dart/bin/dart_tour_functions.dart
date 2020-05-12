import 'dart:html';
import 'package:meta/meta.dart';

main() {

}

bool isNoble(int atomicNumber) {
  var _nobleGases = [];
  return _nobleGases[atomicNumber] != null;
}
// function works without atomic number also
isNoble2(atomicNumber) {
  var _nobleGases = [];
  return _nobleGases[atomicNumber] != null;
}

bool isNoble3(int atomicNumber) => 'Argon' != null;

//Optional Parameters
dummyMain1() {
  enableFlags(bold: true, hidden: false);

  scrollBar(key: 'key', child: 'child');

  say('Bob', 'Howdy');
  say('Bob,', 'Howdy', 'smoke signal');
}
void enableFlags({bool bold, bool hidden}) {}

void scrollBar({String key, @required String child}) {}

String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//Default parameter Values
void enableFlags2({bool bold = false, bool hidden = false}) {}

void dummyMain2() {
  enableFlags2(bold: true);
}

String say2(String from, String msg, [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

// list as default value for parameter
void doStuff({List<int> list = const[1, 2,  3],
              Map<String, String> gifts = const {
                'first' : 'paper',
                'second' : 'cotton',
                'third' : 'leather'
}}) {
  print('list: $list');
  print('gifts: $gifts');
}

void cascadeSyntax() {
  var dummyString = 'DummyString'
      ..length
      ..substring(0, 2)
      ..toLowerCase()
//    ..isEmpty = false
      ..length;
}

//Functions as first-class objects
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
dummyMain3() {
  list.forEach(printElement);

  list2.forEach((fruit) {
    print('${list2.indexOf(fruit)}: $fruit');
  });

  list2.forEach((item) => print('${list2.indexOf(item)}: $item'));
}
// assign a function to a variable
var loudify = (msg) => '!!! ${msg.toString().toUpperCase()} !!!';

//Anonymous functions
var list2 = ['apples', 'banans', 'oranges'];

//Lexical scope
bool topLevel = true;

void main2() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFuction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

//Lexical Closures
//Returns a function that adds [addBy] to the function's argument
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}
void main3() {
  //create a function that adds 2
  var add2 = makeAdder(2);

  //create a function that adds 4
  var add4 = makeAdder(4);

  var _5 = add2(3);
  var _7 = add4(3);
}

//Testing functions for equality
void foo() {}

class A {
  static void bar() {}
  void baz() {}
}

void main4() {
  var x;

  // comparing top-level functions.
  x = foo;
  assert(x == foo);

  // comparing static methods.
  x = A.bar;
  assert(x == A.bar);

  // comparing instance method
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // these closures refer to the same instance (#2),
  // so they are equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal
  assert(v.baz != w.baz);
}

//Return values
// All functions return a value. If no return is specified, then the statement is return null is implicitly appended to the function body.
foo2() {}
testReturn() {
  assert(foo == null);
}

// Assignment Null Operators
void test1() {
  int a = 5;
  int b;
  b ??= 10;
}

String playerName(String name) => name ?? 'Guest';




