// This file is made to understand the concept of template type in Dart.
// The template type in Dart is same as in Java. Template type is applied where there is a generic code, irrespective of specific datatype.

// main function.
import 'dart:isolate';

void main(List<String> args) {
  // UniList type list is made and elements are added in it.
  UniList<num> uniList = UniList();
  uniList.addUni(3);
  uniList.addUni(25.78);
  uniList.addUni(10);

  // We can not pass any other datatype in template of MyList because it is restricted to only String daattype.
  // MyList<bool> myList1 = MyList();
  // MyList<num> myList2 = MyList();
  MyList<String> myList3 = MyList();
  myList3.add('Ali');
  myList3.add('Salman');

}

// This is a Template type of UniList to make a list of Unis.
class UniList<T> {
  List<T>? list;

  void addUni(T t) {
    list?.add(t);
  }
}

// We can also restrict the template type of a class.
// We can only pass String or it's child class in the template of MyList<>.
class MyList<T extends String> {
  List<T>? list;

  void add(T t) {
    list?.add(t);
  }
}

// In Dart we can also put template types of the functions.
void foo<T>() {
  T t;
}

// This is generic identity function, it will take same datatype in template, in parameter, and return datatype.
T soo<T>(T t) {
  return t;
}
