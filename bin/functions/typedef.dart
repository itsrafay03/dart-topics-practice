// How to define explicit type of a function by using typedef. And how to use a function in parameter of another function and how to return a function from another function.

// in typedef we first use typedef reserved word then any random name of the type/Abstract class then '=' then we write RDT of the function and then 'Function' class then arguments of function that we want to use in parameter or return from any other function.
typedef Sumition = num Function(num, num);
typedef Add = int Function({required int a, required int b});  // typedef with required named parameters.

// New way to define typedef
typedef bool Compare(Object o1, Object o2);   // Here type name is Compare.

typedef Calculations = int Function();

void main(List<String> args){
  // bwp(sum);
  // As the above sunction call will throw Runtime error as in bwp() body the f() need to 2 num values as actual parameters because we are passing sum function as parameter in bwp() function and in body of bwp() in the palce of 'f' the sum() is calling.

  // Now in bwp() the isb is sent so Function type parameter f will assign to same object as isb. Means when f() is called actually isb() is calling.
  // So in body of bwp() f means isb calling with 1 string actual parameter so that's perfectly match the formal parameter of isb() function, so it gives no error. 
  bwp(isb);

  // mlt() is called with 'sum' as actual parameter and it will give no error because signature and RDT od sum match with signature and RDT of function required in mlt() function.
  mlt(sum);

  // Here below we can see that mlt() function can accept any function of any class or global function, which has same RDT and signature which is required by special function in parameter of mlt() function.
  // And the requirment of that special function is defined by typedef with name of type/Abstract class as 'Sumition'. 
  ABC abc = ABC();
  mlt(abc.call);
  Student s1 = Student();
  mlt(s1.foo);

  // Below it will give compile time error as bwp has the signature which do not match with that required in mlt() function. 
  // mlt(bwp);

  // Return function from a function.

  // Here we are calling subtract function functions and assign it to a variable name 'result'. But we have to give that DT to result variable which is returning from subtract function. 
  // As subtract function is returning another function of Calculations type so inshort subtract function is returning a value(whcih is function) of Calculations type so we have to make 'result' a variable of Calculations typee.
  Calculations result = subtract(a: 20, b: 9);
  // As subtract function is returning a function(closure) of Calculations type so in result we have that closure of same signature and RDT as mentioned in Calculations.
  print(result);   // So that's why it give "Closure: () => int"
  // If we want to call or execute that function which is returned from subtract function and now it is in result varriable, so for that we have to call the 'result' means call object as function. Because result is refering to that function object which we want to call.
  print(result.call());
  // or
  print(result());  // syntactical sugar of above one. 

}

// Simple sum function as we discussed previously that compiler will make it's implicit class and the object of that class is made in heap whose reference is stored in const variable 'sum'.
num sum(num n1, num n2) => n1 + n2;
// A callable/functional class ABC with call function in it, as we discused previously.
class ABC {
  num call(num n1, num n2) => n1 + n2;
}

// A simple data class Student. It has a method foo() which has same RDT and signature as function of sum(), and call() method of ABC callable class, and function which is required in mlt function.  
class Student {
  num foo(num n1, num n2){
    return n1 + n2;
  }
}

// A Function which need a function in parameter so here it take Parent class Function as parameter so it can handle any function type which pass to bwp function. 
// Here in function body irrespective of actual value of parameter each function is called with 1 String actual parameter 'bahawalpur'
void bwp(Function f){
  f('bahawalpur');
}

// Now we make another function who is taking 1 String parameter. 
void isb(String a){
  print('Islamabad is called $a');
}

// Here is our mlt() function which need a specific function in parameter which return num value and take 2 num values in paraemter. So we have to define this signature explicitely in typedef. 
// That's why in body we gave actual parameters. And for these actual parameter functionality of that function will work whose reference in given in mlt() function call. 
void mlt(Sumition sumition){
  print(sumition(2,3));
}


// Return a function(clousre) from another function.
// A closure is a special function. A closure is a function defined within another function that remembers the variables from its outer function, even after the outer function has finished running. This allows the closure to access and use those variables later when it's called.
// Here subtract function needs to return a function which take no parameters and return single int value. So we define those signature in typedef and make an explicit type/Abstract class and named the type as 'Calculations' and give then in RDT of subtract function to tell which type of function will return.
// In the body of subtract function we are returning the given function as closure. The signature of returned function is same as that we required and as that we define above by typedef. 
Calculations subtract({required int a, required int b}){
  // We want to return the function by ourself which math requirment of Calculations so we retun closure here.
  return () => a-b;
  // Another closure.
  // int ans = a-b;
  // return () => ans;

  // It is also correct because zoo() function has same signature and RDT whcih is required here for returned function. So instead of closure(means we define function by our own) we can return functional object of same signature as 'zoo'. 
  // return zoo;   
}
// Short form of above function as it's body has simgle statement.
Calculations minus({required int a, required int b}) => () => a-b;

// function which required no parameters but return single int value. It has same signature and RDT as Calculations.
int zoo(){
  return 99;
}

