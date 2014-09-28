//
//  BNRDocument.m
//  TahDoodle
//
//  Created by Lucas Pennati on 06.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRDocument.h"

@implementation BNRDocument

# pragma mark - NSDocument Overrides

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"BNRDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    //When data is saved
    
    //if no array exists, create a new one
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    
    //Pack the data into an NSData object
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks
                                                              format:NSPropertyListXMLFormat_v1_0
                                                             options:0
                                                               error:outError];
    
    //Return the newly packed data
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    //When data is read
    
    self.tasks = [NSPropertyListSerialization propertyListWithData:data
                                                           options:NSPropertyListMutableContainers
                                                            format:NULL
                                                             error:outError];
    return (self.tasks != nil);
}

#pragma mark - Actions
 -(void)addTask:(id)sender
{
    //If there is no array, create one
    if (!self.tasks){
        self.tasks = [NSMutableArray array];
    }
    
    [self.tasks addObject:@"New Item"];
    
    //Reload data
    [self.taskTable reloadData];
    
    //Update change count
    [self updateChangeCount:NSChangeDone];
}

/**
 *  Remove the currently selected item from the list
 *
 *  @param sender Item selected when the button is pressed
 */
- (void)removeTask:(id)sender
{
    //Get index of the element to delete
    NSInteger indexOfItemToDelete = [self.taskTable selectedRow];

    //If no row is selected (indexOfItemToDelete = -1), return nothing
    if (indexOfItemToDelete < 0){
        NSLog(@"No actual row selected");
        return;
    }

    //Remove the item
    [self.tasks removeObjectAtIndex:indexOfItemToDelete];
    
    //Reload data
    [self.taskTable reloadData];
    
    //Update change count
    [self updateChangeCount:NSChangeDone];
    
}

# pragma mark - Data source Methods
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    //Return number of rows
    return [self.tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //Return the item from tasks that corresponds to the cell that the table view wants to display
    return [self.tasks objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //When the user changes a task on the table view, update the tasks array
    [self.tasks replaceObjectAtIndex:row withObject:object];
    
    //And then flag the document as having unsaved changes
    [self updateChangeCount:NSChangeDone];
}
@end
