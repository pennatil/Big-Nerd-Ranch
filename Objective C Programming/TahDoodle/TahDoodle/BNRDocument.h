//
//  BNRDocument.h
//  TahDoodle
//
//  Created by Lucas Pennati on 06.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BNRDocument : NSDocument <NSTableViewDataSource>

@property (nonatomic) NSMutableArray *tasks;

@property (nonatomic) IBOutlet NSTableView *taskTable;

- (IBAction)addTask:(id)sender;
- (IBAction)removeTask:(id)sender;
@end
