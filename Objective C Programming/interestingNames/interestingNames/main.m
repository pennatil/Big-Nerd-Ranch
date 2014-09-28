//
//  main.m
//  interestingNames
//
//  Created by Lucas Pennati on 31.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Read the file as a huge string
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        //Break it into an array of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        
        NSString *wordsString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        NSArray *words = [wordsString componentsSeparatedByString:@"\n"];
        
        
        
        //Go through the array one string at a time
        for (NSString *n in names){
            if ([words containsObject:n.lowercaseString]){
                NSLog(@"The proper name %@ is also a word",n);
            }
        }
        
    }
    return 0;
}

