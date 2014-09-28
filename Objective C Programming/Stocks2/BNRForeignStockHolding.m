//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding
- (float)costInDollars
{
    float normalCostInDollars = [super costInDollars];
    return normalCostInDollars * _conversionRate;
}

- (float)valueInDollars
{
    float normalValueInDollars = [super valueInDollars];
    return normalValueInDollars * _conversionRate;
}
@end
