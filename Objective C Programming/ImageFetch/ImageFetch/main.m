//
//  main.m
//  ImageFetch
//
//  Created by Lucas Pennati on 03.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:@"http://www.google.ch/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        if (!data){
            NSLog(@"Fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        
        //Set image path to the user's predefined download location
        NSArray *downloads = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
        NSString *pathToDownloadsDirectory = downloads[0];
        NSString *pathToImage = [pathToDownloadsDirectory stringByAppendingPathComponent:@"google.png"];
        
        
        BOOL written = [data writeToFile:pathToImage
                                 options:NSDataWritingAtomic
                                   error:&error];
        if (!written){
            NSLog(@"Write failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success");
        
        NSData *readData = [NSData dataWithContentsOfFile:pathToImage];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
    }
    return 0;
}

