#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

#include "harp.h"
#define STREAM 128 // 

int main()
{
  int* data_in;
  int* data_out;

  data_in  = (int *) malloc (STREAM*sizeof(int));
  data_out = (int *) malloc (16*sizeof(int));
  int temp[STREAM]  = {24,  0,      20,     0,      4,     6, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           4,   0,       0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       134217732,   0,           0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           4,  131072,           0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           4,       0,         128,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           4,       0,   536870912,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       725671950,  671744, -1426062704, 268697632, 1032192261, 27344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      131082,   65539, 655370, 655370, 655370, 655370, 655370,
               655370, 655370, 655370, 655370, 655370, 0, 0, 0, 0};
  data_in = temp;


  #pragma omp target device(HARPSIM) map(to: data_in[:STREAM]) map(from: data_out[:16])
  #pragma omp parallel use(hrw) module(reed_solomon_decoder)
  {
    data_out[0] = data_in[0];
  }


  for(int i = 0; i < 10; i++){
    printf("%d\n", data_out[i]);
  }

  //free(data_in);
  free(data_out);

  return 0;
}

