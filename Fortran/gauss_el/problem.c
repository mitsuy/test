#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  int narr;
  double diag;
  double *a;
  double *b;
  int seed;
  FILE *fp_a, *fp_b;
  char *afile="a.dat", *bfile="b.dat";

  printf("Dimension [narr]?\n");
  scanf("%d",&narr);
  printf("Dimension is %d\n\n",narr);

  printf("Diagonal Dominance [diag]?\n");
  scanf("%lf",&diag);
  printf("Diagonal Dominance is %lf\n\n",diag);

  a=(double *)malloc(sizeof(double)*narr*narr);
  b=(double *)malloc(sizeof(double)*narr);

  seed=(unsigned) time(NULL);
  srand(seed);
  printf("random seed = %d\n",seed);
  
  init_matrix(narr,a,diag);
  init_vec(narr,b);
  
  fp_a=fopen(afile,"w");
  print_matrix(fp_a,narr,a);
  fclose(fp_a);
  fp_b=fopen(bfile,"w");
  print_cvec(fp_b,narr,b);
  fclose(fp_b);

  free(a); free(b);
  
  return EXIT_SUCCESS;
}

double randf()
{
  return rand()/((double)RAND_MAX + 1);
}

int init_matrix(int n, double *mat, double diag)
{
  int i, j;
  for (i=0;i<n;i++)
    {
      for (j=0;j<n;j++)
	{
	  mat[i*n+j]=randf();
	}
      // diagonally dominant
      mat[i*n+i]*=diag;
    }
  return EXIT_SUCCESS;
}

int init_vec(int n, double *vec)
{
  int i;
  for (i=0;i<n;i++)
    {
      vec[i]=randf();
    }
  return EXIT_SUCCESS;
}

int print_matrix(FILE *fp, int n, double *mat)
{
  int i, j;
  for (i=0;i<n;i++)
    {
      for (j=0;j<n;j++)
	{
	  fprintf(fp,"%24.16f ",mat[i*n+j]);
	}
      fprintf(fp,"\n");
    }
  fprintf(fp,"\n");
  return EXIT_SUCCESS;
}

int print_cvec(FILE *fp, int n, double *vec)
{
  int i;
  for (i=0;i<n;i++)
    {
      fprintf(fp,"%24.16f\n",vec[i]);
    }
  fprintf(fp,"\n");
  return EXIT_SUCCESS;
}
