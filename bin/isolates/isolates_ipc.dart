// This file is the second lecture of isolates. In this file we discuss abour Isolate IPC (Inter Process Communication).
// Each isolate has its own memory, so they can’t share variables directly. They communicate using ports, like: ReceivePort — used to receive messages (acts like a stream). SendPort — used to send messages (acts like a sink).

import 'dart:isolate';

// main function code will run in main isolate.
void main(List<String> args) async {
  // Creates ReceivePort in main isolate to receive messages from foo isolate.
  ReceivePort receivePort = ReceivePort();
  // receivePort.listen will listen the messages comming to main isolate.
  receivePort.listen(
    (message) {
      if (message is SendPort) {
        message.send("Hi Foo ! I am Main.");
      } else {
        print(message);
      }
    },
  );

  // Isolate.spawn() will create another isolate which will run parallel to main isolate. This starts a new isolate, passing main’s SendPort to foo, allowing foo to send messages back to main.
  Isolate.spawn(foo, receivePort.sendPort);

  // we put delay here so we can see the isolate communication on terminal.
  await Future.delayed(const Duration(seconds: 10));
}

// Think of ReceivePort as a stream → it receives. Think of SendPort as a sink → it sends. But sendPort.send() is not like adding to a stream’s sink, it's direct messaging to another isolate via port.
// foo() has a parameter of sendPort so that who ever will call this function, he has to send the sendPort message to this new Isolate.
void foo(SendPort sendPort) async {
  // ReceivePort(Specialize stream) object is made to receive messages from main isolate.
  ReceivePort receivePort = ReceivePort();
  // Here we listen receivePort as stream. When ever message come from main isolate it will listen and print it.
  receivePort.listen((message) => print('Hellow suuuuuu: $message'));
  // This line sends the SendPort of receivePort to the main isolate. So that main isolate can send messages back to foo isolate. This allows two-way communication (main ↔ isolate).
  // Without sending this receivePort.sendPort to main, the main isolate cannot send messages to foo.
  sendPort.send(receivePort.sendPort);

  for (var i = 0; i < 100; i++) {
    await Future.delayed(const Duration(seconds: 1));
    // sendPort.send is like sink.add(), so it will  sends a message to the port (ReceivePort) in main isolate, not to a stream.
    sendPort.send('Downloaded $i%');
  }
}

/* Summary:
First of all clerify the statements:
ReceivePort receivePort = ReceivePort();  is the object of ReceivePort. 
receivePort.listen() is same a listening the stream. ecause messages will come asynchronously from other isolate to this isolate so it will create a collection of async messages (stream).
Isolate.spawn(foo, receivePort.sendPort); will create new isolate that will run parallel to main isolate. In it's parameter first we give function name that has to run in this second isolate and then there is parameter of foo() function.
await Future.delayed(const Duration(seconds: 10)); it is just to create dummy delayso that we can see the messages between both isolates.
Then in foo() function sendPort.send(receivePort.sendPort); means you are sending your isolate’s sendPort (from receivePort.sendPort) to the main isolate To allow the main isolate to send messages back to the isolate where foo() is running. 
sendPort.send('Downloaded $i%'); You are sending a string message ("Downloaded x%") from this isolate to the main isolate.




*/
