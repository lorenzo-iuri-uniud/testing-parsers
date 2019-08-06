{
module BitsParser (parse) where
}

%tokentype { Char }

%token one   { '1' }
%token zero  { '0' }
%token newline { '\n' }
%token dot { '.' }

%attributetype { Attrs }
%attribute result { Double }
%attribute decvalue { Integer }
%attribute len   { Int }

%name parse start

%%

start 
   : binseq newline            { $$ = fromIntegral $1.decvalue  }
   | binseq dot binseq newline { $$ = fromIntegral($1.decvalue) + fromIntegral($3.decvalue)/fromIntegral($3.len)  }

binseq
   : binseq bit { $$.len = $1.len * 2; $$.decvalue = $1.decvalue * 2 + $2.decvalue  }
   | bit        { $$.decvalue = $1.decvalue; $$.len = $1.len }

bit
   : zero       { $$.decvalue = 0; $$.len = 2 }
   | one        { $$.decvalue = 1; $$.len = 2 }

{
happyError = error "parse error"
}
