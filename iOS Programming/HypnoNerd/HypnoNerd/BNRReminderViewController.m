//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Lucas Pennati on 02.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

-(IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Reminder";
        
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = image;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"BNRReminderViewController loaded its view.");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
