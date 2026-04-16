package compiler.utils;



public class CompilerError extends RuntimeException {
	
	public CompilerError(String message) {
		super(message);
	}
	public static CompilerError IllegalCharacter(int line, int column, char character) {
		return new CompilerError("erorr at line " + line + " column " + column + " char " + character);
		
	}
	public static CompilerError SyntaxError(int line, int column) {
		return new CompilerError("erorr at line " + line + " column " + column);
		
	}
	
}
