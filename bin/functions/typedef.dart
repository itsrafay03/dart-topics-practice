//

// in typedef we first use typedef reserved word then any random name of the type/Abstract class then '=' then we write RDT of the function and then 'Function' class then arguments of function that we want to use in parameter or return from any other function.
typedef Sumition = num Function(num, num);
typedef Add = int Function({required int a, required int b});

void main(List<String> args){
  // bwp(sum);
  // As the above sunction call will throw Runtime error as in bwp() body the f() need to 2 num values as actual parameters because we are passing sum function as paarmeter in bwp() function and in body of bwp() in the palce of 'f' the sum() is calling.

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
  
}

// Simple sum function as we discussed previously that compiler will make it's implicit class and the object of that class is made in heap whose reference is stored in const variable 'sum'.
num sum(num n1, num n2) => n1 + n2;
// A callable/functional class ABC with call function in it, as we discused previously.
class ABC {
  num call(num n1, num n2){
    return n1 + n2;
  }
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

