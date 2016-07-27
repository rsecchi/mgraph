#include "graph.h"


void clear_grid(struct graph* g)
{
int i, j, k, l, n1, n2, col, l1, l2, lvl, m;
struct edge* e = g->e;
struct vertex* v = g->v;


	for(l=0; l<MAX_EDGE; l++){
		n1 = e[l].n1;
		n2 = e[l].n2;
		col = e[l].column;

		l1 = v[n1].level;
		l2 = v[n2].level;

		if (l1>l2) {
			lvl = l1;
			l1 = l2;
			l2 = lvl;
		}

		for(j=0; j<MAX_VERTEX; j++)
			if (j<l1 || j>l2)
				g->grid[j][col] = 1;
			else
				g->grid[j][col] = 0;
	}


}


void compact(struct graph* g)
{
int i, j, k, l, n1, n2, col, l1, l2, lvl, m;
struct edge* e = g->e;
struct vertex* v = g->v;
	

	for(i=0; i<MAX_EDGE; i++)
	{
		clear_grid(g);
		for(j=0; j<MAX_EDGE; j++)
		{
			if (e[j].column == i) {

				n1 = e[j].n1;
				n2 = e[j].n2;
				col = e[j].column;

				l1 = v[n1].level;
				l2 = v[n2].level;

				if (l1>l2) {
					lvl = l1;
					l1 = l2;
					l2 = lvl;
				}
				
			}
		}
	}	

}
