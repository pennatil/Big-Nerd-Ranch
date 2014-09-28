//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)purchaseSharePrice
{
    return _purchaseSharePrice;
}

- (float)currentSharePrice
{
    return _currentSharePrice;
}

-(int)numberOfShares
{
    return _numberOfShares;
}

- (void)setNumberOfShares:(int)n
{
    _numberOfShares = n;
}

-(void)setPurchaseSharePrice:(float)pp
{
    _purchaseSharePrice = pp;
}

-(void)setCurrentSharePrice:(float)cp
{
    _currentSharePrice = cp;
}

- (float)costInDollars
{
    return _purchaseSharePrice * _numberOfShares;
}

- (float)valueInDollars
{
    return _currentSharePrice * _numberOfShares;
}
@end
