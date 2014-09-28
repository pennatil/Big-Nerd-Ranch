//
//  main.c
//  spaceCount
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int spaceCount(const char *aChar){
    int totalCount = 0;
    int pos = 0;
    while (aChar[pos] != '\0') {
        if (aChar[pos] == 0x20){
            totalCount++;//Update the count if a space is found
        }
        pos++;
    }
    return totalCount;
}


int main(int argc, const char * argv[])
{
    const char *sentence = "He was not in the cab at the time.";
    printf("\"%s\" has %d spaces\n",sentence, spaceCount(sentence));
    return 0;
}

