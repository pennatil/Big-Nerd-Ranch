//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

// implement the instance methods
// costInDollars = purchaseSharePrice * numberOfShares
- (float)costInDollars {
    float i = [self purchaseSharePrice];
    return i * [self numberOfShares];
}

// valueInDollars = currentSharePrice * numberOfShares
- (float)valueInDollars {
    float i = [self currentSharePrice];
    return i * [self numberOfShares];
}

// profit = valueInDollars - costInDollars
- (float)profit {
    float costInDollars = [self costInDollars];
    float valueInDollars = [self valueInDollars];
    return valueInDollars - costInDollars;
}

// addSelfToArray method
- (void)addSelfToArray:(NSMutableArray *)theArray {
    [theArray addObject:self];
}


@end
