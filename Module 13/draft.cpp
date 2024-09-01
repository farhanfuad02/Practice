#include<bits/stdc++.h>
using namespace std;

class Node
{
    public:
        Node *previ;
        int value;
        Node *next;
        Node(int value)
        {
            this->value = value;
            this->next = NULL;
            this->previ = NULL;
        }
};

class Stack
{
    public:
    Node *head = NULL;
    Node *tail = NULL;
    int s = 0;
    void push(int val)
    {
        s++;
        Node *newNode = new Node(val);
        if(head == NULL)
        {
            head = newNode;
            tail = newNode;
            return;
        }
        tail->next = newNode;
        newNode->previ = tail;
        tail = tail->next;
    }
    void pop()
    {
        s--;
        Node *deleteNode = tail;
        tail = tail->previ;
        if(tail == NULL)
        {
            head = NULL;
        }
        delete deleteNode;
    }
    int top()
    {
        return tail->value;
    }
    int size()
    {
        return s;
    }
    bool empty()
    {
        if(s==0)return true;
        else return false;
    }
};

int main()
{
    Stack st;
    int n;
    cin >> n;
    for(int i=0; i<n; i++)
    {
        int x;
        cin >> x;
        st.push(x);
    }
    while(!st.empty())
    {
        cout << st.top() << endl;
        st.pop();
    }
    return 0;
}