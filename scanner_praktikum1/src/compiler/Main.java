package compiler;

import java.io.*;
import compiler.scanner.*;

public class Main {
	public static void main(String[] args) {
		String filename;
		if (args.length == 1)
			filename = args[0];
		else
			throw new RuntimeException("No input file given");
		try {
			FileReader source = new FileReader(filename);
			Scanner scanner = new Scanner(source);
			Symbol token;
			do {
				token = scanner.yylex();
				System.out.println(token.sym + " '" + scanner.yytext() + "' ");
			} while (token.sym != Sym.EOF);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
			System.exit(-1);
		}
	}
}
