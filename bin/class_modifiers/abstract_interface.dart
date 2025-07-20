import 'class_modifiers.dart';
// Use of class modifier: Abstract Interface
// It will definately will have a combined features of bothe abstract and interface.
// It has No object (inside and outside file).
// It can not be extend ousside the file.
// It can only be implement ouside the file like interface in Java.
// Actually this abstract interface class modifier make the dart class as pure interface like in java.
// That's why we can not make it's object or extends it. Just we can implements it like interface.
// If you want more details about interface then go and check it in the register of Java.

// We can not construct object of abstract interface class because abstract classes can't be instantiated.
// ICricketPlayer iCricketPlayer = ICricketPlayer();

// The abstract interfce class can't be extended outside file/library because it's an interface.
// class Clerk extends ICricketPlayer {
//   @override
//   void fielding() {
//     // TODO: implement fielding
//   }

//   @override
//   bool toss(String side) {
//     // TODO: implement toss
//     throw UnimplementedError();
//   }
// }

// The abstract interface class can only implements outside the file. Because it is a pure interface likr in Java whcih can only implements and must override all it's methods.
class Student implements ICricketPlayer {
  @override
  void batting() {
    // TODO: implement batting
  }

  @override
  void fielding() {
    // TODO: implement fielding
  }

  @override
  bool toss(String side) {
    // TODO: implement toss
    throw UnimplementedError();
  }
}

