// This file is to understand the concept of Stream in Dart.
// Stream gives us multiple Future values after specific delay. Stream is an Async collection. Because in sync collection we get complete collection(List) at a time but in async collection we get the values of collection(List) one by one after specific delay.
// main function
import 'dart:async';
import 'dart:math';

void main(List<String> args) async {
  // generateNumbers() is returning Stream so in stream1 variable we get Stream of int.
  Stream<int> stream1 = generateNumbers(7);
  print(stream1);
  // Above the generateNumbers() call start generating stream but we are not able to see the stream. So first we have to subscribe the stream by StreamSubscription and then we are able to see the value of stream.
  // StreamSubscription just subscribe the stream so that when ever a new value come to stream sp we can see this like happen in youtube videos.
  // There are 2 types of streams subscription. First is single subscription stream in which there is only one listener os stream. By default stream is single subscription.
  StreamSubscription subscription = stream1.listen(
    (event) => print(event),
  );
  // Methods of streamsubscription that are helpful in async behaviour of stream.
  // Stream is still generating from generateNumbers() but we pause it in listen.
  // subscription.pause();
  // When we resume it then we again start listening stream.
  // subscription.resume();
  // We can also cancel this subscription for our respective stream.
  // subscription.cancel();

  // We can access the methods of collection form stream object because stream is also a async collection.
  // stream1.any((element) => element.isEven,);
  // stream1.first;
  // stream1.contains(needle);
  // stream1.every(test);
  // stream1.where(test);
  // stream1.forEach(action);
  // and many more.

  // Now above we keep the oject of Stream and StreamSubscription in variables but if we just want just to listen a stream, so we can do this anonymously. But if we want to apply stream or streamsubscription methods on stream then we use variable like above.
  // For anonymously we just call generatenumbers() function which generate the stream and with it call the listen() to listen the stream.
  generateNumbers(10).listen(
    (event) => print(event),
  );

  // Now if we want to listen our stream multiple times with same subscription then we will use asBroadcastStream subscription.
  // For that we will call asBroadcastStream() with generative function of our stream, as following.
  Stream<int> stream = generateNumbers(10).asBroadcastStream();
  // Now our stream is subscribed with asBroadcastStream and we can have multiple listner of our stream.
  stream.listen(
    (event) => print(event),
  );

  // List<int> list = [];
  // stream.listen(
  //   (event) => list.add(event),
  // );

  stream.listen(
    (event) => print(event % 2 == 0),
  );

  // We can make other streams form the main stream and also listen them from their respective listeners as following.
  // Below .map() is a method of the Iterable class .map() returns an Iterable. It is used to apply a function to each element in a collection and return a new iterable with the transformed elements. In short change the datatype of elements, or modify the elements of collection.
  var stringStream = stream.map(
    (event) => "This is the value $event",
  );
  // Here listen of main stream not called because we have made a new stream from main stream. Now here listen of stringstream is called as it has by default single subscription so only once it is listen.
  // Here we cannot call multiple listeners for stringStream because currently it has by-default single subscription. For that we need asroadcastStream subscription for stringStream.
  stringStream.listen(
    (event) => print(event),
  );
  // First we create a new stringstream which will take values from stream and and convert those int values to string in sentence form. Then the listener of stringstream will listen those value one by one and according to closure it will print them.
  // stream generate int one by one -> stringstream get those ints one by one and convert them to string one by one -> listener of stringstream prints that string comming from stringstream one by one.

  // Below we create another stream from main stream. This will read every int from stream and pass only even ints to evenstream. Then we called listener for evenStream anonymously with it.
  // Here we cannot call multiple listeners for evenStream because currently it has by-default single subscription.
  var evenStream = stream
      .where(
        (event) => event.isEven,
      )
      .listen(
        (event) => print(event),
      );

  // Although above each subStream(stringStream and evenStream) has their own stream subscription and listners. But they all are made from main stream so indirectly their listner is considered as a listener of main stream. So main stream should have asBroadcastStream subscription so that it have multiple listners.
} 

// This is an Async Generative Function which will generate Stream(async collection). Means here it will generate a collection of intigerts values but one by one after specific delay value will add to the collection.
// To make generative function we will put DT of value of collection in Stream template type. And use 'async*' keyword after function header so that to make this function Async Generative Function. Now this function will generate collection asynchronously.
Stream<int> generateNumbers(int max) async* {
  for (var i = 0; i < max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
// Future.delayed(const Duration(seconds: 1)); will add 1s dummy delay and await before it tells that wait for 1s before executing next.
// yield i will return the value of i one by one on each iteration on loop. Because return keyword return the complete value of function at once. But yield return the collection value one by one.

