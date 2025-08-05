// This file is made to understand the concept of isolates in Dart.
// Concurrency and Parallelism are discussed in this lecture.

import 'dart:isolate';

void main(List<String> args) async {
  // Now when we call foo() and soo() sequentially. As they are not simple async functions with little bit of delay, they both are long running operations with nested loop.
  // So when we call them they will not shift their execution, first foo will complete it's execution and then soo will complete it's execution.
  //   foo();
  //   soo();

  // Now we call sync functions so first zoo() will complete and then joo() will start it's execution.
  // zoo(100);
  // joo(100);

  // Here Isolate.spawn(functioIdentifier, parameter of zoo). So Isolate.spawn will create a new isolate apart from main isolate.
  Isolate.spawn(zoo, 100);
  Isolate.spawn(joo, 100);
  await Future.delayed(const Duration(seconds: 10));
}

// Async functions foo() and soo() are long running operations functions.
Future<void> foo() {
  for (var i = 0; i < 1000; i++) {
    for (var j = 0; j < 1000; j++) {
      print('Foo');
    }
  }
  return Future.value(null);
}

Future<void> soo() {
  for (var i = 0; i < 1000; i++) {
    for (var j = 0; j < 1000; j++) {
      print('Soo');
    }
  }
  return Future.value(null);
}

//  Sync functions zoo() and joo() for long running operations functions.
void zoo(int max) {
  for (var i = 0; i < max; i++) {
    for (var j = 0; j < max; j++) {
      print('Zoo');
    }
  }
}

void joo(int max) {
  for (var i = 0; i < max; i++) {
    for (var j = 0; j < max; j++) {
      print('Joo');
    }
  }
}
