//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Lucas Pennati on 18.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

-(void)loadView {
    self.view = [[BNRDrawView alloc]initWithFrame:CGRectZero];
}
@end
