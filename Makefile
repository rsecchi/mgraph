
HDR= graph.h
OBJS= postscript.o graph.o ps_drive.o sorting.o compact.o tripodes.o
CFLAGS= -g -O2

graph: $(OBJS) $(HDR)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm $(OBJS)

