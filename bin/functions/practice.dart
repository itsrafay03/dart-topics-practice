// Practice of typedef, function in parameter, and function returned from another function.

// Typedefs.
typedef SnokerPlayerName = String Function(String firstName, String secondName);
typedef Message = String Function({required String players});

// Functions.
Message playSnocker(SnokerPlayerName palyers) {
  String names = palyers("Ali ", "Akbar");
  return ({required String players}) =>
      "Players names are $names and their coach is $players";
}

String playingPeople(String name1, String name2) {
  return name1 + name2;
}

// Void Function.
void main(List<String> args) {
  print(playSnocker(playingPeople)(players: "Rafay"));

  // Fun1:
  print(greeting(setName).call("Farhan"));
  // Fun2:
  print(math(sum)(20, 9));
  // Fun3:
  print(chainIntiger(increment10, decrement5)(11));
  // Fun4:
  conditionalExecutor(evaluate).call(3);
  // Fun5:
  print(transformer(str).call('Ali'));
}

typedef F1parameter = String Function(String);
typedef F1return = String Function(String);
// Practice questions.
F1return greeting(F1parameter para) {
  return (String name) => para("Hello friend $name.");
}

String setName(String nam) => "Yoo $nam";

typedef F2parameter = int Function(int, int);
typedef F2return = int Function(int, int);
F2return math(F2parameter para) {
  return (int a, int b) => para(a, b);
}

int sum(int a, int b) => a + b;


typedef FirstF3Parameter = int Function(int);
typedef SecondF3Parameter = int Function(int);
typedef F3return = int Function(int);
F3return chainIntiger(FirstF3Parameter f1, SecondF3Parameter f2) {
  return (int number) => f2(f1(number));
}

int increment10(int a) => a + 10;
int decrement5(int a) => a - 5;


typedef F4parameter = bool Function(int);
typedef F4return = void Function(int);

F4return conditionalExecutor(F4parameter para) {
  return (int a){
    if(para(a)){
      print('Allowed');
    }else{
      print('Denied');
    }
  };
}

bool evaluate(int number) {
  if (number >= 10) {
    return true;
  }else{
    return false;
  }
}


typedef F5parameter = String Function(String);
typedef F5return = String Function(String);
F5return transformer(F5parameter para){
  return (String input) => "Transformed: ${para(input)}";
}

String str(String s) => s;