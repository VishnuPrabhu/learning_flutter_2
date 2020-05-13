import 'dart:isolate';

//Tutorial : https://www.youtube.com/watch?v=s8bwUr7hF9A

void main() async {
  var isolate = await newIsolate();
  print(await _async('print this 1', isolate));
  print(await _async('print this 2', isolate));
  print(await _async('print this 3', isolate));
  print(await _async('print this 4', isolate));
}

Future<SendPort> newIsolate() async {
  var uiReceivePort = ReceivePort();
  await Isolate.spawn(isolateEntry, uiReceivePort.sendPort);
  return await uiReceivePort.first;
}

Future<void> isolateEntry(SendPort uiSendPort) async {
  var isolateReceivePort = ReceivePort();
  uiSendPort.send(isolateReceivePort.sendPort);

  await for (var tupleMsg in isolateReceivePort) {
    String data = tupleMsg[0];
    SendPort replyPort = tupleMsg[1];
    replyPort.send(data + ' hello');
  }
}

Future _async(String message, SendPort isolateSendPort) async {
  var uiResponsePort = ReceivePort();
  isolateSendPort.send([message, uiResponsePort.sendPort]);
  return await uiResponsePort.first;
}



