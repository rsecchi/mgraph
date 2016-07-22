#include "graph.h"

void init_vertex_random(struct vertex* v)
{
	int i;

	for(i=0; i<MAX_VERTEX; i++) 
	{
		v[i].x = drand48();
		v[i].y = drand48();
	}
}

void init_edge_random(struct edge* e)
{
	int i;

	for(i=0; i<MAX_EDGE; i++)
	{
		e[i].n1 = random() % MAX_VERTEX;
		e[i].n2 = random() % MAX_VERTEX;
	}

}

void init_graph_random(struct graph* g)
{
	init_vertex_random(g->v);
	init_edge_random(g->e);

}

int main()
{
	struct graph g;

	init_graph_random(&g);
	print_graph(&g);
	return 0;
}


