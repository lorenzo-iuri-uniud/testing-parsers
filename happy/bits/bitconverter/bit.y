{
module BitsParser (parse) where
---if not attribute is specified (e.g. $1 instead of $1.val) then the default attribute is chosen, the first one in the list, in this case decvalue
}

%tokentype { Char }

%token one   { '1' }
%token zero  { '0' }
%token newline { '\n' }
%token dot { '.' }

%attributetype { Attrs }
%attribute decvalue { Double }
%attribute len   { Double }

%name parse start

%%

start 
   : binseq newline            { $$ = $1  }
   | binseq dot binseq newline { $$ = $1 + $3/$3.len  }

binseq
   : binseq bit { $$.len = $1.len * 2; $$ = $1 * 2 + $2  }
   | bit        { $$ = $1; $$.len = $1.len }

bit
   : zero       { $$ = 0; $$.len = 2 }
   | one        { $$ = 1; $$.len = 2 }

{
happyError = error "parse error"
}
