//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Lucas Pennati on 03.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRStockHolding.h"

@interface BNRPortfolio : BNRStockHolding

{
    NSMutableArray *_holdings;
}

@property (nonatomic,copy) NSArray *holdings;

- (void) addToPortfolio:(BNRStockHolding *)a;
- (float)totalValue;

@end
