# Szymon Olearczuk, opis rozwiązania
## Istniejące funkcjonalności
### Typy
- 4 typy wartości: int, string, bool, void
### Zmienne
- oczywiście istnieje oepracja przypisania, porównania, arytmetka itd.
- zmienne read-only (słowo kluczowe const)
- zmienne globalne i lokalne
- zadeklarowanie zmiennej bez przypisania nadaje domyślną wartość
  - int -> 0
  - string -> ""
  - bool -> false
### Instrukcje sterujące  
- standardowa pętla while
- pętla `for (i = pocz to kon)`
  - pętla w stylu Pascala (zmiana i wewnątrz pętli powoduje błąd)
  - wartość kon wyliczana jest przed wejściem do pętli
- instrukcje break/continue działające w obu wyżej wspomnianych pętlach
- instrukcja warunkowa if 
-   identycznie jak w c  -> z else lub bez
### Funkcje
- dowolnie zagnieżdżone funkcje z zachowaniem statycznego wiązania identyfikatorów 
  - funkcje "zapamiętują" środowisko z momentu deklaracji
- funkcje obsługują i zwracają wartości dowolnych istniejących typów
### Operacje wejścia-wyjścia
- print -> funkcja wypisująca wszystie otrzymane argumenty (identyczna jak w pythonie)
- readStr -> funkcja pobiera ze standardowego wejścia linię i zwraca ją jako string
- readInt -> funkcja pobiera ze standardowego wejścia linię i zwraca ją jako string (lub błąd wykonania w przypadku, gdy wpisana linia nie parsuje się do liczby)
### Dodatkowo
- obsługa błędów w czasie wykonania
  - dzielenie przez 0
  - modulo przez 0
  - pobranie z pomocą readInt napisu nie będącego liczbą
- statyczne typowanie (sprawdzanie typów w czasie "kompilacji") - wszystkie błędy poza wyżej wspomnianymi są wykryte przez rozpoczęciem działania programu
## Uwaga
- o statycznym typowaniu rozmawiałem z Panem po pierwszym projekcie interpretera, więc ta opcja jest z terminem 11 czerwca, ale oddaję ją razem z resztą wcześniej zaprojektowanych funkcjonalności