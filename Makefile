
OBJS= postscript.o graph.o ps_drive.o sorting.o compact.o
CFLAGS= -g -O2

graph: $(OBJS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm $(OBJS)

