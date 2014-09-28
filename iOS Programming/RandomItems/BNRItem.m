//
//  BNRItem.m
//  RandomItems
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
+(instancetype)randomItem
{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectivesList = @[@"Fluffy",@"Rusty", @"Shiny"];
    
    //Create an immutable array of three nouns
    NSArray *randomNounsList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of a random adjective/noun from the lists
    NSInteger adjectiveIndex = arc4random() % [randomAdjectivesList count];
    NSInteger nounIndex = arc4random() % [randomNounsList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectivesList[adjectiveIndex], randomNounsList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc ]initWithItemName:randomName
                                       valueInDollars:randomValue
                                         serialNumber:randomSerialNumber];
    return newItem;
}



- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)val serialNumber:(NSString *)sNumber
{
    //Call the superclass's designated initializer
    self = [super init];
    
    //Dis the superclass's designated initializer succeed?
    if (self){
        //Give the instance variables initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = val;
        //Set dateCreated to the current date
        _dateCreated = [NSDate date];
    }
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}

//SILVER CHALLENGE
-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:sNumber];
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}









@end
