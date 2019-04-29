all:
all:
	ghc --make TestGrammar.hs -o interpret
clean:
	-rm -f *.bak *.log *.aux *.hi *.o *.dvi interpret Interp/*.hi Interp/*.o TypeChecker/*.hi TypeChecker/*.o 