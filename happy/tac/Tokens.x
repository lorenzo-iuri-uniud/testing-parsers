{
module Tokens where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

   $white+                ;
   "--".*                 ;
   $digit+                { \s -> TokenInt (read s) }
   $alpha+                { \s -> TokenIdent s }
   \+                     { \s -> TokenPlus }
   \*                     { \s -> TokenTimes }

{

data Token = TokenInt Int
           | TokenIdent String
           | TokenPlus
           | TokenTimes
           deriving (Eq,Show)

scanTokens = alexScanTokens

}

