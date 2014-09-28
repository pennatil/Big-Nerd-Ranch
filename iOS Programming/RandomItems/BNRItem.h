//
//  BNRItem.h
//  RandomItems
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;


+(instancetype)randomItem;


-(NSDate *)dateCreated;
//Designated Initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)val
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

//SILVER CHALLENGE
-(instancetype)initWithItemName:(NSString *)name
                   serialNumber:(NSString *)sNumber;
@end
