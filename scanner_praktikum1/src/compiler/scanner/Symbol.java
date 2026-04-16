package compiler.scanner;

public class Symbol {

	public int sym;
	public int left;
	public int right;
	public Object value;

	public Symbol(int sym, int left, int right) {
		this.sym = sym;
		this.left = left;
		this.right = right;
		this.value = null;
	}

	public Symbol(int sym, int left, int right, Object value) {
		this.sym = sym;
		this.left = left;
		this.right = right;
		this.value = value;
	}

}
