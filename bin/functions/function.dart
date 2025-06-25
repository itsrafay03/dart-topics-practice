// public global function.
num sum(num no1, num no2) {
  return no1 + no2;
}

// In dart to make member private we use underscore '_' before it's name and this underscore become the part of that member's name.
// Private member scope is package private means within same file.
// private global function.
num _add(num no1, num no2) {
  return no1 + no2;
}

int publicNum = 9; // Public global datamember.
int _privateNum = 10; // Private global datamember.

// Types of Functions on basis of their Parameters.
// Mandatroy Parameters.
num subtract(num no1, num no2) {
  return no1 - no2;
}

// Optional Positional Parameters.
// All optional positional parameters.
void firstFunction([int? a, int? b, int? c]) {
  print(a! + b!); // if there are actual parameters for a and b.
  print(b);
  print(c);
}

// One mandatory and one optional positional parameters.
void secondFunction(int a, [int? b]) {
  // Collecing operator is used here as if b has value then it will be used otherwise 1 will be used. SO we do not need to use ! as it give exception if b is not initilized.
  print(a + (b ?? 1));
}

// In Dart we cannot have a mandatory positional parameter (int c) after optional positional parameters ([int? a, int? b]).
// It's viceversa is possible as above. 
// void thirdFunction([int? a, int? b], int c){};

// One mandatory parameter and other 2 are optonal positional parameters.
void fourthFunction(int a, [int? b, int? c]){
  print(a);
  print(b);
  print(c);
}

// Default Optional Positional Parameter
// This function has one mandatory, 2 default optional positional, and one optional positional parameters. 
void fifthFunction(int a, [int b = 7, int c = 10, int? d]){
  print(a);
  print(b+c);
  print(d ?? 00);
}

// Optional Named Parameter. It is not Positional(We can give value of any parameter before or after).
// We have to give values of parameters in function call with their parameter's name.  
void sixthFunction({int? a , int? b}){
  print(a);
  print(b);
}

// void function.
void main(List<String> args) {
  print("sum: ${sum(10, 20)}");
  print("_add: ${_add(publicNum, _privateNum)}");
  print('subtract: ${subtract(20, 7)}');

  // No error as we have given values of all optional parameters so in function body (a! + b!) will properly execute.
  firstFunction(1, 1, 1);
  // Values of only first two optional positional parameters are given.
  firstFunction(2, 2);
  // Runtime exception as we have not given values for optional parameters and in function body (a! + b!) 'tasali will be jhoti' so give exception.
  // firstFunction();

  // Only give value of mandatory parameter. Value of optional positional parameter is not given.
  secondFunction(99);
  
  // Value of mandatory parameter is given. Value of first optional positional parameter is given only.
  fourthFunction(7, 7);

  // Only mandatory parameter value is given for this function.
  fifthFunction(11); 
  // Now mandatory parameter and 2 default optional parameters values are given for this function.
  fifthFunction(11, 12, 13);  
  
  //
  // As there are optional named parameters so we have to give values of parameters in function call with their parameter's name to specifiy which parameter value it is.  
  sixthFunction();
  sixthFunction(a: 0);
  sixthFunction(b: 1);
  sixthFunction(a: 1, b: 2);
  sixthFunction(b: 3, a: 4);
}
