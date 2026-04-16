package compiler;

import java.io.*;

import compiler.parser.Parser;
import compiler.scanner.*;
//import java_cup.parser;

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
			Parser p = new Parser(scanner);
			p.parse();
			//p.debug_parse();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
			System.exit(-1);
		}
	}
}
