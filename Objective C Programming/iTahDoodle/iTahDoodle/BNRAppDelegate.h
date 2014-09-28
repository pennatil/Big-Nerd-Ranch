//
//  BNRAppDelegate.h
//  iTahDoodle
//
//  Created by Lucas Pennati on 05.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <UIKit/UIKit.h>

//Declare a helper function that retrieves the path where the data is saved
NSString *BNRDocPath(void);

@interface BNRAppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;
- (void)removeTask:(id)sender;

@end
