#include "graph.h"

void
tripode_select(struct graph* g)
{
int i, j, n1, n2, l1, l2, lvl, w;
struct edge* e = g->e;
struct vertex* v = g->v;

	for(i=0; i<MAX_VERTEX; i++)
		v[i].connects = 0;


	for(i=0; i<MAX_EDGE; i++){
		n1 = e[i].n1;
		n2 = e[i].n2;

		(v[n1].connects)++;
		(v[n2].connects)++;
	}

	g->tripodes = 0;
	g->bipodes = 0;
	for(i=0; i<MAX_VERTEX; i++) {
		if (v[i].connects == 3)
			g->tripodes++;
		if (v[i].connects == 2)
			g->bipodes++;
	}

	fprintf(stderr, "tripodes=%d\n",g->tripodes);
	fprintf(stderr, "bipodes=%d\n",g->bipodes);

	
	for(i=0; i<MAX_EDGE; i++) {

		e[i].el = 1;
		n1 = e[i].n1;
		n2 = e[i].n2;

		if (v[n1].connects==3 || v[n2].connects ==3)
			e[i].el = 0;
	}


}

