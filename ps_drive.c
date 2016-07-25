#include "graph.h"

#define SCALE 20
#define RAD 2
#define TEXT_OX 1
#define TEXT_OY 3

void se(struct graph* g, int *start, int* end)
{
int i, j, lvl, l1, l2;

int i1, i2;
struct vertex *v1, *v2;
struct edge* e = g->e;
struct vertex* v = g->v;
int vs, ve, c;


	for(i=0; i<MAX_VERTEX; i++) {
		start[i] = -1;
		end[i] = -1;
	}

	for(i=0; i<MAX_EDGE; i++)
	{

		vs = e[i].n1;
		ve = e[i].n2;
		c =  e[i].column;

		l1 = v[vs].level;
		l2 = v[ve].level;

		if ( l1 < l2 ) {
			l1 = v[ve].level;
			l2 = v[vs].level;
		}


		for(j=0; j<MAX_VERTEX; j++)
		{

			lvl = v[j].level;

			if ( start[j] == -1 && (l1 == lvl  || l2 == lvl)) {
				start[j] = end[j] = c;
			} else {
				if ( start[j] > c && (l1 == lvl  || l2 == lvl))
					start[j] = c;

				if ( end[j] < c  && (l1 == lvl  || l2 == lvl))
					end[j] = c;
			}
		}
	}
}

void print_cls(struct graph* g, int x, int y)
{
int i, j, lvl, l1, l2;

int i1, i2;
struct vertex *v1, *v2;
struct edge* e = g->e;
struct vertex* v = g->v;
int vs, ve, c;

int start[MAX_VERTEX];
int end[MAX_VERTEX];

	printf("/Times-Roman findfont\n");
	printf("12 scalefont\n");
	printf("setfont\n");

	printf("newpath\n");
	printf("%d %d translate\n", x, y);

	for(i=0; i<MAX_EDGE; i++)
	{
		i1 = e[i].n1;
		i2 = e[i].n2;

		printf("%d %d moveto  ", SCALE*e[i].column, SCALE*v[i1].level);
		printf("%d %d lineto\n", SCALE*e[i].column, SCALE*v[i2].level);

		printf("%d %d moveto  ", 
			SCALE*e[i].column + TEXT_OX, 
			SCALE*v[i1].level + TEXT_OY);
		printf("(%d) show\n", i1);

		printf("%d %d moveto  ", 
			SCALE*e[i].column + TEXT_OX, 
			SCALE*v[i2].level + TEXT_OY);
		printf("(%d) show\n", i2);
	}

	printf("stroke\n");


	for(i=0; i<MAX_EDGE; i++)
	{
		i1 = g->e[i].n1;
		i2 = g->e[i].n2;
		printf("newpath\n");
		printf("%d %d %d 0 360 arc\n", SCALE*e[i].column, SCALE*v[i1].level, RAD);
		printf("stroke\n");
		printf("newpath\n");
		printf("%d %d %d 0 360 arc\n", SCALE*e[i].column, SCALE*v[i2].level, RAD);
		printf("stroke\n");
	}

	se(g, start, end);	
	printf("newpath\n");
	for(i=0; i<MAX_VERTEX; i++)
	{
		printf("%d %d moveto  ", SCALE*start[i], SCALE*v[i].level);
		printf("%d %d lineto\n", SCALE*end[i], SCALE*v[i].level);

	}
	printf("stroke\n");

}


