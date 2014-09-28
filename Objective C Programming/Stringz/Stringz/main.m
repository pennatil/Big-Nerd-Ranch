//
//  main.m
//  Stringz
//
//  Created by Lucas Pennati on 03.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0;i < 10; i++){
            [str appendString:@"Lucas is cool!\n"];
        }
        
        //Declare a pointer to an NSError object, but do not instantiate it
        NSError *error;
        
        [str writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        if (!error) {
            NSLog(@"Done writing");
        } else {
            NSLog(@"Error while writing: %@", [error localizedDescription]);
        }
        
        
        //READING
        NSString *strRead = [[NSString alloc] initWithContentsOfFile:@"/tmp/cool.txt"
                                                        encoding:NSUTF8StringEncoding
                                                           error:&error];
        
        if (str){
            NSLog(@"Contents of file: \n%@", strRead);
        } else {
            NSLog(@"Could not read the file: %@", [error localizedDescription]);
        }
        
        
        
    }
    return 0;
}

