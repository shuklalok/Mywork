#include<stdio.h>
#include<malloc.h>
typedef struct node{
        int data;
        struct node* next;
}NODE;

//NODE *insert(NODE *);
NODE *insert(NODE *h){
        int data;
        NODE *p = h;
        NODE *temp;
        printf("Data to insert\n");
        scanf("%d",&data);
        temp = (NODE *)malloc(sizeof(NODE));
        temp->data = data;
        temp->next = NULL;

        if (h != NULL){
                h->data = data;
                h->next = NULL;
        }
        else{
                while (p->next !=NULL)
                       p = p->next;
        }
        p->next = temp;
        return h;
}

int main (){
        NODE* head;
        head = (NODE *)malloc(sizeof(NODE));
        if (head != NULL){
                head->data = 1;
                head->next = NULL;
        }
        printf("Head Data = %d", head->data);
        printf("Head Next = %p", head->next);
        //printf("Head Next = %p", head->next);
        insert(head);

        return 0;
}