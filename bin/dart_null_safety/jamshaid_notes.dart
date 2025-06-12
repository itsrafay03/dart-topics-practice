void main(List<String> args) {
  String? nullableString;
  nullableString ??= 'Default Value';
  print(nullableString ?? 'This value'); // ternary conditional operator
  // Alternative name of this ternary conditional operator is Collasing operaotr in Dart.
  print(nullableString ?? 'This Value');
}

// // Practice question from Cheat sheet of dart.
// String? upperCaseIt(String? str) {
//   // TODO: Try conditionally accessing the `toUpperCase` method here.
//   // print(str?.toUpperCase());
//   return str?.toUpperCase();   // it will return null if string is empty otherwise if there is value it will return Uppercase string value.
// }

// // Tests your solution (Don't edit):
// void main() {
//   upperCaseIt('hello');
//   upperCaseIt(null);
//   try {
//     String? one = upperCaseIt(null);
//     if (one != null) {
//       print('Looks like you\'re not returning null for null inputs.');
//     } else {
//       print('Success when str is null!');
//     }
//   } catch (e) {
//     print(
//         'Tried calling upperCaseIt(null) and got an exception: \n ${e.runtimeType}.');
//   }

//   try {
//     String? two = upperCaseIt('a string');
//     if (two == null) {
//       print('Looks like you\'re returning null even when str has a value.');
//     } else if (two != 'A STRING') {
//       print(
//           'Tried upperCaseIt(\'a string\'), but didn\'t get \'A STRING\' in response.');
//     } else {
//       print('Success when str is not null!');
//     }
//   } catch (e) {
//     print(
//         'Tried calling upperCaseIt(\'a string\') and got an exception: \n ${e.runtimeType}.');
//   }
// }
