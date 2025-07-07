// Purple Cube icon represents Instance members (methods or properties). These are defined in the respective class.
// White Wrench icon Extension methods represents Extension methods. These are methods added to a class externally via an extension, not originally part of the class.

// Link: https://api.dart.dev/dart-core/List-class.html
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
  print(list == [1, 2, 3, 4]);
  print(list[1]);
  // print(list.any((String a) => true));
  print(list.any((a) => true));
  print(list.asMap());
  print(list.cast());
  print(list.contains('Wwe'));
  print(list.elementAt(1));
  print(list.elementAtOrNull(11));
  print(
    list.every((element) {
      return element.length > 3;
    }),
  );
  print(list.expand((element) => [2]));
  print(
    list.fold(
      list[1],
      (previousElement, currentElement) =>
          previousElement.toString() + currentElement,
    ),
  );
  print(
    [
      2,
      3,
      5,
      6,
    ].fold(0, (previous, current) => (previous as num) + (current as num)),
  );
  print(list.followedBy(['NewYork', 'Islamabad', 'London']));
  print(list);
  print(list.getRange(0, 2));
  print(list.indexOf('Usmanm')); // As not exist.
  print(list.join(":")); // tell what is the element separator here.
  print(list.lastIndexOf('Islamabad'));
  print(list.map((element) => element.length));
  print(list.reduce((a, b) => a + b));
  print(list.remove('Zeeshan'));
  print(list.removeAt(2));
  print(list.removeLast());
  print(list.skip(2));
  print(list.sublist(1, 3));
  print(list.take(4));  // take first __ elements from list.
  print(list.toList());
  print(list.toSet());
  print(list.toString());





  // print(list.where((element) => element.length > 5,));
}
