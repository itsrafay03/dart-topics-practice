// This file is made to understand what is Factory Constructor. Why we make it? When and how it is used?
// Factory Design Pattern: When we return object of a class from Static method of the same class. Basically design patter is a generalize and reusable solution of a common problem.
// Factory Constructor is used to implement Factory Design Pattern. It is a special type of constructor that control over the instantiation process, rather than always using Class() constructor.
// In Dart if we want to implement the design pattern then we don't need static method, we have the Factory constructor here to use instead of it.
// Now Sir made a DB(Data Base) class here in which to apply design pattern Sir implement the Singleton. As DB class it self is also a singleton class.
// Singleton means in the app this class has only 1 onject. Every time only this object is used or returned.

class DB {
  // Here we have a private datamember '_instance' so that it is not accessiblr outside of the file. It's type is nullable DB and it is static member to access it with class name.
  static DB? _instance;

  // Now below this is a Generative constructor. We make this to construct the onject of DB class. Because factory constructor do not make object of a class, it just return the already made object of a class.
  // Similarly in Java the static method do not create object of a class, it just check if object of class is made or not if made then return the same object otherwise if not made then call generative constructor and assign it to static private datamember 'instance'. 
  // Because we need to construct the object of this class firt time only so we make generative constructor and also make it private because we not need this constructor outside the file. Otherwise user will call this to make multiple objects.
  // internal is just a name, nothing special about the word. Dart allows you to create named constructors, and _internal is a private named constructor. The _ prefix makes it private to the library. So, DB._internal() is just a custom-named, private generative constructor.
  DB._internal();

  // Below this is a Factory constructor, as it has a 'factory' keyword in it's header. It is a Non-generative constructor as it will not construct an object.
  // In Dart, a singleton factory constructor first checks whether the object already exists (via a static private instance).
  // If it exists, it returns the same object (cached instance).
  // If it does not exist, it creates the object using a private generative constructor, assigns it to the static instance, and then returns it.
  factory DB(){
    return _instance ??= DB._internal();
  }
}


void main(List<String> args){
  var a = DB();
}  