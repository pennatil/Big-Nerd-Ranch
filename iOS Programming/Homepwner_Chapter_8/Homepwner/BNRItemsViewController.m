//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Lucas Pennati on 07.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

-(instancetype)init {
    // Call the superclass
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0; i<15; i++) {
            [[BNRItemStore sharedStore]createItem];
        }
    }
    
    NSLog(@"All Items: %lu",(unsigned long)[[[BNRItemStore sharedStore]allItems] count]);
    NSLog(@"Expensive Items: %lu",(unsigned long)[[[BNRItemStore sharedStore]expensiveItems] count]);
    NSLog(@"Cheap Items: %lu",(unsigned long)[[[BNRItemStore sharedStore]cheapItems] count]);

    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return [[[BNRItemStore sharedStore]cheapItems]count];
    }else{
        return [[[BNRItemStore sharedStore]expensiveItems]count] + 1; // We add 1 more item to add the no more items cell
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [[[BNRItemStore sharedStore]expensiveItems] count]) {
        return 44;
    } else {
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        NSArray *cheapItems = [[BNRItemStore sharedStore]cheapItems];


        BNRItem *cItem = cheapItems[indexPath.row];
        cell.textLabel.text = [cItem description];
        
        UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 20.0 ];
        cell.textLabel.font  = myFont;
    } else {
        
        
        if ([self tableView:tableView numberOfRowsInSection:indexPath.section] - 1 == indexPath.row) {
            cell.textLabel.text = @"No More Items!";
        } else {
            NSArray *expensiveItems = [[BNRItemStore sharedStore] expensiveItems];
            BNRItem *eItem = expensiveItems[indexPath.row];
            cell.textLabel.text = [eItem description];
            UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 20.0 ];
            cell.textLabel.font  = myFont;
        }
    }
    
    
    return cell;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}


@end


