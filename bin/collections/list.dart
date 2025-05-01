List<int>? nullList;

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

  List boolean = <bool>[true, false, false, true];
  List aa = <int>[1, 4, 6, 7];
  print("Type : ${aa.runtimeType}"); // prints List<int>

  // Type inference of list as we do not define the D.T of the variable.
  var list6 = [0.12, 0.99, 33, 809];
  print(
    list6.runtimeType,
  ); // It will show List<num> as due to type inference the type of variable depend upon the actual value.
  var list7 = [];
  print(list7.runtimeType); // Now show List<dynamics> as actaual list is empty.
  list7 = [3, 5, 6]; // Even if list7 is now initilized but still it is List<dynamics>. As first value assign to it is dynamic.
  print(list7.runtimeType);

  // Spread Operator.
  var list8 = [...list2];
  print(list8);
  print(
    list8.runtimeType,
  ); // List<dynamic> as list8 will be of same D.T as list2 object and list2 is List<dynamic>.

  var list9 = [22, 33, ...list3];
  print(list9);
  print(list9.runtimeType); // List<int> as list9 will be of same D.T as list3 object and list3 is List<int>.

  print('----------------------------');
  var list10 = [list9, list4, list3];
  print(list10);
  print(list10.runtimeType);  // List<List<num>> as it is 2-D list [[],[]]
  var list11 = [list9, list4, ...list3];
  print(list11);
  print(list11.runtimeType);  // List<Object> as list9 is constructed with two differet type of objects like intigers and list.
  var list12 = [list9, ...list4, ...list3];
  print(list12);
  print(list12.runtimeType);
  var list13 = [...list9, ...list4, ...list3];
  print(list13);
  print(list13.runtimeType); // List<num> as all list use spread operator so only their elements will be include in this list13, and they all are int.

  // Nullable/Nullsafe Spread Operator.
  // var list14 = [list2,...nullList!];  // It will be a runtime error as nullList is actually null.
  var list14 = [list2, ...?nullList];

  
}
