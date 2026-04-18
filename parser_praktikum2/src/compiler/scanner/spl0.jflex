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


\s      {}       // Whitespace ignorieren
\/\/.*  {}       // Kommentare (zwei Backslashes) bis zum Zeilenende ignorieren

 printc             {return symbol(Sym.PRINTC);}
 var                {return symbol(Sym.VAR);}
 ref                {return symbol(Sym.REF);}

// First we need to identify if its a keyword
"array"             { return symbol(Sym.ARRAY); }
"else"              { return symbol(Sym.ELSE); }
"if"                { return symbol(Sym.IF); }
"of"                { return symbol(Sym.OF); }
"proc"              { return symbol(Sym.PROC); }
"ref"               { return symbol(Sym.REF); }
"type"              { return symbol(Sym.TYPE); }
"var"               { return symbol(Sym.VAR); }
"while"             { return symbol(Sym.WHILE); }



[a-zA-Z_][a-zA-Z_0-9]*  {return symbol(Sym.IDENT, yytext());}
\'[a-zA-Z_0-9\\]*\'     {return symbol(Sym.STRING, yytext());}
[0-9]+                  {return symbol(Sym.INTLIT, Integer.parseInt(yytext()));}


// Operators
":="    { return symbol(Sym.ASGN); }
"<="    { return symbol(Sym.LEQ); }
">="    { return symbol(Sym.GEQ); }


"="     { return symbol(Sym.EQ); }
"#"     { return symbol(Sym.NEQ); }
"-"     { return symbol(Sym.MINUS); }
"+"     { return symbol(Sym.PLUS); }
"/"     { return symbol(Sym.SLASH); }
"*"     { return symbol(Sym.STAR); }
">"     { return symbol(Sym.GT); }
"<"     { return symbol(Sym.LT); }


// Punctuation
"("     { return symbol(Sym.LPAREN); }
")"     { return symbol(Sym.RPAREN); }
"{"     { return symbol(Sym.LCURLY); }
"}"     { return symbol(Sym.RCURLY); }
"["     { return symbol(Sym.LBRACKET); }
"]"     { return symbol(Sym.RBRACKET); }
","     { return symbol(Sym.COMMA); }
";"     { return symbol(Sym.SEMICOLON); }
":"     { return symbol(Sym.COLON); }



[^]     { throw CompilerError.IllegalCharacter(yyline + 1, yycolumn + 1, yytext().charAt(0)); }
