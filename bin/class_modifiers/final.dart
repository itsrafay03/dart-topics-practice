import 'class_modifiers.dart';
// Use of class modifier: Final
// There are only concrete methods in final class. No abstract methods are there because Abstract methods are meant to be overridden in subclasses. But since a final class cannot be extended, there's no subclass that could implement those abstract methods, making it pointless.
// Only object of final class is constructed outside the library/file/package.
// Only Object construct (outside and inside) file, No extends and No implements outside library because Dart restricts final, base, and sealed classes from being subclassed(extended) or implemented outside the defining library to maintain safe inheritance boundaries. To protect internal logic and prevent external packages from misusing or breaking important behaviors defined in the class.
// But inside file the final class extends and implements with only those classes which have base, final, and sealed modifiers. Because Dart enforces that any subclass of a final, base, or sealed class must also declare its own modifier (base, final, or sealed) so the inheritance chain stays controlled and predictable.
// This ensures you don’t unintentionally expose the final class’s logic by making subclasses that can be extended freely from other libraries.

// Outside file the final class object can be constructed. 
Lamborghini lamborghini = Lamborghini();

// Can not be extends.
// class Car extends Lamborghini {}   // Show error.

// Can not be implements.
// class Car implements Lamborghini {     // Show error.
//   @override
//   void tuneing() {
//     // TODO: implement tuneing
//   }
// }

