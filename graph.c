#include "graph.h"

void init_vertex_random(struct vertex* v)
{
	int i;

	for(i=0; i<MAX_VERTEX; i++) 
	{
		v[i].x = drand48();
		v[i].y = drand48();

		v[i].level = i;
	}
}

void init_edge_random(struct edge* e)
{
	int i;

	for(i=0; i<MAX_EDGE; i++)
	{
		e[i].n1 = random() % MAX_VERTEX;
		do { e[i].n2 = random() % MAX_VERTEX; }
		while( e[i].n1 == e[i].n2);
		e[i].column = i;
	}

}

void init_graph_random(struct graph* g)
{
	struct timeval tv;
	int i,j;	

	gettimeofday(&tv, NULL);
	srand(tv.tv_usec);	

	init_vertex_random(g->v);
	init_edge_random(g->e);


	for(i=0; i<MAX_VERTEX; i++)
		for(j=0; j<MAX_EDGE; j++)
			g->grid[i][j] = 0;

}

int main()
{
	struct graph g;

	init_graph_random(&g);
	compact(&g);
	print_cls(&g, 100, 200);

	make_sp(&g);
	// debug_tree(&g);


	remove_cross(&g);
	compact(&g);

	print_cls(&g, 0, 200);

	// print_graph(&g);
	return 0;
}


