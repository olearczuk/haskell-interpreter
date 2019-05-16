int result = 1;

int main() {
	int n = readInt();
	while (true) {
		if (n < 2)
			break;
		result = result * n;
		n--;
	}
	print("factorial is:", result);
}