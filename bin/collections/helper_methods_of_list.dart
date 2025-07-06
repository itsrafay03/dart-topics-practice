// Purple Cube icon represents Instance members (methods or properties). These are defined in the respective class.
// White Wrench icon Extension methods represents Extension methods. These are methods added to a class externally via an extension, not originally part of the class.

// Helper Methods of List.
void main(List<String> args) {
  List<String> list = ['Ali', 'Salman', 'Zeeshan', 'Ahmad', 'Usman', 'Zain'];
  print("Orignal length of list: ${list.length}");
  print(list);
  // list.length = 2;
  // print(list.length);
  // print(list);
  print(list.reversed);
  print(list.first);
  print(list.last);
  print(list.hashCode);
  print(list.isEmpty);
  print(list.isNotEmpty);
  print(list.iterator);
  print(list.runtimeType);
  // print(list.single);
  print(list.firstOrNull);
  print(list.indexed);
  print(list.lastOrNull);
  print(list.nonNulls);
  print(list.singleOrNull);
  print(list + ['Subhan', 'Ashir', 'Rohan']);
  print(list == [1,2,3,4]);
  print(list[1]);
  // print(list.any((String a) => true));
  print(list.any((a) => true));
  print(list.asMap());
  print('-----------------------------');
  print(list.cast());
  print(list.contains('Wwe'));
  




}
