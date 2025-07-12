import 'person.dart';
// This Driver class is made to see other uses of Initilization List.
// In this class there are final fields so it is Immutable class. So if we want to change name or salary then we have to make new object of this class. The existing object will not modify the fields as it is immutable class.

// For initial code the Driver class is alone we not need to extend it from Person class.
class Driver extends Person {
  // const String driverName;  Give error.
  // As we cann't make the class fields as compile time constant (using const) because fields will take memmory at run time when constructor is called. So logically they cann't be compile time constant.
  // So if we want to make them constant then we will use 'final' to make them runtime constants.
  // We can use const with static members as they came in memory with the use of class first time. But with non static or instance members we use final to make them runtime constant as they will come in memory during runtime.
  final String _driverName;
  final double _salary;

  // If the fields are public final(constant) fields then we can make Constructors like below. But we have private final(constant) fields so if we do that then fields are expose outside of class, So it's not allowed.
  // Driver({required this.driverName, required this.salary});
  // Driver({this.driverName = 'Ali', this.salary = 4990});

  // As they are private fields so we cann't use them by their name in named parameter constructor, so we use Initilization list to assign values to private fields.
  // As they are final(constant) fields so we must have to give values of the fields during the construction of object. So that's why we give default values also that if user do not give values at time of Constructor call then these default values are used.
  // We use assert statement to check the abstraction on datamember(salary) that it must be greater then 37000. So this is checked here in initilization list before the value assign to datamember(salary).
  // In assert(condition, String Errormessage) this string is the error message that will not show on terminal, but it will show as error message in Exception.
  // Driver({String name = 'Salman', double salary = 65000})
  //     : assert(
  //           salary >= 37000, 'Invalid salary! It must be greater then 37000'),
  //       _driverName = name,
  //       _salary = salary;

  // Now extend Driver class with Person class. So we can see another use of Initilization list that we can call the parent class constructor in the constructor of child class.
  // There are 3 ways to do this.
  // No 1: Call the parent class constructor in the end of Initilization list by using 'super' and take the value of parameter of constructor of parent class in the constructor of child as required parameter,
  // just because it is mandatory to give value of parameters in parent construcctor.
  // Driver({String name = 'Qadeer', double salary = 72000, required int age})
  //     : assert(
  //           salary >= 35000, 'Invalid salary! It must be greater then 37000'),
  //       _driverName = name,
  //       _salary = salary,
  //       super(age: age);

  // No 2: Syntaxtical sugar of above constructor. Instead of calling super() explicitely in Initilization list we take the age in parameter of child constructor and tell that it is for super means parent constructor.
  // We use required with super.age because it's value is mandatory for parent constructor.
  // Driver({String name = 'Qadeer', double salary = 72000, required super.age})
  //     : assert(
  //           salary >= 35000, 'Invalid salary! It must be greater then 37000'),
  //       _driverName = name,
  //       _salary = salary;

  // No 3: In above constructor if we do want to make super.age as required then we have to give super.age a default value.
  // Because it is mandatorry to give it's value in parent constructor. So if user do not give value for it then it's default value will pass in parent constructor.
  Driver({String name = 'Qadeer', double salary = 72000, super.age = 19})
      : assert(
            salary >= 35000, 'Invalid salary! It must be greater then 37000'),
        _driverName = name,
        _salary = salary;
}

// The 3 Uses of Initilization List are following:
// 1. To initilize private fields in named constructor
// 2. Used for Constructor Redirection
// 3. Used to call parent class constructor in child class constructor
