import 'dart:async';
// This file is made to solve the 11 questions from ChatGPT which cover all the topics of this async programming.

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
  Future(() async {
    Set<String> set = {'one', 'two', 'three'};
    for (var i = 0; i <= 2; i++) {
      await Future.delayed(const Duration(seconds: 1));
      streamController.sink.add(set.elementAt(i));
    }
    streamController.close();
  });
  return streamController.stream;
}

// Q4: Compare behavior of sync vs async functions. Create two functions: Sync function that returns a list of 3 numbers. Async function that returns same numbers with 1-second delay each using a Future. Print the output of both in main.
List<num> syncFun() {
  return [1, 2, 3];
}

Future<List<int>> asyncFun() {
  return Future.delayed(
    const Duration(seconds: 1),
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

// Q8: Demonstrate single subscription vs broadcast stream. Create a stream using StreamController and convert it to broadcast. Attach two listeners to print values.
// As we are using StreamController so we can use asBroadcastStream() in the function, instead of main.(optional)
Stream<int> numberStream() {
  StreamController<int> streamController = StreamController<int>();
  for (var i = 1; i <= 3; i++) {
    streamController.sink.add(i);
  }
  return streamController.stream;
}

// Q9: Create a function that returns a stream of square numbers (1, 4, 9...) up to a given max number using StreamController. In main(): Print each value.
Stream<num> squareStream(int max) async* {
  for (var i = 1; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i * i;
  }
}

// Q10: Write a function that returns an Iterable (list) using sync*. Yield numbers from 0 to 4.
Iterable<int> createList() sync* {
  for (var i = 0; i <= 4; i++) {
    yield i;
  }
}

// Q11: Write an extension function on Stream<int> to calculate and return the average of all numbers in the stream. In main(): Use this extension on a number stream and print average.
extension MyStream on Stream<num> {
  Future<num> averageOfStream() async {
    num sum = 0, count = 0;
    await forEach(
      (element) {
        sum += element;
        count++;
      },
    );
    print(sum);
    return sum / count;
  }
}

Stream<num> numsStream(int max) async* {
  for (var i = 1; i <= max; i++) {
    yield i;
  }
}

// main function.
void main(List<String> args) async {
  // Question1:
  var q1 = await sum(2, 6);
  print("Answer of sum is $q1");

  // Question2:
  numStream().listen((event) => print(event));

  // Question3:
  stringStream().listen((event) => print(event));

  // Question4:
  syncFun();
  print(await asyncFun());

  // Question5:
  try {
    var result = await asyncError(dedidend: 20, divisor: 0);
   print(result);
  } catch (e) {
    print("Exception Message is $e");
  }

  // Question6:
  try {
    await for (var element in streamError()) {
      print(element);
    }
  } catch (e) {
    print("Error message: $e");
  }

  // Question7:
  // Here we need to access the methods of StreamSubscription class so don't listen stream anonymously, we make variable and assign stream.listen() to it.
  late StreamSubscription streamSubscription;
  int counter = 0;
  streamSubscription = createStream().listen(
    (event) {
      print(event);
      counter++;
      if (counter == 2) {
        print("Pausing stream...");
        streamSubscription.pause();
        Future.delayed(
          const Duration(seconds: 3),
          () {
            print('Resuming stream....');
            streamSubscription.resume();
          },
        );
      }
    },
  );

  // Question8:
  var stream = numberStream();
  stream.listen((event) => print("Listener1: $event"));
  stream.listen((event) => print("Listener2: $event"));

  // Question9:
  squareStream(5).listen(
    (event) => print(event),
  );

  // Question10:
  var list = createList();
  print(list.toList());

  // Question11:
  var average = await numsStream(9).averageOfStream();
  print("Average: $average");
  
}
