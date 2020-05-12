//Instance methods
import 'dart:math';

class Point {
  num x, y;

  Point(this.x, this.y);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Defined two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;

  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define and abstract method.

  Doer();

  //factory constructor inside abstract class
  factory Doer.newInstance(String type) {
    return EffectiveDoer();
  }
}

class EffectiveDoer extends Doer {

  EffectiveDoer(): super();

  @override
  void doSomething() {
    // provide and implementation, so the method is not abstract here...
  }
}

// Implicit Interfaces
// A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name';
}

// An implementation of the Person interface.
class Imposter implements Person {
  @override
  String get _name => '';

  @override
  String greet(String who) => 'Hi $who, Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main1() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Imposter()));
}

//Extending a class
//class Television {
//  void turnOn() {
//    _illuminateDisplay();
//    _activateIRSensor();
//  }
//}
//class SmartTelevision extends Television {
//  void turnOn() {
//    super.turnOn();
//    _bootNetworkInterface();
//    _initializeMemory();
//    _upgradeApps();
//  }
//}

//Covariant Keywork
class Animal {
  void chase(covariant Animal x) {}
}
class Mouse extends Animal {}
class Cat extends Animal {
//  @override
//  void chase(covariant Mouse x) {
//    super.chase(x);
//  }
    //or
  @override
  void chase(Mouse x) {
    super.chase(x);
  }
}

// Override operators
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector other) => Vector(x + other.x, y + other.y);
  Vector operator -(Vector other) => Vector(x - other.x, y - other.y);
}
void main2() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  final z = v + w;
}

class A {
  //unless you override noSuchMethod, using a non-existent member
  //results in NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('you tried to use a non-exitent member: ${invocation.memberName}');
  }
}

// Extension methods
extension on String {
  int parseInt() {
    return int.parse(this);
  }
}
extension DoubleParsing on String {
  double parseDouble() {
    return double.parse(this);
  }
}
extension MyFancyList<T> on List<T> {
  int get doubleLenght => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => <List<T>>[sublist(0, at), sublist(at)];
}
// Enumerated Types
enum Color { red, green, blue }
void main3() {
  assert(Color.red.index == 0);
  print(Color.values);

  var aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      break;
    case Color.green:
      break;
    default:
      break;
  }
}
//Adding features to a class: mixins
//declare no constructor, use mixin keywork,
//mixin is similar to class
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

//To specify that only certain types can use the mixin —
//for example, so your mixin can invoke a method that it doesn’t define
// — use on to specify the required superclass:
mixin PianoMusicalPerformer on Musical {
  @override
  bool canPlayPiano = true;

  void skill() {
    canCompose = true;
  }

  //also write custom methods
}

//Class variables and methods
//uses static keyword
//Static variable
class Queue {
  static const initialCapacity = 16;

  void main() {
    assert(Queue.initialCapacity == 16);
  }
}
//static methods
class Point2 {
  num x, y;
  Point2(this.x, this.y);

  static num distanceBetween(Point2 a, Point2 b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }

  void main() {
    var a = Point2(2, 2);
    var b = Point2(3, 3);
    var distance = Point2.distanceBetween(a, b);
    print(distance);
  }
}






















