{
module BitsParser (parse) where
---if not attribute is specified (e.g. $1 instead of $1.val) then the default attribute is chosen, the first one in the list, in this case value
}

%tokentype { Char }

%token minus { '-' }
%token plus  { '+' }
%token one   { '1' }
%token zero  { '0' }
%token newline { '\n' }

%attributetype { Attrs }
%attribute value { Integer }
%attribute pos   { Int }

%name parse start

%%

start 
   : num newline { $$.value = $1.value }

num 
   : bits        { $$.value = $1.value       ; $1.pos = 0 }
   | plus bits   { $$.value = $2.value       ; $2.pos = 0 }
   | minus bits  { $$.value = negate $2.value; $2.pos = 0 }

bits
   : bit         { $$.value = $1.value; $1.pos = $$.pos }
   | bits bit    { $$.value = $1.value + $2.value; $1.pos = $$.pos + 1; $2.pos = $$.pos }

bit
   : zero        { $$.value = 0 }
   | one         { $$.value = 2^($$.pos) }

{
happyError = error "parse error"
}
