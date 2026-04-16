package compiler.scanner;
import compiler.utils.CompilerError;
import java_cup.runtime.Symbol;
import compiler.parser.Sym;
%%
%class Scanner
%public
%line
%cup
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

 ;
 {return symbol(Sym.SEMIC);}
 :=
 {return symbol(Sym.ASGN);}
 \+
 {return symbol(Sym.PLUS);}
 -
 {return symbol(Sym.MINUS);}
 \*
 {return symbol(Sym.STAR);}
 \/
 {return symbol(Sym.SLASH);}
 
[a-zA-Z_][a-zA-Z_0-9]* {return symbol(Sym.IDENT, yytext());}

[0-9]+
{return symbol(Sym.INTLIT,
Integer.parseInt(yytext()));}

[^]
 { throw CompilerError.IllegalCharacter(yyline + 1, yycolumn + 1,
yytext().charAt(0)); }

