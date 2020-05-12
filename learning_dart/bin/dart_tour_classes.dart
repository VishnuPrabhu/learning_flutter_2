import 'dart:math';
import 'dart:async';

import 'person_class.dart';

class Point {
  int x, y;
  Point({this.x, this.y});

  Point.fromJson(String json) {
    x = 0;
    y = 0;
  }
}

dummyMain1() {
  var p = Point(x: 2, y: 2);
  p.y = 3;
  assert(p.y == 3);

  // If p is non-null, then set its y value to 4.
  p?.y = 4;

  var x = Point.fromJson('');
  print(x);

  //Getting an object’s type
  var point = Point(x: 1, y: 1);
  point.runtimeType;

}
//Instance variables
class Point2 {
  num x; // Declare instance variable x, initially null.
  num y; // Declare y, initially null.
  num z = 0; // Declare z, initially 0.

  Point2.fromJson(Map<String, num> json)
      : x = json['x'], y = json['y'] {
    print('In Point2.fromJson(): {x: $x, y: $y}');
  }
}

// Constructor
class Person {
  String firstName;
  String lastName;

  Person.fromJson(Map data) {
    print('in Person');
  }

}

class Employee extends Person {
  String empId;
  // person does not have a default constructor;
  // you must call super.fromJson(data)
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }

  Employee.fromJson2(Map<String, String> json)
      : empId = json['id'], super.fromJson({})
  {
    print('call both init & super constructor');
  }
}

main() {
  var emp = Employee.fromJson({});
  if (emp is Person) {
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
}

// initializer list
class Point3 {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point3(x, y): x = x, y = y,
      distanceFromOrigin = sqrt(x * x + y * y);
}
//Redirecting constructors
class Point4 {
  num x, y;

  // The main constructor for this class.
  Point4(this.x, this.y);

  // Delegate to the main constructor
  Point4.alongXAxis(num x): this(x, 0);
}
//Constant constructors
class ImmutablePoint {

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

//Factory constructor
//returns an instance from a cache or it might return an instance of a subtype.abstract
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
  //Note: Factory constructors have no access to this.

  Logger._internal(String name) : name = name;
}

dummyMain2() {
  var logger = Logger('UI');
}

// Abstract class with constructor
abstract class AbstractClass {
  AbstractClass._internal(String name);
}
class ConcreteClass extends AbstractClass {
  ConcreteClass(): super._internal('');

  void test(AbstractClass test) {

  }

  void test2(AbstractClass Function() test3) {

  }

  void test3([FutureOr<String> Function() computation]) {
    var x = computation();
    print(x);
  }

  void main<T>() {
    test2(() {
      return ConcreteClass();
    });
    test2(() => ConcreteClass());
  }
}
