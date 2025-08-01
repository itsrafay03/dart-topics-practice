// This file is to learn more about Stream. This si the 2nd lecture of stream delivered by Sir Noman Ameer khan.
// In this file we learn how to generate and interact with stream.

// main functions.
import 'dart:async';

void main(List<String> args) async {
  // This is a proper way to read a stream by using .listen() method. In previous file we read stream by this proper way.
  // generateNumbers(10).listen(
  //   (event) => print(event),
  // );

  // This is a short-cut of to read stream by using 'await for in loop'. As we are going to use await keyword in main sync function so we have to make main function a async function by putting async keyword after it's header.
  // like to read simple sync collection we use for eeach loop. So now we have async collection so use await for in loop to read it.
  // It will work same as for each loop that one by one elements will yield from async generative function(generateNums()) of stream and each element will flow in this for each loop and every time it assign 'element' variable with current value from stream and
  // in function body we can print the value received from stream. And then await again start waiting for next value from stream and when value come, again above process repeat.
  // In this way we donot need to make any varible for stream and streamsubscription, just we listen our stream in await for in loop, in a short-cut way.
  // But keep in mind as we discuss in previous file that by using await here in main function now this stream will listen like a sync function means untill complete stream is listened no other function of main function will execute, because await block all other execution of funtions.
  // await for (var element in generateNumbers(10)) {
  //   print(element);
  // }

  // Calling a Non-generative Sync function.
  var list = createList(7);
  print(list);

  // Here we call the sync generative functions. And we can see that there is no delay, as sson as function is called whole stream is ready and we get the Iterable.
  var syncStream = genNums(7);
  print(syncStream);
  // // As getNums() is sync generative function so it is returning Iterable which has access of all the methods of Iterable(collection).
  // var a = syncStream.firstWhere(
  //   (element) => element <= 1,
  // );
  // print(a);
  // var b = syncStream.fold(
  //   0,
  //   (previousValue, element) => previousValue + element,
  // );
  // print(b);
  // print(syncStream.toSet());

  // Call of proper way to generate stream. Also we use proper way to read stream, as below.
  // var properStream = genNumbers(10).listen(
  //   (event) => print(event),
  // );

  // var stringStream = genString(5).listen(
  //   (event) => print(event),
  // );

  // This is another concept that when we simplly call function which has to generate stream then it gives us stream<> as it is it's RDT. But actually that function will execute when we listen that stream, either by '.listen()' or by 'await for in loop'.
  var ss = genNumbers(4);
}

// This is a short-cut of to generate stream. In previous file we generate stream by this short-cu way.
Stream<int> generateNumbers(int max) async* {
  for (var i = 0; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

// Sync Generative Function. There are 2 types of Generative Functions as async generative function and sync generative function.
// Unlike Async generative functions, Sync generative function generate Iterable not a stream, Sync generative functions use Iterable(Parent class  of all collections) class in RDT, use sync* to tell that it is a sync generative functions.
// Actually Iterable is a sequence on which we can iterate. In below function that sequence is made by for loop by providing the int values on each iteration.
// This is a synchronous generator function. When called, it returns an Iterable. The for loop yields values one by one and sink them in iterable(sequence), and since there is no delay or async behavior, the whole iterable is available immediately.
Iterable<int> genNums(int max) sync* {
  for (var i = 0; i < max; i++) {
    yield i;
  }
}

// Simple Non-generative Sync function.
Iterable<int> createList(int max) {
  List<int> list = [];
  for (var i = 0; i < max; i++) {
    list.add(i);
  }
  return list;
}
// The difference between above 2 functions are that genNums() is a sync generative function which yield the values one by one in Iterable. It has no object of collection.
// And the createList() is a sync non-generative function which return a complete object of List(child of Iterable). It has a object of collection.


// Below we have a proper way to generate stream. Although it is generating stream but it is a non-generative function because there is no async* or sync* keyword in this function's header.
// Here we will use StreamController object which is use to control the stream. StreamController is a template type and it's template depend upon our stream value's type.
// StreamController has 2 important properties:   
// streamController.sink: Here sink.add() will flow one by one values to stream and it is like 'yield'. Sink is of StreamSink type so we can make variable for it or use it anonymously.
// streamController.stream: It will return a complete stream, you cam say it is an output of stream.
Stream<int> genNumbers(int max) {
  StreamController<int> streamController = StreamController<int>();
  // StreamSink<int> streamSink = streamController.sink;
  for (var i = 1; i <= max; i++) {
    // streamSink.add(i);
    streamController.sink.add(i);
  }
  // streamController.stream gives access to the stream object, which delivers values added via sink. The values are sent over time, and you can listen to them as they arrive. The 'return' will return a stream object.
  // We are not using yield in place of return because now it is not a generative stream, and now we have complete controll on the object of stream, that when we have to sink values or read values from stream, and we are controlling all this manually.
  return streamController.stream;
}

// Another stream function made in a proper way. In this we use streamController.close();
Stream<String> genString(int max) {
  StreamController<String> streamController = StreamController<String>();
  for (var i = 1; i <= max; i++) {
    streamController.sink.add('The num is $i');
  }
  // We can use   streamController.close(); before returning the stream. close() means “No more values will come t the stream. Stream is finished.”. So we should close() stream when all the values are added to stream.
  // Even if some value has to add in stream after delay and we call close() then taht value will not be added to stream because stream is closed before this value come. 
  streamController.close();
  return streamController.stream;
}
