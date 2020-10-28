#include <stdio.h>

void main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max = v[0];
	int i = 0;
	int end = sizeof(v)/ sizeof(int) - 1;

    label:
    max < v[i] ? max = v[i] : printf("");
    i++;
    if(i <= end) { 
           goto label;
    }
    printf("%d\n", max);

	/* TODO: Implement finding the maximum value in the vector */
}
