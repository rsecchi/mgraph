#include "graph.h"

void order(int* x1, int* x2)
{
	int w;
	if ( x2<x1 ) {
		w = *x1;
		*x1 = *x2;
		*x2 = w;
	}
}


void enum_edges(struct graph* g)
{
struct edge* e = g->e;
struct edge** ep = g->ep;
int i, col;

	for(i=0; i<MAX_EDGE; i++)
	{
		col = e[i].column;
		ep[col] = &(e[i]);
	}
}

void shift_left(struct edge* e, struct graph* g)
{
int i, j, k, l, n1, n2, col, l1, l2, lvl, m;
int c;
struct vertex* v = g->v;

	n1 = e->n1;
	n2 = e->n2;
	col = e->column;

	l1 = v[n1].level;
	l2 = v[n2].level;

	order(&l1, &l2);

	for(c=e->column; c>=0; c--)
	{
	}

}


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

		order(&l1, &l2);

		for(j=0; j<MAX_VERTEX; j++)
			if (j<l1 || j>l2)
				g->grid[j][col] = 1;
			else
				g->grid[j][col] = 0;
	}


}

void init_link(struct graph* g)
{
int i, j, k, l, n1, n2, col, l1, l2, lvl, m;
int h1, h2;
struct edge* e = g->e;
struct vertex* v = g->v;
int w;

	memset(g->link, 1, sizeof(int)*MAX_EDGE*MAX_VERTEX);

	for(i=0; i<MAX_EDGE; i++) {

		l1 = v[e[i].n1].level;
		l2 = v[e[i].n2].level;
		if (l1>l2) {
			w = l1;
			l1 = l2;
			l2 = w;
		}

		for(j=l1; j<l2; j++)
			g->link[e[i].column][j] = 0;
	}

}

void compact(struct graph* g)
{
int i, j, k, l, n1, n2, col, l1, l2, lvl, m;
int h1, h2;
struct edge* e = g->e;
struct vertex* v = g->v;
int flag, w;
struct edge* myep;
	
	//fprintf(stderr, "compact\n");
	enum_edges(g);

	for(i=0; i<MAX_EDGE; i++)
	{

		l1 = v[g->ep[i]->n1].level;
		l2 = v[g->ep[i]->n2].level;

		if (l1>l2) {
			w = l1;
			l1 = l2;
			l2 = w;
		}
		//fprintf(stderr, "edge[%d] l1=%d l2=%d col=%d\n",
		//		i,l1,l2, g->ep[i]->column);

		for(j=g->ep[i]->column-1; j>=0; j--) {
			flag = 1;
			for(k=l1; k<l2; k++) {
				if ( ! g->link[j][k] )
					flag = 0;
				//fprintf(stderr, "%d %d flag=%d link=%d\n", 
				//	j, k, flag, g->link[j][k]);
			}
			//fprintf(stderr, "flag=%d\n", flag);

			if (flag)
				g->ep[i]->column = j;
			else
				j = -1;
		}

		init_link(g);
	}	

}
