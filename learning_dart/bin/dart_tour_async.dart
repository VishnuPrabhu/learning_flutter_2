//Asynchrony support
/*
Future<void> fetchUserOrder() {
  // Imagine that this function is fetching user info from another service or database
//  return Future.delayed(Duration(seconds: 3), () => print('Large Latte'));
  return Future.delayed(Duration(seconds: 3), () {
    return 'Large Latte';
  });
}

Future<void> fetchUserOrderError() {
  return Future.delayed(Duration(seconds: 3), () => throw Exception('Logout failed: userID is invalid'));
}
Future<void> main() async {
//  await fetchUserOrder();
////  fetchUserOrderError();
  print('Fetching user order...');
  print(await createOrderMessage());
}

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder2();
  return 'Your order is: $order';
}
*/

//
/*
void printOrderMessage () async {
  print('Awaiting user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<void>main() async {
  countSeconds(4);
  await printOrderMessage();
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(s) {
  for( var i = 1 ; i <= s; i++ ) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
*/
//
import 'dart:async';

void printOrderMessage () async {
  try {
    var order = await fetchUserOrder();
    print('Awaiting user order...');
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex.
  var str = Future.delayed(Duration(seconds: 4), () => throw 'Cannot locate user order');
  return str;
}

Future<void> main4() async {
  var automaticallyWrapStringToFuture = await 'auto';
  await printOrderMessage();
}

// Stream
// async or await for
// 'await for'
//await for (var identifier in expression) {
//  // Executes each timethe stream emits a value
//}
// To stop listening to the stream, you can use a break or return statement.

//Generators
// Synchronous
Iterable<int> naturalsTo(int n) sync* {
  var k = 0;
  while (k < n) {
    yield k++;
  }
}
// Asynchronous
Stream<int> asynchronousNaturalsTo(int n) async* {
  var k = 0;
  while (k < n) {
    yield k++;
  }
}
// If your generator is recursive, you can improve its performance by using yield*
Iterable<int> naturalsDownTo(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownTo(n -1);
  }
}

//Callable classes
class WannableFunction {
  String call(String a) => 'Hello $a';
}
main() {
  var wf = WannableFunction();
  var out = wf('Bob');
  print(out);
}

