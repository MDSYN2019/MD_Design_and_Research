

/*
----------------------------
C++ Template Metaprogramming 
----------------------------

Metaprogramming sheds light on the most powerful idioms 
of today's C++, at long last delivering practical 
metaprogramming tools and techniques into the hands of everyday
programmer.


A metaprogram is a program that generates or manipulates program 
code. Ever since generic programming was introduced to C++, 
programmers have discovered a myriad of template tricks for 
manipulating programs as they are compiled, effectively eliminating 
the barrier between program and metaprogram.

-- 

What is a metaprogram?
---------------------

Metaprogram - A program about about a program

A metaprogram is a program that manipulates code. It may be an odd-sounding 
concept, but you're probably already familiar with several such beasts. Your C++ compiler is one example: It manipulates your C++ code to produce assembly language or machine code.


Parser generators such as YACC are another kind of program-manipulating 
program. The input to YACC is a high-level parser description written 
in terms of grammar rules and attached actions brace-enclosed. 


For instance, to parse and evalulate arithemtic expressions with the usual 
precedence rules, we might feed YACC the following grammar description.

--


expression: term
          | expression '+' term {$$ = $1 + $3; }
          | expression '-' term {$$ = $1 - $3; }

term: factor 
          

One of the nice things about template metaprograms is a property they share 
with good old traditinoal systems: Once a metaprogram is written, it can be 
used without knowing what's under the hood as long as it works.

----------------------
Metaprogramming in C++
----------------------

Numeric Computations
--------------------

The earliest C++ metaprograms performed integer computations at compile time.
One of the ver first metaprograms was shown at a C++ commitee meeting

Since illegal code is hard to use effectively in a larger system, lets examine a slightly more practical application 

 */

#include <iostream>

template <unsigned long N>
struct binary {

  static unsigned const value
  = binary<N/10>::value << 1 // prepend higher 
			   | N%10;  
};

template <>
struct binary<0> {
  static unsigned const value = 0;
};


unsigned const one = binary<1>::value;
unsigned const three = binary<11>::value;

int main(void) {
  return 0;
}
