//
//  main.m
//  readLineFoundation
//
//  Created by Lucas Pennati on 31.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Print message to console
        NSLog(@"Who is cool?");
        //Read the input from the console
        char *userInput = readline(NULL);
        //Convert the char to an NSString
        NSString *userName = [NSString stringWithUTF8String:userInput];
        //Print out the result
        NSLog(@"%@ is cool!", userName);        
    }
    return 0;
}

