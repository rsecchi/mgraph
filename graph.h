#include <stdio.h>
#include <stdlib.h>

#define MAX_EDGE  20
#define MAX_VERTEX 10
#define SIZE 200

struct vertex 
{
	double x;
	double y;
};

struct edge
{
	int n1;
	int n2;
};


struct graph
{
	struct edge e[MAX_EDGE];
	struct vertex v[MAX_VERTEX];

};


void init_vertex_random(struct vertex*);
void init_edge_random(struct edge*);
void init_graph_random(struct graph*);

void print_graph(struct graph*);

