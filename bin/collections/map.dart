// A Map is a collection of key-value pairs.
// Keys must be unique
// Values can be duplicated
// {} is the literal of Map (by default) but if there is no key value pair in {} then it is a set.

Map<int, String>? map1;
void main(List<String> args) {
  print(map1); // null as map is not initilize.
  print(
    map1.runtimeType,
  ); // null as it is a nullable map and also we have not assign any value to map.

  Map<int, String> map2 = {1: 'Salman', 2: 'Ahmad', 3: 'Umar'};
  print(map2); // {1: Salman, 2: Ahmad, 3: Umar}
  print(map2.keys); // (1, 2, 3) collection of keys of map
  print(map2.values); // (Salman, Ahmad, Umar) collection of values of map
  print(map2.entries);
  print(map2.length); // 3 as it have 3 key-values pairs.
  print(map2.runtimeType); // Map<int, String>

  Map map3 = {};
  print(map3.runtimeType); // _Map<dynamic, dynamic>

  // spread operator.
  Map<int, dynamic> map4 = {1: 2, 2: 'Furqan', 7: 'char', ...map2};
  print(
    map4,
  ); // {1: Salman, 2: Ahmad, 7: char, 3: Umar} the duplicate keys with their values are removed from map4.

  // Collection if else.
  var map5 = {2, 22, 222, if (map4.isEmpty) {} else map4};
  print(map5);
  print(map5.length);
  print(
    map5.runtimeType,
  ); // prints Set<Object> as this set contain simple intigers and also a set or a map.

  // Collection terniary(conditional) operator.
  var map6 = {
    00,
    01,
    02,
    03,
    05,
    (map5.first == 02) ? print('yes') : print('no'),
  };
  print(map6);

  // Collection switch.
  bool value = true;
  var map7 = {
    switch (value) {
      true => 'Yes',
      false => "No",
      _ => "Neutral",
    },
  };
  print(map7);

  // Collection for.
  Map<dynamic, dynamic> map8 = {
    "name": 'Ali',
    'rollNo': 22,
    for (num i = 1.5; i <= 3.5; i += 0.5)
      if (i >= 2.5) i: null else i: {},
  };
  print(map8);

  // Collection for each.
  var map9 = {for (var item in map2.entries) item};
  print(map9);
}
