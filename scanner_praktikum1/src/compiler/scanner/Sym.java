package compiler.scanner;

public interface Sym {
	public static final int EOF = 0;

	// Punctutation 
    public static final int LPAREN   = 1;  
    public static final int RPAREN   = 2;  
    public static final int LCURLY   = 3;  
    public static final int RCURLY   = 4;  
    public static final int LBRACKET = 5;  
    public static final int RBRACKET = 6;  
    public static final int COMMA    = 7;  
    public static final int SEMICOLON    = 8; 
    public static final int COLON    = 9;  

	// Keywords
	int ARRAY = 16;
	int OF = 17;
	int IF = 18;
	int ELSE = 19;
    int PROC = 20;
    int TYPE = 21;   
    int WHILE = 22;   


	public static final int VAR = 21;
	public static final int REF = 22;

	public static final int IDENT = 27;
	public static final int INTLIT = 28;
	public static final int LOWERTHAN = 29;
	public static final int GREATERTHAN = 30;

	public static final int PRINTC = 32;
	public static final int STRING = 33;


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
