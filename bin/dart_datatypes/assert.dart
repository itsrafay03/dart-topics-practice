// In Dart, assert is used as a debugging tool to validate assumptions in your code.
// It checks whether a given condition is true during development, and if not, it throws an error,
// which helps you catch bugs early. assert statements are ignored in production
// (when the code is compiled in release mode), so they don't affect performance in the final app.

void main(List<String> args) {
  int age = 1;
  assert(age > 18, 'Enter correct age above 18.');
  print('ok');
}

// If age > 18 is true, nothing happens, and the code continues executing.
// If age > 18 is false, the program throws an AssertionError with the optional message
// "Age must be greater than 18."

/*Important Notes
Assert statements are only executed in debug mode. In release mode, they are ignored, which makes them
safe to use for checks that should not impact production performance.
Dart's assert is commonly used in Flutter development, especially for widget validation
and to ensure state consistency during UI builds.
*/
