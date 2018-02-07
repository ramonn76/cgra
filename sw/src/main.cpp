#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>

#include "harp.h"
#define STREAM 32 // 

int main()
{
  int16_t* data_in;
  int16_t* data_out;

  data_in  = (int16_t *) malloc (STREAM*sizeof(int16_t));
  data_out = (int16_t *) malloc (STREAM*sizeof(int16_t));
  int16_t temp[STREAM]  = {//24,  0,      20,     0,      4,     6, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       //    4,   0,       0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      // 134217732,   0,           0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          // 4,  131072,           0,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         //  4,       0,         128,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        //   4,       0,   536870912,     0,      0,     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      // 725671950,  671744, -1426062704, 268697632, 1032192261, 27344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      10, 2,   3, 1, 19, 0, 18, 1, 17,2, 16,3, 15,4,
               14,5, 13,6, 12,7, 11,8, 10,9,0, 0, 0, 0, 0, 0, 0, 0};
  data_in = temp;


  #pragma omp target device(HARPSIM) map(to: data_in[:STREAM]) map(from: data_out[:STREAM])
  #pragma omp parallel use(hrw) module(reed_solomon_decoder)
  {
    data_out[0] = data_in[0];
  }


  for(int i = 0; i < 20; i++){
    printf("%d\n", data_out[i]);
  }

  //free(data_in);
  free(data_out);

  return 0;
}

