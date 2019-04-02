#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstring>
#include <vector>

using namespace std;

long long int m[1000][1000];

int main(){
	FILE* f1=freopen("in.csv","w",stdout);
	srand(time(NULL));
	for(int i=0;i<10;++i)
	{
		for(int j=0;j<10;++j)
		{
			long long int a =rand()%100+1;
			if(j!=0) cout<<" ";
			cout<<a;
			//m[][]
		}
		cout<<endl;
	}
	fclose(f1);

	FILE* f2=freopen("in2.csv","w",stdout);

	for(int i=0;i<10;++i)
	{
		for(int j=0;j<10;++j)
		{
			long long int a =(rand()%100)+1;
			if(j!=0) cout<<" ";
			cout<<a;
			//m[][]
		}
		cout<<endl;
	}
	fclose(f2);
}

