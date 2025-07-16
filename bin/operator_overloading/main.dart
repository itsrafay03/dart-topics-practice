import 'clock.dart';
// This file is having main function to execute objects of Clock class.

void main(List<String> args) {
  Clock clock1 = Clock(hours: 2, minutes: 4, seconds: 6);
  Clock clock2 = Clock(hours: 1, minutes: 5, seconds: 7);
  // Before defining '+' operator in Clock class we got error in bleow statement because '+'operator is not defined for oue class.
  // It donn't know how to ADD  or perforem which functionality for the objects of Clock class.
  // Clock clock3 = clock1 + clock2;

  // Now after defining '+' operator in class we can write and execute above statement without error because now we have '+' operator defined in Clock class with it's functionality.
  // Now here compiler will check again that if we have '+' operator defined in Clcok class, if yes then okay execute the functionality according to that + function in class, if + not exist in class then error.
  Clock clock3 = clock1 + clock2;
  print(clock3);
  // Hours, Minutes, Seconds of clock3 are sum of hours, minutes, and seconds of clock1 and clock2.

  // We say that operator is a instance specialize function in Dart.
  // As plus function is called for clcok1 and we pass clock2 in parameter. Similarly above we saw that + is called for clock1 and clock2 is passed as parameter.
  Clock c = clock1.plus(clock2);
  print(c);
  // So the same work is done above for clock3. It is just syntaxtical sugar.

  // Operator Overloading of relational operator '=='.
  // As relational operator also exist in Object class so first we use that one for Clock objects.
  Object o1 = Clock();
  Object o2 = Clock();
  var o3 = (o1 == o2);
  print(o3);  // true
  // Here it gives true answer because basically relational operator '==' check the content of two objects. If their content is same to same then gives answer true. 
  // As here we call simple Clock constructor without giving parameters value so by default values will be 0 and both objects will have same 0 values for all fields so == give true answer.

  // Below we use relational operator '==' but this time it is the one defined in Clock class. So it execute it's functionality and compare two Clock objects and give false answer because fields values are not same. 
  var c1 = (clock1 == clock2);
  print(c1);  // false  
  
}
