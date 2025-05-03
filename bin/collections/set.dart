import 'dart:mirrors';

Set<int>? set1;

void main(List<String> args) {
  Set set2 = {1,2,3,2,4};
  print(set2);
  print(set2.runtimeType);

  
}