// This file is to understand about Asynchronous programming in dart.

// main function.
void main(List<String> args) {
  // Uptil now we have done all the Synchronoue programming means every statement will execute in sequence that first statement or function will completely execute and then the second statement will start executing.
  // Like first foo() function will call and complete it's execution and after that soo() function start executing and complete it's execution. Just because they are synchronous functions.
  // call of synchoronous functions:
  foo();
  soo();

  // Now if we have Asynchronous functions then they can execute all at a time. If there is any delay in first function then in this time the second function will start it's execution and when the delay of first function finish it will complete it's execution.
  // So in this way functions do not wait for completing the execution of previous function. When ever they get chance (even during the execution of first function) they start their execution.
  // call of Async functions:
  // Now we can see that first koo() is called and then zoo() is called. So if they are Sync functions then first koo() execute and after it's 3 seconds delay it returns the value. Then after that zoo() will be called and after it's 2 seconds delay give it's output.
  // But as they are Async functions so when we call koo() it has 3 seconds of delay meanwhile this delay the compiler will move next and zoo function is called which has 2 seconds of delay.
  // As zoo() has a delay of 2 seconds so it will give it's output first as compare to koo() which has delay of 3 seconds. Means output of zoo() will show first because it has delay of 2 seconds and output of koo() will shown later because it has 1 second more delay then zoo().
  // Inshort when koo() is called it has a delay of 3s so in this time next function zoo() will call and show its output after 2s delay complete. And when 3s complete the koo() will also show it's result.
  koo(); // Here koo() is returning Future<int>, not simple int.
  zoo(); // Here RDT of zoo() is Future<void>, not simple void.

  // If we call these functions in below sequence then first compiler see that foo() is sync function so as soon it call the output will shown on terminal. Then compiler work sequentially and call koo() function but it is an async function and it has a delay of 3s so it's output will be shown after delay of 3 seconds.
  // Meanwhile during this delay compiler will check the next function which is soo(). This is a sync function so as soon it is called it's output is shown on terminal. Still there is delay in output of 2nd function koo() so meanwhile compiler call the next funtion zoo(). It is a is 4th function.
  // This function is async so it's output will be shown after 2s of delay. Still there is a delay in output of 2nd function koo() so compiler will call last function foo(). This is again a sync function so it will instantly show it's output on terminal. Now output of 1st, 2nd and 3rd functions are shown on terminal instantly when code is executed, as they are sync functions.
  // When 2s of delay complete the 4th function zoo()'s output is shown and when 3s complete the output of 2nd function koo()'s is shown on terminal.
  foo();
  koo();
  soo();
  zoo();
  foo();

  // Other important insights about Async functions.
  print(koo().runtimeType);
  print(koo.runtimeType);
  var aFun = koo();
  print(aFun.runtimeType); // same which is RDT of koo() function.

  // Functions of Future class.
  // then() is one of the important Future class function. then() is called when the future of respective async function is complete with value.
  // Actually then register an event in an event queue that when Future is completed with value call this registered function with the value.
  // That event is the closure we give in the then(). 'value' is the value that the Future async function has to return in future.
  // Below 345 will come in the place of value, after 3 seconds of delay from koo().
  aFun.then(
    (value) => print('The value returned from koo() is $value'),
  );

  // Here then() is called anonymously with Async function zoo(). So this is another way to use then() for the Future. As we not need to store Future<> in a variable and from it call the then() function. 
  // So we have to just call then() with the call of Async function, so anonymous approch, without name of Future as variable, is batter then previous one.
  zoo().then(
    (value) => print("The value of zoo() is already displayed."),
  );
  

  // These two functions are called when the future of respective async function is complete with error.
  // aFun.onError(handleError);
  // aFun.catchError((e) {
  //   print(e);
  // });
  // But now these functions are not used for exception handeling. Now we have to use try-catch block instead of these functions.
  // The async function which is expected to be completed with error in future, should be call in try block and handle it's exception (that will occur if in future that async function complete with error) in catch block.
  // Suppose zoo() is async function which can be completed with error in the future. So we call it in try block and cahtch it's exception in catch block.
  try {
    var result = zoo();
    print('Result is $result');
  } catch (e) {
    print('Catch an error $e');
  }

  // whenComplete() is called in both cases either future of Async function complete with value or with error, in the end this whenComplete() must called.
  // Basically it is to check that the future of Async is completed or not. If it is completed either in any case this whenComplete() has to run.
  // It is also taking a closure in it.
  aFun.whenComplete(
    () {
      print('Future is completed.');
    },
  );
}

// foo() and soo() are both synchronous or sync functions.
void foo() {
  print('Foo function');
}

void soo() {
  print('Soo function');
}

// koo() and zoo() are both synchronous or sync functions.
// To make a simple sync function as Async function just you have to give the RDT of function in the template type of the Future class.
// The Future class is Dart's builtin class because as we can see we don't need to import it from any external package.
// Then in the body of function we call the Future.dalayed() which is the named constructor of Future class and in it the first parameter is duration.
// The duration is mandatory to give because it is async function which has a delay so to give delay explicitely we give it by ourself. So we call the constructor of Duration.
// The second parameter of Future.delayed is closure(Closure is a anonymous function that can access and use variables from its outer scope) to return the value according to RDT. So here we pass dummy function'() => RDT value' which return the specific value.
// Actually when we call below aysnc function koo() so after a delay of 3s this closure is called. As this closure is returning 345 so means koo() function is returning 345 in future after delay of 3s. 
// So now when async function is called first it will take delay of given seconds and then call closure which return the specific value. The value is actually a retured value of an async function.
Future<int> koo() {
  // Here in this function there is no natural delay so we need to give the delay by our own explicitely so that's why we call Future.delayed() and give the delay duration in it, and then return value from closure.
  // If there is a natural delay in this function then we not need to give this extra artifical delay. Then we just simply return value from function because delay is already present in function and after that delay finished, the function will return value. 
  return Future.delayed(
    Duration(seconds: 3),
    () => 345,
  );
}

Future<void> zoo() {
  return Future.delayed(
    const Duration(seconds: 2),
    () {
      print('Zoo function');
    },
  );
}
