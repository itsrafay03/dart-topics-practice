// There are 3 Decleration Types in Dart.
// The var and dynamic variable can be declare without initilizing their value as they do not any specific D.T so that's why.

var inp;
dynamic ssssss;

void main(List<String> arguments) {
  // Strict/Static Typing.
  num num1 = 2.34;
  String word = 'UFC';
  bool isTrue = true;

  // Type Inference(using 'var').
  var ss;
  print(ss.runtimeType); // Null as nothing initilize to variable ss.
  var num2 = 23;      
  print(num2.runtimeType); // prints int.
  // num2 = 3.415;    // Compile time error as first int value initilize to num2 so it's datatype is now fixed as int
  // we cann't assign any other D.T value to num2.
  num2 = 999;
  print(num2);   // prints 999

  // var also used when the class name is too long to write or rembember.
  SliverChildrenListuilderDeligate sliverChildrenListuilderDeligate = SliverChildrenListuilderDeligate();
  // instead of above write this.
  var refrence = SliverChildrenListuilderDeligate();

  // Dynamic Typing(using 'dynamic').
  dynamic sss;
  print(sss.runtimeType); // Null as nothing initilize to variable sss.
  dynamic value = "WWE";
  print(value.runtimeType); // D.T is String.
  value = true;
  print(value.runtimeType); // Now D.T of same variable is bool.

  // Special case of type inference.
  var input;
  input = 17;
  print(input.runtimeType);  // Print int
  input = 45.555;
  print(input.runtimeType);  // Print double
  input = false;
  print(input.runtimeType);  // Print bool
  input = "All is well";
  print(input.runtimeType);  // Print String


  foo([2, 5, 2, 10, 6, 2,11, 10, 8, 2, 10]);
}

void foo(List list) {
  int max = list[0];
  int count = 0;
  for (var i = 0; i <= (list.length - 1); i++) {
    if (list[i] > max) {
      max = list[i];
      count = 0;
    }
    if (max == list[i]) {
      count++;
    }
  }
  print("Max number is $max and it's count is $count");
}


class SliverChildrenListuilderDeligate {}