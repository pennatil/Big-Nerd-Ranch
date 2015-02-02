//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Lucas Pennati on 11.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRDatePickerController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;
@end

@implementation BNRDetailViewController

-(void)setItem:(BNRItem *)item {
    _item = item;
    self.navigationItem.title = _item.itemName;
    
    _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    _tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapRecognizer];
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

-(IBAction)changeCreationDate:(id)sender {
    BNRDatePickerController *datePickerViewController = [[BNRDatePickerController alloc]init];
    
    datePickerViewController.item = self.item;
    
    [self.navigationController pushViewController:datePickerViewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    self.serialNumberField.text = item.serialNumber;
    
    static NSDateFormatter *dateFormatter;
    
    if (!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}


@end
