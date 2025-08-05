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
        print(message);  // "Downloaded $i%" will receive here.
      }
    },
  );

  // Isolate.spawn() will create another isolate which will run parallel to main isolate. This starts a new isolate, passing main’s SendPort to foo, allowing foo to send messages back to main.
  Isolate.spawn(foo, receivePort.sendPort);

  // Create new isolate to execute soo() functionality, parallel to main isolate.
  // Isolate.spawn(soo, 10);

  // we put delay here so we can see the isolate communication on terminal.
  await Future.delayed(const Duration(seconds: 10));
}

// Think of ReceivePort as a stream → it receives. Think of SendPort as a sink → it sends. But sendPort.send() is not like adding to a stream’s sink, it's direct messaging to another isolate via port.
// foo() has a parameter of sendPort so that who ever will call this function, he has to send the sendPort message to this new Isolate.
void foo(SendPort sendPort) async {
  // ReceivePort(Specialize stream) object is made to receive messages from main isolate.
  ReceivePort receivePort = ReceivePort();
  // Here we listen receivePort as stream. When ever message come from main isolate it will listen and print it. "Hi Foo ! I am Main." will receive here as message.
  receivePort.listen((message) => print('Hellow : $message'));
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
Now we discuss main() and foo() functions step by step:
When the main function starts, the main isolate (main thread) begins executing. Inside main, a ReceivePort object is created. This ReceivePort allows the main isolate to receive messages from another isolate. Then, receivePort.listen(...) is called, which means the main isolate is now listening for incoming messages. 
Any message sent to this port will be handled inside the listen callback. Inside this callback, if the received message is a SendPort, it means the other isolate (foo) has sent us its own SendPort, allowing us to send messages back to it. In that case, the main isolate replies to foo by sending "Hi Foo! I am Main.".
If the message is not a SendPort, it’s treated as a normal message, and we simply print it. Next, Isolate.spawn(foo, receivePort.sendPort) is called. This creates a new isolate, which starts running the foo function in parallel to the main isolate. The sendPort passed to foo is actually the SendPort of the main isolate’s ReceivePort. This allows foo to send messages back to the main isolate. 
Now, in the foo function, another ReceivePort is created, which allows foo to receive messages from the main isolate. A listener is attached to this port, so any message sent from the main isolate to foo will be printed by foo. Then, foo sends its own SendPort (i.e., receivePort.sendPort) to the main isolate using sendPort.send(receivePort.sendPort).
This is a crucial step: without sending this port, the main isolate would not be able to send messages to foo. After this, in a loop, foo simulates progress updates using await Future.delayed(...) and sends messages like 'Downloaded 1%', 'Downloaded 2%', etc., to the main isolate using sendPort.send(...). These progress messages are received and printed in the main isolate’s listener.
*/

// This is dummy function just to execute in another isolate.
void soo(int max) async {
  for (var i = 1; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    print('$i');
  }
}