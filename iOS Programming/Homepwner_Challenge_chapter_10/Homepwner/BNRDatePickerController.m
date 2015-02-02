//
//  BNRDatePickerController.m
//  Homepwner
//
//  Created by Lucas Pennati on 14.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRDatePickerController.h"
#import "BNRDetailViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRDatePickerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.datePicker.date = item.dateCreated;
    
    
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    
    
    item.dateCreated = self.datePicker.date;
}

@end
