//
//  BNRAlertViewController.m
//  HypnoNerd
//
//  Created by Lucas Pennati on 02.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRAlertViewController.h"

@implementation BNRAlertViewController

-(IBAction)showAnAlert:(id)sender {
    UIAlertView *anAlert = [[UIAlertView alloc]initWithTitle:@"Well...Hello there!"
                                                     message:@"Just saying hi!"
                                                    delegate:nil
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
    [anAlert show];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Alert";
        
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = image;
    }
    return self;
}

@end
