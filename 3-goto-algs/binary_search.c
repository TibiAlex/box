#include <stdio.h>

void main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;

	/* TODO: Implement binary search */
    label:
    dest == v[start] ? printf("%d\n", start) : printf("");
    start ++;
    if(start <= end) { 
           goto label;
    }

}
