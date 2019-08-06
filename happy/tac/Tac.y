{
module Tac (parse) where
import Tokens
}

%tokentype { Token }

%token
   num { TokenInt $$ }
   ident {TokenIdent $$}
   '+' { TokenPlus }
   '*' { TokenTimes }

%attributetype { Attrs }
%attribute code { String }
%attribute addr { String }

%name parse expr

%%

expr
     : atom '+' expr { $$.addr = newTemp; $$.code = $1.code ++ $3.code ++ $$.addr ++ " = " ++ $1.addr ++ " + " ++ $3.addr ++ "\n" }
     | atom '*' expr { $$.addr = newTemp; $$.code = $1.code ++ $3.code ++ $$.addr ++ " = " ++ $1.addr ++ " * " ++ $3.addr ++ "\n" }
     | atom          { $$.addr = $1.addr; $$.code = $1.code }

atom
     : num   { $$.code = ""; $$.addr = makeAddr $1 }
     | ident { $$.code = ""; $$.addr = getAddr $1 }

{
happyError = error "parse error"

newTemp :: String
-- this should increment every time it's called but haskell has not state and I don't know how to use monads
newTemp = "t_" ++ show 42

getAddr :: String -> String
getAddr s = s

makeAddr :: Int -> String
--makeAddr i = (show $ i*33)++""
makeAddr i = (show i)
}
