import 'dart:async';
// This file is made to solve the 12 questions from ChatGPT which cover all the topics of this async programming.

// Q1: Create an async function that fetches two numbers with a delay of 2 seconds, adds them, and returns the result.
Future<num> sum(num no1, num no2) {
  return Future.delayed(
    const Duration(seconds: 2),
    () => no1 + no2,
  );
}

// Q2: Create a stream of 5 numbers using async* with 1-second delay between each value.
Stream<num> numStream() async* {
  for (var i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

// Q3: Create a stream with StreamController and add strings "one", "two", "three" with delay.
Stream<String> stringStream() {
  StreamController<String> streamController = StreamController<String>();
  Set<String> set = {'one', 'two', 'three'};
  for (var i = 0; i <= 2; i++) {
    streamController.sink.add(set.elementAt(i));
  }
  streamController.close();
  return streamController.stream;
}

// Q4: Compare behavior of sync vs async functions. Create two functions: Sync function that returns a list of 3 numbers. Async function that returns same numbers with 1-second delay each using a Future. Print the output of both in main.
List<num> syncFun() {
  return [1, 2, 3];
}

Future<List<int>> asyncFun() {
  return Future.sync(
    () => [1, 2, 3],
  );
}

// Q5: Create a function that divides two numbers. If divisor is 0, throw an exception. In main(): Use try-catch to handle the error when you call it with 0 divisor.
Future<num> asyncError({required num dedidend, required num divisor}) {
  if (divisor == 0) {
    throw Exception('Divisor must be greater then 0.');
  }
  return Future.delayed(
    const Duration(seconds: 2),
    () => dedidend / divisor,
  );
}

// Q6: Create a stream with error and handle it. Use async* to yield 1, 2, then throw an error, then try to yield 3. In main(): Use try-catch with await for to catch the error and print a message.
Stream<num> streamError() async* {
  for (var i = 1; i <= 3; i++) {
    if (i == 3) {
      throw Exception("Error at index 3");
    }
    yield i;
  }
}

// Q7: Demonstrate pause and resume in StreamSubscription. Create a stream of 5 numbers with delay. In main(), use .listen() and Pause after 2 numbers. Wait 3 seconds. Resume and print remaining numbers.
Stream<int> createStream() async* {
  for (var i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

// Q8: Demonstrate single subscription vs broadcast stream. Create a stream using StreamController and convert it to broadcast. Add 3 values. Attach two listeners to print values.
Stream<int> numberStream(){
  StreamController<int> streamController = StreamController<int>();
  for (var i = 1; i <= 3; i++) {
    streamController.sink.add(i);
  }
  return streamController.stream;
}

// Q9:
// Q10:
// Q11:
// Q12:

// main function.
void main(List<String> args) async {
  // // Question1:
  // var q1 = await sum(2, 6);
  // print("Answer of sum is $q1");

  // // Question2:
  // numStream().listen((event) => print(event));

  // Question3:
  stringStream().listen((event) => print(event));

  // // Question4:
  // syncFun();
  // asyncFun().then(
  //   (value) => print(value),
  // );

  // // Question5:
  // try {
  //   asyncError(dedidend: 20, divisor: 0).then(
  //     (value) => print('Answer is: $value'),
  //   );
  // } catch (e) {
  //   print("Exception Message is $e");
  // }

  // // Question6:
  // try {
  //   await for (var element in streamError()) {
  //     print(element);
  //   }
  // } catch (e) {
  //   print("Error message: $e");
  // }

  // Question7:
  // Here we need to access the methods of StreamSubscription class so don't listen stream anonymously, we make variable and assign stream.listen() to it.
  // int a;
  // StreamSubscription streamSubscription = createStream().listen(
  //   (event) => a = event,
  // );
  
  // if () {
    
  // }
  // streamSubscription.pause();
  // Future.delayed(const Duration(seconds: 3));
  // streamSubscription.resume();

  // Question8:
  Stream stream = numberStream().asBroadcastStream();
  stream.listen((event){
    
  });
  stream.listen((event) => print(event));



  // Question9:
  // Question10:
  // Question11:
  // Question12:
}
