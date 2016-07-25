#include "graph.h"

void debug_tree(struct graph* g)
{
int i;

struct vertex* v = g->v;
struct edge* e = g->e;

	for(i=0; i<MAX_EDGE; i++)
		printf("edge[%d] %d %d -- col %d\n", i, e[i].n1, e[i].n2, e[i].column);

	for(i=0; i<MAX_VERTEX; i++)
		printf("vertex[%d] -- level %d   dist %d\n", i, v[i].level, v[i].dist);
}

int count_cross(struct graph* g)
{
int start[MAX_EDGE];
int end[MAX_EDGE];
struct vertex* v = g->v;
struct edge* e = g->e;
int count, lvl, l1, l2, col, i, j;

	se(g, start, end);
	count = 0;
	for(i=0; i<MAX_EDGE; i++)
	{
		for(j=0; j<MAX_VERTEX; j++) {

			col = e[i].column;
			l1 = v[e[i].n1].level;
			l2 = v[e[i].n2].level;

			if (l1<l2) {
				lvl = l1;
				l1 = l2;
				l2 = lvl;
			}

			lvl = v[j].level;

			if ( lvl<l1 && lvl>l2 && col>start[j] && col<end[j] ) {
				
				/* DEBUG
				printf("newpath\n");
				printf("%d %d 6 0 360 arc\n", 
					col*20,
					lvl*20);
				printf("stroke\n");
				*/

				count++;
			}
		}
	}
	return count;

}


int remove_cross(struct graph* g)
{
struct vertex* v = g->v;
struct edge* e = g->e;
int count, lvl, l1, l2, col, i, j;
int c1, c2;

	c1 = count_cross(g);

	for(i=0; i<MAX_EDGE; i++) {

		for(j=0; j<MAX_EDGE; j++) {

			col = e[i].column;
			e[i].column = e[j].column;
			e[j].column = col;

			c2 = count_cross(g);
			if (c2 < count) {

				fprintf(stderr, "crossing: %d\n", c2);
				count = c2;
				i = 0;
				j = 0;

			} else {
				col = e[i].column;
				e[i].column = e[j].column;
				e[j].column = col;
			}

		}
	}

	for(i=0; i<MAX_VERTEX; i++) {

		for(j=0; j<MAX_VERTEX; j++) {

			lvl = v[i].level;
			v[i].level = v[j].level;
			v[j].level = lvl;

			c2 = count_cross(g);
			if (c2 < count) {

				fprintf(stderr, "crossing: %d\n", c2);
				count = c2;
				i = 0;
				j = 0;

			} else {
				lvl = v[i].level;
				v[i].level = v[j].level;
				v[j].level = lvl;
			}
			

		}
	}

	return count;
	
}

void make_sp(struct graph* g)
{
int i,j;
int n1, n2, m1, m2;
struct vertex* v = g->v;
struct edge* e = g->e;
int dist, lvl;

	v[0].dist = 0;
	for(i=1; i<MAX_VERTEX; i++)
		v[i].dist = -1;

	dist = 0;
	while(dist<MAX_EDGE)
	{
		for(i=0; i<MAX_EDGE; i++) {
			n1 = e[i].n1;
			n2 = e[i].n2;

			if (v[n1].dist == dist && v[n2].dist == -1)
				v[n2].dist = dist + 1;

			if (v[n2].dist == dist && v[n1].dist == -1)
				v[n1].dist = dist + 1;			
		}

		dist++;
	}

	for(i=0; i<MAX_VERTEX-1; i++)
		for(j=i+1; j<MAX_VERTEX; j++)
			if ( v[i].dist < v[j].dist && v[i].level < v[j].level) {
				lvl = v[i].level;
				v[i].level = v[j].level;
				v[j].level = lvl;
			}

	for(i=0; i<MAX_EDGE-1; i++) {
		n1 = e[i].n1;
		n2 = e[i].n2;

		for(j=i+1; j<MAX_EDGE; j++) {

			m1 = e[j].n1;
			m2 = e[j].n2;

			if ( v[n1].dist + v[n2].dist < v[m1].dist + v[m2].dist
				&& e[i].column < e[j].column) {

				lvl = e[i].column;
				e[i].column = e[j].column;
				e[j].column = lvl;
			}
		}
	}

}
