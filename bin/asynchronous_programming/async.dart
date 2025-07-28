import 'dart:io';
// This file is made to understand the use of keywords(await, async) used in Async functions.

// main function
void main(List<String> args) async {
  // In previous file asynchronous.dart we call sum() function in which we call avg() function so it's readability is not good.
  // So dart allow us to call Async functions like a Sync functions. means we can call async function line by line like a synchronous functions.
  // That first sum() function is called due to delay it returns the value after 3s of delay, During this delay time no other function will execute because now functions are executing synchronously.
  // When the execution of sum function is complete then we call avg() function which will perform it's functionality and it will also return the value after delay.
  // We can make Async fuction a synu fuctio by using 'await' keyword. But the function in which we use await keyword that function shoulb be async function.
  // ecause if we use await keyword in sync function then what happen that outer sync function start executing and stop at await keyword because after that there is a call of other function.
  // But as outer function is sync function so it will not allow to call anyother function before the completion of it's execution. So the execution thread will remain stuck at await keyword in sync function.
  // That's why we always use await keyword in body of Async function. As we will use await keyword in main this function so we have to make this Async main function by adding async keyword in after header or make RDT of main function Future<RDT>, because main function is by default sync function.
  var add = sum(17, 24);
  print(add);
  // Above sum() is async function  which  returns a Future<num> immediately when called. As it's value will return in future after delay complete. As it is a async function so execution not stop and Future<int> assign to add variable. In Dart, any function that returns a Future is asynchronous. If you don’t use await, you’re just getting the Future immediately and not its resolved value.
  var s = await sum(20, 25);
  var a = await avg(s, 4);
  print('Sum: $s and Avg: $a');
  // Now above both function are although async but due to await keyword they will call and execute like sync functions and execute one by one. The delay is because there is delay mentioned in the body of these functions.
  // Here async function sum() and avg() become sync function so when sum() is called execution thread will wait till it's delay ends up and num value is returned. And then this value is assign to variable 's'. After this avg() is called and execute in same way.
  // Because for understanding just suppose await means wait. Like await sum() means although sum is aysnc function which will return it's num type value in future after delay time is completed. But due to await sum() become sync functtion and execution thread will wait till the delay of sum() finishs and it's value return by sum() function and that value will definately assign in s variable.

  // Now we can improve the code readability of async functions of File class also that we discuss in previous file.
  File file = File('C:\\Users\\itsra\\Documents\\rough textfile.txt');
  var bytes = await file.readAsBytes();
  print(bytes);
  var content = await file.readAsString();
  print(content);

  // This is called Async-await that first there is await of 3s for sum() function then 2s await for avg() function and then few milli seconds await for async functions of File class. 
  // So in short if async functions are calling and executing like sync functions so then use above mentioned way to improve the code readability of code.
  
  

}

Future<num> sum(num no1, num no2) {
  return Future.delayed(
    const Duration(seconds: 3),
    () => no1 + no2,
  );
}

Future<num> avg(num sumValue, int items) {
  return Future.delayed(
    const Duration(seconds: 2),
    () => sumValue / items,
  );
}
