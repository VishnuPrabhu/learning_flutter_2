// if and else
// for loops
// while do-while
// break and continue
// switch and case
// assert

//if (isRaining()) {
//  you.bringRainCoat();
//} else if (isSnowing()) {
//  you.wearJacket();
//} else {
//  car.putTopDown();
//}

void doSomething() {}
class Candidate {
  int yearsOfExperience;
  void interview() {}
}
bool shutDownRequested() => true;
void processIncomingRequests() {}
void executeCompileError() {}
dummyMain() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }


  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());


  var candidates = <Candidate>[];
  candidates.forEach((candidate) => candidate.interview());

  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x);
  }

  bool isDone;
  while(!isDone) {
    doSomething();
  }

  bool atEndOfPage() => true;
  do {
    print('line');
  } while (!atEndOfPage());


  while(true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }

  for (var i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsOfExperience < 5) {
      continue;
    }
    candidate.interview();
  }

  // or

  candidates
      .where((c) => c.yearsOfExperience >= 5)
      .forEach((c) => c.interview());
}

//Switch and case
void dummyMain2() {
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      //executeClosed();
      break;
    case 'PENDIND':
      //executePending();
      break;
    case 'APPROVED':
      //executeApproved();
      break;
    case 'DENIED':
      //executeDenied();
      break;
    case 'OPEN':
      //executeOpen();
      break;
//    case 'CompileError':
//      executeCompileError(); // no break
    case 'EmptyCaseAutoFallback':
    case 'FallBackUsingContinue':
      continue nowClosed;
    nowClosed:
    case 'NOW_CLOSED':
      break;
    default:
      //executeUnknown();
  }
}

dummyMain4() {
  void exception() {
    throw FormatException('Excepted atleast 1 section');
    throw 'Out of Ilamas';
  }
  void distanceTo(int other) => throw UnimplementedError();

//  try {
//    breedMoreLlamas();
//  } on OutOfLlamasException {
//    buyMoreLlamas();
//  }

//  try {
//    breedMoreLlamaz();
//  } on OutOfLlamasException {
//    buyMoreLlamas();
//  } on Exception catch(e) {
//    print('unknown exception : $e');
//  } catch (e) {
//    print('SomeThing really unknown: $e');
//  }

    try {
      //
    } on Exception catch (e) {
      print('Exception details: \n $e');
    } catch (e, s) {
      print('Exception Details:\n $e');
      print('Stack trace:\n $s');
    }

    void misbehave() {
      try {
        dynamic foo = true;
        print(foo++); // Runtime Error
      } catch (e) {
        print('misbehave() partially handled ${e.runtimeType}');
        rethrow;  // Allow callers to see the exception.
      }
    }

    void mains() {
      try {
        misbehave();
      } catch (e) {
        print('mains() finished handling ${e.runtimeType}');
      }
    }

    try {
//      breedMoreLlamas();
    } finally {
      // Always clean up, even if an exception is thrown.
    }

    try {
      //
    } on Exception catch (e) {
      print(e);
    } finally {
      // clean any resource here
    }
}






















