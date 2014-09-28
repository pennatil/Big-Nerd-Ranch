//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Lucas Pennati on 03.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRPortfolio.h"

#import "BNRPortfolio.h"

@implementation BNRPortfolio

// setter method for - @property (nonatomic, copy) NSArray *portfolio;
- (void)setHoldings:(NSArray *)a
{
    _holdings = [a mutableCopy];
}

// getter method for - @property (nonatomic, copy) NSArray *portfolio;
- (NSArray *)holdings
{
    return [_holdings copy];
}

- (void)addToPortfolio:(BNRStockHolding *)a
{
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
    }
    [_holdings addObject:a];
}

- (float)totalValue
{
    float sum = 0.0;
    for (BNRStockHolding *a in _holdings)
    {
        sum += [a valueInDollars];
    }
    return sum;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"The total value of my portfolio is %.2f", self.totalValue];
}

@end
