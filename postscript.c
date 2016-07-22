#include "graph.h"

#define SIZE 200
#define RADIUS 0.01

#define CX 100
#define CY 100

void set_coordinate()
{
	printf("%d %d translate\n", CX, CY);
	printf("%d %d scale\n", SIZE, SIZE);
}

void print_edge(struct vertex* v1, struct vertex* v2)
{
	printf("%lf %lf moveto  ", v1->x, v1->y);
	printf("%lf %lf lineto\n", v2->x, v2->y);
}

void print_vertex(struct vertex* v)
{
	printf("%lf %lf %lf 0 360 arc\n", v->x, v->y, RADIUS);
	
}

void print_graph(struct graph* g)
{
	int i;
	int v1, v2;
	struct vertex *v = g->v;
	struct edge* e = g->e;


	printf("newpath\n");
	set_coordinate();
	for(i=0; i<MAX_EDGE; i++) {
		v1 = e[i].n1;
		v2 = e[i].n2;
		print_vertex(&v[v1]);
		print_vertex(&v[v2]);
		print_edge(&v[v1], &v[v2]);
	}
	printf("stroke\n");
}



