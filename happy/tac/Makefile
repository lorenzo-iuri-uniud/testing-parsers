all: Parse

Tokens.hs : Tokens.x
		alex Tokens.x

Tac.hs : Tac.y
		happy Tac.y

Parse : Tokens.hs Tac.hs parse.hs
		ghc *.hs

clean :
		rm -f parse parse.hi parse.o Tac.hi Tac.hs Tac.o Tokens.hi Tokens.o Tokens.hs