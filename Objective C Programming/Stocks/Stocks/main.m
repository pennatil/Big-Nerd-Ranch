//
//  main.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Initialize the array
        NSMutableArray *stocksArray = [[NSMutableArray alloc] init];
        
        //Create first entry
        BNRStockHolding *firstStock = [[BNRStockHolding alloc] init];
        [firstStock setCurrentSharePrice:4.50];
        [firstStock setPurchaseSharePrice:2.30];
        [firstStock setNumberOfShares:40];
        
        //Create second entry
        BNRStockHolding *secondStock = [[BNRStockHolding alloc] init];
        [secondStock setCurrentSharePrice:10.56];
        [secondStock setPurchaseSharePrice:12.19];
        [secondStock setNumberOfShares:90];
        
        //create third entry
        BNRStockHolding *thirdStock = [[BNRStockHolding alloc] init];
        [thirdStock setCurrentSharePrice:49.51];
        [thirdStock setPurchaseSharePrice:45.10];
        [thirdStock setNumberOfShares:210];
        
        //Add entries to array
        [stocksArray insertObject:firstStock atIndex:0];
        [stocksArray insertObject:secondStock atIndex:1];
        [stocksArray insertObject:thirdStock atIndex:2];
        
        //Loop through the entries in the array
        for (BNRStockHolding *s in stocksArray){
            //print them out one by one
            NSLog(@"\nPurchase Price: %.2f\nCurrent Price: %.2f\nNumber of shares: %d\nCost in dollars: %.2f\nValue in Dollars: %.2f", s.purchaseSharePrice, s.currentSharePrice, s.numberOfShares,s.costInDollars, s.valueInDollars);
        }
        
    }
    return 0;
}

