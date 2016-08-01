#include "graph.h"

#define SCALE 26
#define RAD 1
#define TEXT_OX 1
#define TEXT_OY 3

#define BBASE  10
#define BHIGH  15

void print_box(int x, int ya, int yb, int el)
{
	int x1, y1, y2, w;

	if (!el) 
	{
		printf("newpath\n");
		printf("%d %d moveto\n", x*SCALE, ya*SCALE);
		printf("%d %d lineto\n", x*SCALE, yb*SCALE);
		printf("stroke\n");
		return;
	}

	if (ya>yb) {
		w = ya;
		ya = yb;
		yb = w;
	}

	x1 = SCALE*x;
	y1 = SCALE*ya;
	y2 = SCALE*yb;
	y1 = (y1+y2)/2;	

	printf("newpath\n");
	printf("%d %d moveto \n", x1+BBASE/2, y1+BHIGH/2);
	printf("%d %d lineto \n", x1-BBASE/2, y1+BHIGH/2);
	printf("%d %d lineto \n", x1-BBASE/2, y1-BHIGH/2);
	printf("%d %d lineto \n", x1+BBASE/2, y1-BHIGH/2);
	printf("%d %d lineto \n", x1+BBASE/2, y1+BHIGH/2);
	printf("stroke\n");
	printf("newpath\n");
	printf("%d %d moveto\n", x*SCALE, ya*SCALE);
	printf("%d %d lineto\n", x*SCALE, y1-BHIGH/2);
	printf("%d %d moveto\n", x*SCALE, y1+BHIGH/2);
	printf("%d %d lineto\n", x*SCALE, yb*SCALE);
	printf("stroke\n");
}


void print_free(struct graph* g)
{
int i,j;

	printf("0.5 setgray\n");
	for(i=0; i<MAX_VERTEX; i++)
		for(j=0; j<MAX_EDGE; j++)
			if (g->grid[i][j]) {
				printf("newpath\n");
				printf("%d %d %d 0 360 arc\n", 
					SCALE*j, SCALE*i, RAD);
				printf("stroke\n");
 			}
}

void print_links(struct graph* g)
{
int i,j;

	init_link(g);
	printf("0.8 setgray\n");
	for(i=0; i<MAX_EDGE; i++)
		for(j=0; j<MAX_VERTEX; j++)
			if (g->link[i][j]) {
				printf("newpath\n");
				printf("%d %d moveto %d %d lineto\n", 
					SCALE*i, SCALE*j, 
					SCALE*i, SCALE*(j+1));
				printf("stroke\n");
 			}
}

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


		i1 = 0;
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
	printf("0 setgray\n");

	printf("newpath\n");
	printf("%d %d translate\n", x, y);

	for(i=0; i<MAX_EDGE; i++)
	{
		i1 = e[i].n1;
		i2 = e[i].n2;

		/*
		printf("%d %d moveto  ", SCALE*e[i].column, SCALE*v[i1].level);
		printf("%d %d lineto\n", SCALE*e[i].column, SCALE*v[i2].level);

		printf("%d %d moveto  ", 
			SCALE*e[i].column + TEXT_OX, 
			SCALE*v[i1].level + TEXT_OY);
		printf("(%d) show\n", i1);

		printf("%d %d moveto  ", 
			SCALE*e[i].column + TEXT_OX, 
			SCALE*v[i2].level + TEXT_OY);
		printf("(%d) show\n", i2); */
		print_box( e[i].column, v[i1].level, v[i2].level, e[i].el);
	}

	/*printf("stroke\n");*/


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
	for(i=0; i<MAX_VERTEX; i++)
	{
		printf("newpath\n");
		if (v[i].connects == 3)
			printf("%d %d %d 0 360 arc\n", 
				SCALE*start[i], SCALE*v[i].level, RAD*10);


		printf("%d %d moveto  ", SCALE*start[i], SCALE*v[i].level);
		printf("%d %d lineto\n", SCALE*end[i], SCALE*v[i].level);
		printf("stroke\n");
	}

	print_free(g);
	/* print_links(g); */
}


