// This file is made to learn the concept of Operator Overloading.
// Only by name it is Operator Overloading but actually Operator overloading means:
// Giving custom behavior to standard operators (+, -, *, ==, [], []=, etc.) when used with your own classes. Means redefining how an operator behaves for a user-defined class.

class Clock {
  int hours;
  int minutes;
  int seconds;

  // Named Optional Default Parameterized Constructor.
  Clock({this.hours = 0, this.minutes = 0, this.seconds = 0});

  // So called Operators Overloading but actually it is Overriding.
  // Operator is a specialize function. As we can see below.
  // The function identifier is '+' whose RDT is Clock means Clock' class object. It has keyword of 'operator' in it's header. It has mandatory parameter of Clock class object and in the body it return the object of Clock class by adding the hours, minutes, and seconds of 2 Clock class objects.
  // Compiler knows from this 'operator' keyword that this function is sprecialize for operator, so it has sprecial function.
  Clock operator +(Clock other) {
    return Clock(
        hours: hours + other.hours,
        minutes: minutes + other.minutes,
        seconds: seconds + other.seconds);
  }

  // Actually under the hood how the above specialize function of + is working is shown below by normal plus function.
  // It's RDT is Clock and also accepting Clock parameter just the difference is of identifier and operator keyword because it is normal function.
  Clock plus(Clock other) {
    return Clock(
        hours: hours + other.hours,
        minutes: minutes + other.minutes,
        seconds: seconds + other.seconds);
  }

  // Operator overloading by using relational operator '=='.
  // Case:1
  // bool operator ==(Clock object) {
  //   return hours == object.hours &&
  //       minutes == object.minutes &&
  //       seconds == object.seconds;
  // }
  // Above we get Error at '==' because it's pure Overriding occuring here as == is already defined in Object class. So if we use == in child class of Object class so it's overriding and we have to give same signature
  // to the parameter that we have to give parameter of Object type but here we are giving Clock type so as signatur changed so it's voilation of rule of overriding. That's why we see error here.

  // Case:2
  // bool operator ==(Object object) {
  //   return hours == object.hours &&
  //       minutes == object.minutes &&
  //       seconds == object.seconds;
  // }
  // Now above we give Object type variable in parameter so that it's signature match with specialize function of == defined in Object class. So overriding criteria fulfilled and previous error resolved.
  // But now we got error at hours, minutes, and seconds because these fields are not defined in Object class and we are trying to access it with the instance of Object class so definately it has to show error.

  // case:3
  // bool operator ==(Object object) {
  //   return hours == (object as Clock).hours &&
  //       minutes == object.minutes &&
  //       seconds == object.seconds;
  // }
  // Now we cast the instance of Object class that 'object is as instance of Clock' so it compiler consider the variable object of Clock type and easily assess it's datamembers.
  // Also in parameter we gave Object type so it also satisfy criteria of overloading so there is no error any more and now we can use thia relational operator == in main to compare two objects according to defined functionality.

  // Case:4
  @override
  bool operator ==(covariant Clock object) {
    return hours == object.hours &&
        minutes == object.minutes &&
        seconds == object.seconds;
  }
  // This above is another varient/form of the case:3 as we use 'covarient' keyword in parameter which ensure compiler that do not worry as Clock is the varient of Object, means here Clock is same as Object. 
  // As we need Object type variable in parameter and 'covarient' ensures that Clock is same as Object so compiler accept it and not show error.  

  // toString method.
  @override
  String toString() {
    return '$hours:$minutes:$seconds';
  }
}
