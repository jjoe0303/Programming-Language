#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstring>
#include <vector>
#include <omp.h>
#include <thread>

using namespace std;

vector<vector<long long> > matrix1;
vector<vector<long long> > matrix2;

int i,j,k;
int n1,n2,n3,n4;
int thread_count;
vector<vector<long long> > ans;

void mul(int x)
{
	cout<<x<<endl;
	int st=x*n1/thread_count;
	int ed=(x+1)*n1/thread_count;
		for(i=st;i<ed;i++)
				{
						for(j=0;j<n4;++j)
						{
								for(k=0;k<n2;++k)
								{
									ans[i][j] += matrix1[i][k]*matrix2[k][j];	
								}
//								cout<<ans[i][j]<<" ";
						}
//						cout<<endl;
				}
}

int main(int argc,char* argv[]){
		int n=1;
		clock_t s1, s2;
		//FILE* f1=freopen("in.csv","r",stdin);
		//FILE* f2=freopen("out.csv","w",stdout);
		thread_count=strtol(argv[1],NULL,10);
		//cout<<thread_count<<endl;
		long long  mat;
		matrix1.clear();
		matrix2.clear();
		scanf("%d %d",&n1,&n2);
		for(int i=0;i<n1;++i)
		{
				vector<long long> row1;
				for(int j=0;j<n2;++j)
				{
						scanf("%lld",&mat);
						row1.push_back(mat);
				}
				matrix1.push_back(row1);
		}

		//		fclose(f1);
		//		FILE* f3=freopen("in2.csv","r",stdin);
		scanf("%d %d",&n3,&n4);
		for(int i=0;i<n3;++i)
		{
				vector<long long> row2;
				for(int j=0;j<n4;++j)
				{
						scanf("%lld",&mat);
						row2.push_back(mat);
				}
				matrix2.push_back(row2);
		}
		//		fclose(f3);
		while(n--)
		{
			for(int i=0;i<n1;++i)
			{
					vector<long long> row1;
					for(int j=0;j<n4;++j)
					{
						row1.push_back(0);
					}
					ans.push_back(row1);
			}

			s1=clock();
		//	cout<<thread_count<<endl;
		//	mul(0);
			switch(thread_count)
			{
				case 1:
					{
						thread t1(mul,0);
						t1.join();
						break;
					}
				case 2:
					{
						thread t1(mul,0);
						thread t2(mul,1);		
						t1.join();
						t2.join();
						break;
					}
				case 3:
					{
						thread t1(mul,0);
						thread t2(mul,1);	
						thread t3(mul,2);		
						t1.join();	
						t2.join();
						t3.join();
						break;
					}
				case 4:
					{
						thread t1(mul,0);
						thread t2(mul,1);	
						thread t3(mul,2);	
						thread t4(mul,3);	
						t1.join();	
						t2.join();
						t3.join();
						t4.join();
						break;
					}
				default:
					{
						thread t1(mul,0);
						t1.join();
						break;
					}
			}
			s2=clock();
			cout<<(s2-s1)/(double)(CLOCKS_PER_SEC)<<endl;	
			//if(n!=0) cout<<", ";
/*			for(int i=0;i<n1;++i)
			{
					vector<long long> row2;
					for(int j=0;j<n4;++j)
					{
						cout<<ans[i][j]<<" ";
					}
					cout<<endl;

			}*/
		}
}
