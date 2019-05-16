int main() {
	int test_function(int a, string b) {
		if (b == "")
			return a;
		return a + 1;
	}

	test_function(1, 2);
}