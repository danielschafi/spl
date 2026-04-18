package compiler.scanner;

public interface Sym {
	 int EOF = 0;

	// Punctutation 
     int LPAREN   = 1;  
     int RPAREN   = 2;  
     int LCURLY   = 3;  
     int RCURLY   = 4;  
     int LBRACKET = 5;  
     int RBRACKET = 6;  
     int COMMA    = 7;  
     int SEMICOLON    = 8; 
     int COLON    = 9;  

	// Keywords
	int ARRAY = 16;
	int OF = 17;
	int IF = 18;
	int ELSE = 19;
    int PROC = 20;
    int TYPE = 21;   
    int WHILE = 22;   


	 int VAR = 21;
	 int REF = 22;

	 int IDENT = 27;
	 int INTLIT = 28;
	 int LOWERTHAN = 29;
	 int GREATERTHAN = 30;

	 int PRINTC = 32;
	 int STRING = 33;


	int ASGN = 35;


	// Math stuff
	int EQ = 40;
	int NEQ = 41;
	int PLUS = 42;
	int MINUS = 43;
	int SLASH = 44; 
	int STAR = 45;
	int LT = 46; 
	int GT = 47;
	int LEQ = 48;
	int GEQ = 49;
}
