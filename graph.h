#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <strings.h>

#define MAX_EDGE  20
#define MAX_VERTEX 10
#define SIZE 200

struct vertex 
{
	double x;
	double y;

	int level;   /* for orthogonal drawing */
	int dist;
	int visited;
};

struct edge
{
	int n1;    /* starting vertex */
	int n2;    /* ending vertex */

	int column;
};

struct graph
{
	struct edge e[MAX_EDGE];
	struct vertex v[MAX_VERTEX];

	int grid[MAX_VERTEX][MAX_EDGE];

	struct edge* ep[MAX_EDGE];

};


void init_vertex_random(struct vertex*);
void init_edge_random(struct edge*);
void init_graph_random(struct graph*);

void print_graph(struct graph*);
void sp_tree(struct graph*);

void print_cls(struct graph*, int, int);

void debug_tree(struct graph*);
void make_sp(struct graph*);
void se(struct graph*, int*, int*);

int count_cross(struct graph*);
int remove_cross(struct graph*);


void compact(struct graph*);
