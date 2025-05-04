Set<String>? set1;

void main(List<String> args) {
  Set set2 = {1, 2, 3, 2, 4};
  print(
    set2.length,
  ); // As one element is repeated in set so it will not cout here as element.
  print(set2); // {1, 2, 3, 4} show only unique elements.
  print(
    set2.runtimeType,
  ); // Set<dynamic> as at declaring there is not specific type of set.

  // Cascade operator.
  set1 = {"Imran", "Khan"};
  Set<String>? set3 = {'Ali', 'Aleem', 'Akbar', ...?set1};
  print(set3);

  // Collection if else:
  Set set4 = {0.1, 0.2, 0.3, if (set2.length == 5) ...set3 else ...set2};
  print(set4);

  var set5 = set4;
  print(set5 == set4); // True as they both refer to same object of Set.
  print(set5); // Same as set4 as they both refer to same object of Set.

  // Collection Terniary(conditional) operator.
  var set6 = {(set5.first == 0.1) ? print(1) : print(0)};
  print(set6); // prints {null} As there is no element in this set.
  print(
    set6.runtimeType,
  ); // Set<void> as no D.T of set is defined and also there is no element in set.

  // Collection switch.
  num number = 2;
  var set7 = {
    'My rollno is',
    switch (number) {
      1 => 'One',
      2 => 'Two',
      3 => 'Three',
      _ => 'Other',
    },
  };
  print(set7);

  // Collection for.
  var set8 = {for (int i = 0; i < 5; i++) i * 2};
  print(set8);

  // Collection for each.
  var set9 = {for(int item in set8) item >0 && item<=4 ?[1,2,3,2,3] : {1,2,3,2,3}};
  print(set9);
  print(set9.runtimeType); // Set<Iterable<int>> as set9 is collection of different iterables of int

  
}
