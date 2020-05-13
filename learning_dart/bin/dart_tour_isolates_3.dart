import 'dart:isolate';

//Tutorial : https://www.youtube.com/watch?v=s8bwUr7hF9A

void main() async {
  var worker = await Worker.create();
  var result = await worker.doWork('Hi there!.');
  print(result);
  worker.finish();
}

class Worker {
  Isolate isolate;
  SendPort isolateSendPort;

  Worker._internal();

  static Future<Worker> create() async {
    var worker = Worker._internal();
    worker.isolateSendPort = await worker.newIsolate();
    return worker;
  }

  Future<SendPort> newIsolate() async {
    var uiReceivePort = ReceivePort();
    isolate = await Isolate.spawn(isolateEntry, uiReceivePort.sendPort);
    return await uiReceivePort.first;
  }

  static Future<void> isolateEntry(SendPort uiSendPort) async {
    var isolateReceivePort = ReceivePort();
    uiSendPort.send(isolateReceivePort.sendPort);

    await for (var tupleMsg in isolateReceivePort) {
      String data = tupleMsg[0];
      SendPort replyPort = tupleMsg[1];
      replyPort.send(data + ' Vishnu Prabhu');
    }
  }

  Future doWork(String message) async {
    var uiResponsePort = ReceivePort();
    isolateSendPort.send([message, uiResponsePort.sendPort]);
    // TODO check if, this is correct way to add error listener?
//    isolate.addOnExitListener(uiResponsePort.sendPort, response: 'Error');
//    isolate.addErrorListener(uiResponsePort.sendPort);
    return await uiResponsePort.first;
  }

  void finish() {
    isolate.kill();
  }
}



