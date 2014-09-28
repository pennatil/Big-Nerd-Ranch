//
//  main.m
//  BMITime
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Create an Array of BNREmployee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        //Create a dictionary of executives
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++){
            //Create an instance of BNREmployee
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            //Assign some values
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            //Add it to the array
            [employees addObject:mikey];
            
            
            //Is this the first employee
            if (i==0){
                [executives setObject:mikey forKey:@"CEO"];
            } else if (i == 1){ //Second employee
                [executives setObject:mikey forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc]init];
        
        //Create 10 assets
        for (int i = 0; i < 10; i++){
            //Create an asset
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            //Give it a label
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            //Random number between 0 and 9 inclusive
            NSUInteger randomIndex = random() % [employees count];
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset];
        }
        
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        
        [employees sortUsingDescriptors:@[voa,eid]];
        
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        
        //Print out the entire dictionary
        NSLog(@"Executives: %@", executives);
        
        //Print out the CEO's information
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"toBeReclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        
        NSLog(@"Giving up ownership of Arrays");

        allAssets = nil;
        employees = nil;
        
    }
    sleep(100);
    return 0;
}

