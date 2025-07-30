// This file is to understand more concepts about streams from ChatGPT.
// What we do here is that we make 2 async generative function and 1 async function below main function. Then in main function from print('Start'); to print('Finish'); we call different sync, asyc functions and listen the streams.
// When async function is called it takes delay to return a value so meanwhile other functions next to this async function are called and they start their execution. All Sync functions will complete their execution instantly without any delay and Async functions complete their executions and return value as thier delay finish.
// So this behaviour I want to see in stream. That we know stram is a async collection means they will retuen value of collection one by one after delay. So I want to see during this delay other sync, async functions and other stream.listener start executing during the delay od stream listner or they wait untill stream is completely listened.
// So I call multiple types of sync, async functions and listen multiple streams and came to know that as stream is async collection so during the delay other function start executing just like happened in async function call. Sync function instantly complete their execution, then async function complete their execution and return value after their delay ends. And meanwhile stream listner also -
// contineously listening the stream values after their respective delay. eans all the execution occur side by side parallel. Delay in async function and stream do not cause delay in execution of function in main function.
// After print('Finish'); statement there is another concept discussed.

void main(List<String> args) async {
  // sync function.
  print('Start');

  // Async function.
  foo().then(
    (value) => print(value),
  );

  // stream listner.
  generateNum(10).listen(
    (event) => print(event),
  );

  // sync function.
  print('Middle');

  // stream listner.
  generateDouble(10).listen(
    (event) => print(event),
  );

  // Async function.
  koo();

  // sync function.
  print('Finish');

  // Now as we know if we use await keyword with async function call in main function then that async function will execute like sync function. Means it will block all the next functions executions of main function till the execution of this async function get compete and value is returned.
  // So if we want to achieve this behaviour in stream that all the next functions execution blocked till all the stream get listen. So for this we use 'await for'
  // Using await for is another way to listen to a stream, but it awaits each event/value in order, so it behaves more like a blocking stream listener. It waits for the stream to emit all values, one by one, before moving on to other code in main(). It is like awaiting a Future, but for multiple async values (stream events).
  // Like await, await for is also use in async function. So now we have to make main function async.


  // => Another way to listen stream without stream.listen(), but it will first listen complete stream and then execute any other function of main function.
  await for (var element in generateNum(7)) {
    print("Stream value: $element");
  }

  // Async function.
  foo().then(
    (value) => print(value),
  );

  // sync function.
  print("Sync Function.");

  // So when above code run, first stream is listen completely and after that async function foo() is listen but it has delay so meanwhile sync function of print() execute and then when delay of async function complete it return it's value.


  // => Another important point is how to do Error Handling of Stream. So for that we will also use try-catch block.
  try {
    // So called Sync execution of Stream:
    // Listen a stream in this way if writing in try block because it will wait for each value spearetely and when error occur at specific element then it catch it easily.
    await for (var value in generateStream(7)) {
      print(value);
    }

    // So called Async execution of Stream:
    // generateStream(7).listen((event) => print(event));
    // We cannot use stream.listen(...) directly in try-catch block because it will not be able to catch exception. You need to pass an onError callback to the listen() method.
    // generateNum(7).listen((event) => print(event),
    //     onError: (e) => print('Caught stream error: $e'));
  } catch (e) {
    print('Exception catch: $e');
  }

  // So now when main function run and this try block execute so stream start listening from generateStream() async generative function.
  // But at value 3 the generateStream() function throw error means there is error in stream, which will be caught by catch block.


  // => Now here we call a single function which will start generateing Stream and when stream is completed, this function will return that complete Stream of int in a List.
  completeNumStream();
  print('Complete Stream');
  // Above function will execute Asynchronously as it will not block the execution of other functions in main function. When there is delay in generating complete stream other functions of main will execute.
  
  // But if we want that first complete stream has to generate and untill it is returned no other function of main function can execute. Means we want to block other functions untill complete stream is returned.
  // So it is sync behaviour of async function so we use 'await' keyword here before the function call. 
  var aa = await completeNumStream();
  print("List: $aa");
}

// Async generative function of stream of int.
Stream<int> generateNum(int max) async* {
  for (var i = 1; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

// Async generative function of stream of double.
Stream<double> generateDouble(int max) async* {
  for (var i = 0.5; i < max; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

// Async function which will return string after 5s of delay. So in main use .then to get the value retured from this function after delay.
Future<String> foo() {
  return Future.delayed(
    const Duration(seconds: 5),
    () => "Happy Birthday to you.\u{1F600}",
  );
}

// Async function which will return nothing after 3s of delay, it will just print a statement of reunes.
// As this function is not returning any value but print a statement after 3s delay so no need to use .then with it's call in main function because no value is returned form this function.
// Just simplly call this function in main function and after the completion of it' delay of 3s ths closure execute and statement will print on terminal.
Future<void> koo() {
  return Future.delayed(
    const Duration(seconds: 3),
    () {
      print('\u2760, \u2761, \u2762, \u2763, \u2764, \u2765, \u2766, \u2767');
    },
  );
}

// Async generative function for Error Handling in Stream. This function throw error at specific value so that I want to test that this exception will catch in try-catch block in main function.
Stream<int> generateStream(int max) async* {
  for (var i = 0; i < max; i++) {
    await Future.delayed(const Duration(seconds: 1));

    // throw error explicitely when this condition is true.
    if (i == 3) {
      throw Exception('An Error occured at i = 3');
    }

    yield i;
  }
}

// This is a async function which will listen generateNum() Stream and await till complete stream is listened and added each of it's element in list. Then in the end this function return that list which has all elements of generateNum stream.
Future<List<int>> completeNumStream() async{
  // take list of int.
  List<int> list = [];

  // we use await-for so the elements keep adding in list until they are finished.
  // And during this execution no other statement of this function will execute as they are blocked due to await-for with stream. 
  await for (var element in generateNum(10)) {
    list.add(element);
  }

  print("The list is: $list");
  return list;
}
