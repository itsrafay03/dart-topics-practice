// This file is made to understand the concept of Extension Functions in Dart.
// Extension functions allow you to add new methods or properties to existing classes without modifying the class or creating a subclass.
// They help extend functionality of built-in types (like String, int, List) or custom types.

// main function.
void main(List<String> args) {
  // Actually we want to call toInt() method for a numbers string literal to convert this string into int. But this toInt() method is not present in String class so,
  // we will add this function in String class by using Extension Function.
  String value = '123'.toInt();
  print(value);
}

// 
extension MyString on String? {
  // As we are casting here nullable String so we put RDT as int?.
  // We can access the object of string in the class of String? by using this. SO here this is the string object that we have to cast.  
  // We use conditional operator in body of function that if string is not null and isDigitString then parse it otherwise return null.
  int? toInt(){
    return this != null && isDigitString() ? int.parse(this!) : null;
  }
  
  // this?.runes: If this is not null, it gives the Unicode code units (as Runes) for the string. If this is null, it safely returns null because of the null-safe operator ?.
  // .every((element) => condition): This checks if every rune (character code) satisfies the condition, that it's a digit (ASCII code between 48 and 57).
  bool isDigitString() {
    return this?.runes.every((element) => element >= 48 && element <= 57,) ?? false;
  }
}

