import 'dart:async';
import 'dart:io';
import 'dart:isolate';

// Please do watch https://www.youtube.com/watch?v=qrFTt1NZed8

Future<SendPort> initIsolate() async {
  var completer = Completer<SendPort>();
  var isolateToMainStream = ReceivePort();

  isolateToMainStream.listen((data) {
    if (data is SendPort) {
      var mainToIsolateStream = data;
      completer.complete(mainToIsolateStream);
    } else {
      print('[isolateToMainStream] $data');
    }
  });

  var myIsolateStream = await Isolate.spawn(myIsolate, isolateToMainStream.sendPort);
  return completer.future;
}

void myIsolate(SendPort isolateToMainStream) {
  var mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  mainToIsolateStream.listen((data) {
    print('[mainToIsolateStream] $data');
    exit(0);
  });

  isolateToMainStream.send('This is from myIsolate()');
}

void main() async {
  var mainToIsolateStream = await initIsolate();
  mainToIsolateStream.send('This is from main()');
}