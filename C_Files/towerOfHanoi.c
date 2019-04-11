#include<stdio.h>
void toh(int, char, char, char);

int main (){
        int num = 0;
        printf("Enter Number of Disks:");
        scanf("%d", &num);
        printf("Number of disks are %d\n",num);
        if (num)
                toh(num,'S','D','A');
return 0;
}

void toh(int n, char S, char D, char A){
        if (n == 1){
                printf("Move Disk 1 from %c to %c\n",S,D);
                return;
        }
        toh(n-1,S,A,D);
        printf("Move Disk %d from %c to %c\n",n,S,D);
        toh(n-1,A,D,S);
}
