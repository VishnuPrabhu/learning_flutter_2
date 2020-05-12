main() {
  var number = 42;
  printInteger(number);

  var constantList = const [1, 2, 3];
  //constantList[1] = 1; //Will throw run time exception
}

//A basic Dart program
printInteger(int aNumber) {
  print('The number is $aNumber');
}

//Variables
var name = 'Bob';
dynamic name2 = 'Bob';
String name3 = 'Bob';

int lineCount;
//assert(lineCount == null);

//Final and const
final name4 = 'Bob';
final String nickname = 'Bobby';

//name4 = 'Alice'; // Error a final variable can only be set once

const bar = 10000000; // Unit of pressuer (dynes/cm2)
const double atm = 1.01325 * bar; // standard atmosphere

var foo = const [];
final bar2 = const [];
const baz = []; // Equivalent to `const []`
dummyTest() {
  foo = [1];
  //bar2 = [2]; // final can be assigned only once
  //baz = [3]; // constant variables can be assigned only when declaration
}

const Object i = 3; // Where i is a const Object with an int value...abstract
const list = [i as int]; // Use as a typecase.
const map = {if (i is int) i: "int"}; // use is and collection if.
const set = {if (list is List<int>) ...list};// ... and a spread

// parsing
var one = int.parse('1');
var isEmpty = false;

var list2 = [1, 2, 3];
//print(list2.size);
dummyTest2() {
  var constantList = const [1, 2, 3];
  //constantList[1] = 1; Will throw run time exception
}

// spread operator ...
var list3 = [1, 2, 3];
var list4 = [0, ...list3];
// null-aware spread operator ...?
var list5;
var list6 = [0, ...?list5];

// collectionif , collectionfor
var nav = ['Home',
            'Furniture',
            'Plants',
            if (true) 'Outlet'];

var listOfInts = [1,2,3];
var lsitOfStrings = [
  '#0',
  for (var i in listOfInts) '#i'
];

// Set
var hologens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

var names = <String>{};
//Set<String> names = {}; // This works, also.
//var names = {}; creates a map(dictionary) not a set.
final constantSet = const {
  'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine',
};
testDummy3() {
  //constantSet.add('helium'); uncommenting this wil not compile
}

// Map
var gifts = {
  //key : //value
  'first': 'partridge',
  'second': 'turtlecoves',
  'fifth': 'golden rings'
};
var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon'
};
testDummy4() {
  var one2= gifts['first'];
  gifts['first'] = 'Test';
}
final constMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon'
};



