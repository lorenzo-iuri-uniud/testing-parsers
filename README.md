# Testing parsers in yacc/happy

## Yacc

* **nosdd** is a traditional yacc example which implements a calculator (without attributes)
* **bitconverter** uses sdt to convert binary non-integer numbers into decimal representation
* **tac** generates TAC for simple expressions but the temporary variabiles numbering is broken

## Happy

* **bits-simple** converts integer binary numbers in decimal
* **bitconverter** uses sdt to convert binary non-integer numbers into decimal representation
* **bitconverter-variante** does the same thing as the previous but uses an additional attribute to store the value of the result to return
* **tac** generates TAC for simple expressions but the temporary variabiles numbering does not change

## Notes:
* The parsing function generate by Happy is named as the `%name` tag
* In order to use the parsing function in a haskell program it is necessary to import the module declared in the happy file
* In bison it's necessary to declare the types structs and to assing a type struct to each non-terminal symbol. In happy there's only one type struct (named as the `attributetype` tag) which has a field for every attribute declared using the `%attribute` tag.
* In happy the field after the symbol (as in `$$.field`) can be omitted, in this case the default one is used, which is the first declared.
* In happy the returned attributed at the end of the application of the rules is default attribute.
