import 'dart_tour_variables_datatypes.dart';

void main1() {
  var names = List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  //names.add(42); // Error
}

abstract class Cache<T> {
  T getKey(String key);
  void setByKey(String key, T value);
}

//Using collection literals
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String> {'Seth', 'Kathy', 'Lars'};
var pages = <String, String> {
  'index.html': 'HomePage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machine'
};
var nameSet = Set<String>.from(names);
//Generic collections and the types they contain
void genericsAreReified() {
  var names = <String>[];
  print(names is List<String>);
}
//Note: In contrast, generics in Java use erasure, which means that generic type parameters are removed at runtime.
// In Java, you can test whether an object is a List, but you can’t test whether it’s a List<String>.
//Restricting the parameterized typec
class SomeBaseClass {}
class Extender extends SomeBaseClass {}
class Foo<T extends SomeBaseClass> {
  main() {
    print(T.runtimeType);
    var someBaseClassFoo = Foo<SomeBaseClass>();
    var extenderFoo = Foo<Extender>();

    // It is also OK to specify no generic argument
    var foo = Foo();
    print(foo); // Instance of 'Foo<SomeBaseClass>'

//    var foo2 = Foo<Object>(); // Incompatible type error
  }
  @override
  String toString() => 'Instance of Foo<$T>';
}
//Using generic methods
T first<T>(List<T> ts) {
  // Dp some initial work or error checking, then,,,
  T tmp = ts[0];
}

























