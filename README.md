# Overview
ABC Interpreter is written entirely in haskell. Language grammar is presented in *grammar.cf* file. Using this grammar I was able to use [BNF Converter](https://bnfc.digitalgrammars.com/). Code samples can be found in **examples** directory.
## Language description
ABC is imperative language modelled after C language. It is statically typed, so any type errors are detected before running the progam. The only runtime errors are:
- dividing by 0
- mod by 0
- readInt() getting non-number input
## Types
| **Type** | **Default value**  |
|----------|:------------------:|
| void     | **Does not exist** |
| int      | 0                  |
| string   | ""                 |
| bool     | false              |
Additionally variable can be read-only (using keyword *const*).

## Operators
- Arithmetic operators: `+, -, *, /, %`
- Relational operators: `<, <=, >, >=, ==, !=`
- Logical operators: `&&, ||, !`

## Comments
Multi-line comments using `/* */`, one-line comments using `//`

## Instructions
### IO instructions
#### Print
Prints content to stdio, same structure as in Python
```python
print(EXPR1, EXPR2);
```
#### ReadInt
Read line from stdio and converts is to integer. Receiving non-number input causes runtime error.
```python
int IDENT = readInt();
```
#### ReadStr
Read line from stdio and returns it as string.
```python
string IDENT = readStr();
```
### Loops
#### While
```python
while (CONDITION) {
  INSTRUCTIONS
}
```
#### For
EXPR1 and EXPR2 are evaluated before executing loop. Variable is read-only, attempt of changing variable inside of the loop causes compile error.
```python
for (IDENT = EXPR1, EXPR2) {
  INSTRUCTIONS
}
```
#### Break and continue
Break and continue act exactly like in C. They work in both types of loops.

### Conditional statements
```python
if (CONDITION) {
  INSTRUCTIONS
}

if (CONDITION) {
  INSTRUCTIONS
} else {
  INSTRUCTIONS
}
```

### Nested functions
It is possible to create nested functions, with recursion and static identifier binding.
```c
int function(ARGS) {
  int inner_function(INNER_ARGS) {
    INNSTRUCTIONS
  }
  inner_function(ARGS_VALUES);
}
```
