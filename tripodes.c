#include "graph.h"


void set_centres(struct graph* g)
{
int i, j, k, n1, n2, l1, l2, lvl, w;
struct edge* e = g->e;
struct vertex* v = g->v;
int min, max;

	for(i=0; i<MAX_VERTEX; i++)
		v[i].connects = 0;


	for(i=0; i<MAX_EDGE; i++){
		n1 = e[i].n1;
		n2 = e[i].n2;

		if (v[n1].connects<3)
			v[n1].c[v[n1].connects] = e[i].column;

		if (v[n2].connects<3)
			v[n2].c[v[n2].connects] = e[i].column;

		(v[n1].connects)++;
		(v[n2].connects)++;
	}

	fprintf(stderr, "TRIPODES\n");
	for(i=0; i<MAX_VERTEX; i++)
	{
		if (v[i].connects == 3) {

			fprintf(stderr, "%d) %d %d %d --> ",
				i, v[i].c[0], v[i].c[1], v[i].c[2]);

			for(j=0; j<2; j++) 
				if (v[i].c[j]<v[i].c[j+1]) {
					w = v[i].c[j];
					v[i].c[j] = v[i].c[j+1];
					v[i].c[j+1] = w;
				}

			if (v[i].c[0]<v[i].c[1]) {
				w = v[i].c[0];
				v[i].c[0] = v[i].c[1];
				v[i].c[1] = w;
			}
			fprintf(stderr, "%d %d %d\n",
				v[i].c[0], v[i].c[1], v[i].c[2]);

			v[i].centre = v[i].c[1];
		}
	}
}

void
tripode_select(struct graph* g)
{
int i, j, k, n1, n2, l1, l2, lvl, w;
struct edge* e = g->e;
struct vertex* v = g->v;
int min, max;

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

