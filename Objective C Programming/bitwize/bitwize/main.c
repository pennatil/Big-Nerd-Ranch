//
//  main.c
//  bitwize
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    unsigned char a = 0x3c;
    unsigned char b = 0xa9;
    
    unsigned char c = a | b;
    printf("Hex: %x | %x = %x\n", a,b,c);
    printf("Decimal: %d | %d = %d\n", a,b,c);
    
    unsigned char d = a & b;
    printf("Hex: %x | %x = %x\n", a,b,d);
    printf("Decimal: %d | %d = %d\n", a,b,d);
    
    unsigned char e = a ^ b;
    printf("Hex: %x | %x = %x\n", a,b,e);
    printf("Decimal: %d | %d = %d\n", a,b,e);
    
}

