import 'class_modifiers.dart';
// Use of class modifier: Base
// It gives us proper class like Java.
// Outside file/library/package it can extends but not implements.
// Inside library it can do everything.
// You must mark any class which implements or extends a base class as base, final, or sealed. This prevents outside libraries from breaking the base class guarantees.
// What does "base class guarantees" mean? This class contains important behaviors and design expectations. If you make it's subclass, you must respect and preserve those behaviors.
// Means there is a limit who is allowed to be a subclass of a base class. It enforces controlled inheritance.
// It prevents external packages (outside your library) from extending or implementing a base class freely, unless they explicitly opt-in by marking their subclass as base, final, sealed.
// This ensures that anyone who make subclasses of your base class: Acknowledges it's a restricted/special class, Is aware that overriding it carries responsibility, Doesn’t accidentally break intended design behavior.

// Object of base class can be constructed in other file. 
Teacher teacher = Teacher();  

// base class can be extended in other file.
base class CasSir extends Teacher {  
}

// When a developer defines a class as base, they are saying:
// "This class contains logic or internal structure that should only be subclassed or implemented carefully — ideally within the same library where it was defined."
// Why implementing is restricted than extending of base class? Because implements requires the subclass to reimplement the entire interface.
// This can break internal logic or contracts the original base class was designed to enforce.
// Dart’s language designers want to avoid “false” implementations of critical APIs, especially in external packages.

// base class can not be implements in other file. Show error at Teacher.
// base class IubTeacher implements Teacher {
//   @override
//   void teachingSubject(String subjectName) {
//     // TODO: implement teachingSubject
//   } 
// }
