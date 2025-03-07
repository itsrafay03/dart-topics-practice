import 'dart_datatypes.dart';

void main(List<String> args) {
  Work work = Work();
  work.s;
  work.d;
  print(work.s);
  print(work);
}

class Secondaryclass {
  Work work = Work();
}

// Global members of file cann't be accessible outside the file directly but they can be called indirectly as here 'a' and foo() are called indirectly.
// Global members of file  can be accessible everywhere within a file in every class or scope.
