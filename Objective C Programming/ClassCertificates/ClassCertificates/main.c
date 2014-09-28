//
//  main.c
//  ClassCertificates
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

void congratulateStudent(char *studentName, int numDays, char *course){
    printf("%s has done as much %s programming as I could fit into %d days.\n", studentName, course, numDays);
}


int main(int argc, const char * argv[])
{
    congratulateStudent("Kate", 5, "Cocoa");
    sleep(1);
    congratulateStudent("Bo", 2, "Objective-C");
    sleep(1);
    congratulateStudent("Mike", 5, "Python");
    sleep(1);
    congratulateStudent("Liz", 5, "iOS");
    return 0;
}

