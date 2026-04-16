package compiler.scanner;
import compiler.utils.CompilerError;
import compiler.scanner.Symbol;
%%
%class Scanner
%public
%line
%column
%type Symbol
%eofval{
return symbol(Sym.EOF);
%eofval}
%{
private Symbol symbol(int type) {
return new Symbol(type, yyline + 1, yycolumn + 1);
}
private Symbol symbol(int type, Object value) {
return new Symbol(type, yyline + 1, yycolumn + 1, value);
}
%}
%%
\s
 {}
 // Whitespace ignorieren
\/\/.* {}
 // Kommentare (zwei Backslashes) bis zum Zeilenende ignorieren

 \<
 {return symbol(Sym.LOWERTHAN);}
 \>
 {return symbol(Sym.GREATERTHAN);}
 p r i n t c
 {return symbol(Sym.PRINTC);}
 v a r
 {return symbol(Sym.VAR);}
 r e f
 {return symbol(Sym.REF);}
[a-zA-Z_][a-zA-Z_0-9]* {return symbol(Sym.IDENT, yytext());}
\'[a-zA-Z_0-9\\]*\' {return symbol(Sym.STRING, yytext());}
[0-9]+
{return symbol(Sym.INTLIT,
Integer.parseInt(yytext()));}
[^]
 { throw CompilerError.IllegalCharacter(yyline + 1, yycolumn + 1,
yytext().charAt(0)); }

