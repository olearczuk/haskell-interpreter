int fibonacci(int n) {
	if (n < 2)
		return n;
	int a = 0;
	int b = 1;

	for (i = 2 to n) {
		int aux = a + b;
		a = b;
		b = aux;
	}

	return b;
}

int main() {
	int n = readInt();
	print(n, "fibonacci number is", fibonacci(n));
}