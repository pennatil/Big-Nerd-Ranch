//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Lucas Pennati on 07.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic)NSMutableArray *privateItems;
@property (nonatomic) NSMutableArray *privateCheapItems;
@property (nonatomic) NSMutableArray *privateExpensiveItems;

@end

@implementation BNRItemStore
+(instancetype)sharedStore {
    static BNRItemStore *sharedStore;
    
    if (!sharedStore){
        sharedStore = [[self alloc]initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    [NSException raise:@"Singleton" format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

-(instancetype)initPrivate {
    self = [super init];
    if (self){
        self.privateItems = [[NSMutableArray alloc]init];
        self.privateCheapItems = [[NSMutableArray alloc] init];
        self.privateExpensiveItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems
{
    return [self.privateItems copy];
}

-(NSArray *)expensiveItems
{
    return self.privateExpensiveItems;
}

-(NSArray *)cheapItems
{
    return self.privateCheapItems;
}

-(BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    if (item.valueInDollars < 50) {
        [self.privateCheapItems addObject:item];
        
    }else{
        [self.privateExpensiveItems addObject:item];
    }
    return item;
}

@end







