// A List in Dart is an ordered and indexed collection of items, similar to an array in other languages. Allow duplicate elements.

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
  list7 = [
    3,
    5,
    6,
  ]; // Even if list7 is now initilized but still it is List<dynamics>. As first value assign to it is dynamic.
  print(list7.runtimeType);

  // Spread Operator.
  var list8 = [...list2];
  print(list8);
  print(
    list8.runtimeType,
  ); // List<dynamic> as list8 will be of same D.T as list2 object and list2 is List<dynamic>.

  var list9 = [22, 33, ...list3];
  print(list9);
  print(
    list9.runtimeType,
  ); // List<int> as list9 will be of same D.T as list3 object and list3 is List<int>.

  print('----------------------------');
  var list10 = [list9, list4, list3];
  print(list10);
  print(list10.runtimeType); // List<List<num>> as it is 2-D list [[],[]]
  var list11 = [list9, list4, ...list3];
  print(list11);
  print(
    list11.runtimeType,
  ); // List<Object> as list9 is constructed with two differet type of objects like intigers and list.
  var list12 = [list9, ...list4, ...list3];
  print(list12);
  print(list12.runtimeType);
  var list13 = [...list9, ...list4, ...list3];
  print(list13);
  print(
    list13.runtimeType,
  ); // List<num> as all list use spread operator so only their elements will be include in this list13, and they all are int.

  // Nullable/Nullsafe Spread Operator.
  // var list14 = [list2,...nullList!];  // It will be a runtime error as nullList is actually null.
  var list14 = [list2, ...?nullList];
  print(list14);
  print(list14.runtimeType);

  // Collection if statement:
  var list15 = [11, 22, 33, if (list3.length < 5) ...list3 else ...list6];
  print("List15 : $list15");
  List<Object> list16 = [
    if (list15.elementAt(2) == 3) ...?nullList else [01, 02, 03],
  ];
  print("List16 : $list16");

  // Collectiion switch statement:
  int value = 2;
  var list17 = [
    'Start',
    switch (value) {
      1 => 'One',
      2 => 'Two',
      3 => 'Three',
      _ => 'Other',
    },
    'End',
  ];
  print(list17);
  print(list17.reversed);
  var list18 = [
    switch (value) {
      1 => [1, 2, 3],
      2 => [0.1, 0.2, 0.3],
      _ => [],
    },
  ];
  print(list18);
  print(list18.runtimeType);

  // Collection for loop:
  var list19 = [for (int i = 0; i <= 10; i++) i];
  print(list19);
  var list20 = [for (int i = 1; i <= 10; i++) i % 2 == 0 ? i / 3 : 0];
  print(list20);
  var list21 = [
    for (int i = 1; i <= 20; i++)
      if (i % 3 == 0) ...[i % 4] else [(i % 4) + 1],
  ];
  print(list21);

  // Collection for each loop:
  List<int> list22 = [for (var item in list19) item];
  print("List22 : $list22");
  List list23 = [
    for (var element in list19)
      switch (element) {
        0 => "Zero",
        1 => "One",
        2 => "Two",
        3 => "Three",
        4 => "Four",
        5 => "Five",
        6 => "Six",
        7 => "Seven",
        8 => "Eight",
        9 => "Nine",
        _ => "Other",
      },
  ];
  print(list23);


  // Another important concept for all collections literals.
  List<int>? firstList;  // Means firstList can refer to null/nothing or it refer to a list of intigers.
  print(firstList);
  // firstList = [1,null, 3, null,7];  // Error as firstList should only asssign to a list which contain onlt int, no other values even it can not be null values.  
  firstList = [1,2,3,4,5];  // Now correct as firstlist can only refer to nothing or list of only intigers.  

  List<int?> secondList; // Means secondList must refer to a list and elements in that list could be intigers or null.
  // print(secondList);     // Error: secondList is not nullable so we have to assign some value before using secondlist variable.
  secondList = [1,null, 3, null,7];   // as secondlist can refer to a list which can contain both int and null values, so here it do not give error as in firstlist it gives error for this list.
  print(secondList);

  List<int?>? thirdList;  // The thirdList is combinattion of both above lists. The thirdList variable can refer to nothing or it can refer to a List.
  // If it refer to any list then that list can contain intigers or null values as well.  
  print(thirdList);  // As thirdList variable is nullable so it can refer to to nothing.
  thirdList = [1,2,3,4,5];
  thirdList = [1,null, 3, null,7];
  // As thirdList can refer to a List which can contain int or null values or both in a single list.
  // thirdList is very dynamic or flexible. 
  

}
