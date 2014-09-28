//
//  BNRStockHolding.h
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject
{
    float _purchaseSharePrice;
    float _currentSharePrice;
    int _numberOfShares;
}
//Getters
- (float)purchaseSharePrice;
- (float)currentSharePrice;
- (int)numberOfShares;
//Setters
- (void)setPurchaseSharePrice:(float)pp;
- (void)setCurrentSharePrice:(float)cp;
- (void)setNumberOfShares:(int)n;
//Extra
- (float)costInDollars; //purchaseSharePrice * numberOfShares
- (float)valueInDollars; //currentSharePrice * numberOfShares

@end
