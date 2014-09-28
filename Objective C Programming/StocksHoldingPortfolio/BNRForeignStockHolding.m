//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

// Override the instance methods to consider conversion rate (costInDollars and valueInDollars)

// costInDollars = (purchaseSharePrice * numberOfShares) * conversionRate
- (float)costInDollars {
    float purchasedPrice = [super costInDollars];
    float conversionRate = [self conversionRate];
    return purchasedPrice * conversionRate;
}

// valueInDollars = (currentSharePrice * numberOfShares) * conversionRate
- (float)valueInDollars {
    float currentValue = [super valueInDollars];
    return currentValue * [self conversionRate];
}


@end
