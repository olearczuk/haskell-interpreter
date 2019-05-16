int main() {
	int n = readInt();

	int inner_factorial(int n) {
		bool is_end = n < 2;
		if (is_end)
			return 1;
		return n * inner_factorial(n - 1);
	}

	print("factorial is:", inner_factorial(n));
}