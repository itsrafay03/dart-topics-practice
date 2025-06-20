void main(List<String> args) {
  List<int> list1 = <int>[
    1,
    2,
    3,
    4,
    5,
  ]; // Most strict typing of variable list.
  const List<int> list2 = <int>[
    1,
    2,
    3,
    4,
    5,
  ]; // Most strict typing of compile time constant list.
  final List<int> list3 = <int>[
    1,
    2,
    3,
    4,
    5,
  ]; // Most strict typing of runtime constant list.
  // with final we generally call constructor as it is runtime constant, but uptill now we have not study constructors so here we are using literal of list with final.
  List<int> list4 = [1, 2, 3, 4, 5, 6]; // Strict typing of variable list.
  const list5 = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
  ]; // Strict typing of compile time constant list. Also it is type inference of constant list as we only use const without defining it's type.
  final list6 = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
  ]; // Strict typing of runtime constant list. Also it is type inference of constant list as we only use final without defining it's type.
  // with final we generally call constructor as it is runtime constant, but uptill now we have not study constructors so here we are using literal of list with final.
  var list7 = <int>[
    1,
    2,
    3,
    4,
    5,
  ]; // Strict typing of variable list. Also type inference of variable list as we are using var.
  List list8 = [1, 2, 3, 4, 5, 6]; // Linent typing of variable list.
  print(
    list8.runtimeType,
  ); // List<dynamic>  as we do not define template of list.
  var list9 = [
    1,
    2,
    3,
    4,
  ]; // Linent typing of variable list with type inference.
  print(
    list9.runtimeType,
  ); // List<int> as list9's type will depend on first value given to it which is list of intigers.
  var list10 = [
    1,
    2,
    3,
    4,
    9.99,
    'ALi',
  ]; // As there is not template define means no strict typing so list can contain any type of object.
  print(list10.runtimeType); // List<Object>
  // The Linent type is not recomanded because it will accept every type of object in list and make List<dynamic> so it's batter to use at least one template either with List or in case of type inference.

  const List<int> list11 = <int>[1, 2, 3, 4];
  // Old syntax. First const will make reference variable as constant means it will not refer any other object and 2nd const will make the literal as constant that it will not allow any changing in literal.
  const List<int> list12 = <int>[1, 2, 3, 4];
  // New syntax. If const is with reference variable then it means the literal is also constant. So no need to write const with literal.
  final List<int> list13 = <int>[1, 2, 3, 4, 5];
  // Here reference variable is final means runtime constant, and as it is constant so this reference variable will not refer to any other object. ut literal is variable in this case so here literal is mutable(we can change elements).
  list13.add(99);
  print(list13);
  final List<int> list14 = const <int>[1, 2, 3, 4, 5];
  // If we want the literl of , runtime constant list, to be constant and immutable(elements cann't be change) so we will use const with literal. As we know const will make the literal as immutable.
  // list14.add(100);  Now this line will give Runtime exception as we can not change the elements of constant list literal.
  // Actually list13 is final reference variable which is refering to variable list, but list14 is final reference variable whcih is refering to constant list.
  // with final we generally call constructor as it is runtime constant, but uptill now we have not study constructors so above we are using literal of list with final.

  var list15 = const <int>[1, 2, 3, 4];
  // Now it is variable reference variable which is refering to the constannt list.
  // list15[0] = 100;  // We get Runtime exception because we can not modify the elements of constamt list.
  list15 = [100, 102, 105];
  // As reference variable list15 is variable so it can easily refer to any other object of List<int> type(due to var).
  list15[0] =
      999; // Now we can modify the elements of list as list15 is now refering to variable list which is mutable.

  List<int> list16 = const <int>[1, 2, 3, 4];
  List<int> list17 = const [1, 2, 3, 4];
  // list16 and list17 are also variable reference variable which are refering to a constant list. So we can not modify their list content but list16 and list17 can refer to the other list objects.
  // Same as above case of list15. asically list16 and list17 are strict typing of list15.

  // Set
  // Most strict typing of variable set.
  Set<int> set1 = <int>{1, 2, 3, 4, 5};

  // Set has all the same decleration types as discussed above for List.

  // Map
  // Most strict typing of variable map.
  Map<int, String> map1 = <int, String>{1: 'Ali', 2: 'Waqas', 3: 'Salman'};
  print(map1);
  // Map has all the same decleration types as discussed above for List.

  var a = {};
  // Now this is which literal set or map?
  print(a.runtimeType);
  // So here it is a literal of Map as by default braces{} are the literal of Map.

  // Json
  List<Map<String, dynamic>> data = [
    {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
    {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
    {"userId": 1, "id": 3, "title": "omnis laborum odio"},
    {"userId": 1, "id": 4, "title": "non esse culpa molestiae omnis sed optio"},
    {"userId": 1, "id": 5, "title": "eaque aut omnis a"},
    {"userId": 1, "id": 6, "title": "natus impedit quibusdam illo est"},
    {"userId": 1, "id": 7, "title": "quibusdam autem aliquid et et quia"},
  ];

  print(data.runtimeType);

}

