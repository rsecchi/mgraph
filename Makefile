
OBJS= postscript.o graph.o ps_drive.o sorting.o

graph: $(OBJS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm $(OBJS)

