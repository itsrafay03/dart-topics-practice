void main(List<String> args) {
  List list1 = [];
  print(list1.runtimeType); // List<dynamic> as not type specified for list.

  List list2 = [1, 2, 3, 4];
  print(
    list2.runtimeType,
  ); // List<dynamic> as not type specified for list regardless of it's values.
  print(list2);

  List<int> list3 = [5, 6, 7, 8];
  print(list3.runtimeType); // Now it will give List<int>

  List<num> list4 = [];
  List<String> list5 = ["Ali", "Waqas", 'Usman'];

  // Type inference of list as we do not define the D.T of the variable.
  var list6 = [0.12, 0.99, 33, 809];
  print(
    list6.runtimeType,
  ); // It will show List<num> as due to type inference the type of variable depend upon the actual value.
  var list7 = [];    
  print(list7.runtimeType); // Now show List<dynamics> as actaual list is empty.

  // Spread Operator.
  var list8 = [...list2];
  print(list8);        
  print(
    list8.runtimeType,
  ); // List<dynamic> as list8 will be of same D.T as list2 object and list2 is List<dynamic>.

  var list9 = [...list3];
  print(list9);
  print(
    list9.runtimeType,
  ); // List<dynamic> as list9 will be of same D.T as list3 object and list3 is List<dynamic>.

  var list10 = [list2, ...list3];
  print(list10);
  print(
    list10.runtimeType,
  ); // List<Object> as list9 is constructed with two differet type of objects of List. 
} 
