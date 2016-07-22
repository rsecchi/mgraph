
OBJS= postscript.o graph.o

graph: $(OBJS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@


