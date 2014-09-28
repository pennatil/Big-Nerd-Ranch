//
//  main.m
//  Callbacks
//
//  Created by Lucas Pennati on 03.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

typedef void (^notificationCenterBlock)(NSNotification *);
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        notificationCenterBlock passABlock;
        
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification
                                                          object:nil
                                                           queue:nil
                                                      usingBlock:passABlock = ^(NSNotification *note) {
                                                          NSLog(@"The system time zone has changed");
                                                      }];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger
                                                                      startImmediately:YES];
        
        
        
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(updateLastTime:)
                                                        userInfo:nil
                                                         repeats:YES];
        __unused BNRObserver *observer = [[BNRObserver alloc]init];
        
        //I want to know the new value and the old valu whnever lastTime is changed
        [logger addObserver:observer
                 forKeyPath:@"lastTimeString"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:nil];
        
        
        
        
        [[NSRunLoop currentRunLoop] run];
        
        
    }
    return 0;
}

