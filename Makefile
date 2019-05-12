all:
	ghc --make TestGrammar.hs -o interpreter
clean:
	-rm -f *.bak *.log *.aux *.hi *.o *.dvi interpreter Interp/*.hi Interp/*.o TypeChecker/*.hi TypeChecker/*.o 
