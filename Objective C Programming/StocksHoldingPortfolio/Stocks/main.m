//
//  main.m
//  Stocks
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // Create BNRPortfolio object to hold the stocks.
        BNRPortfolio *myPortfolio = [[BNRPortfolio alloc] init];
        
        // (1) Create instances of BNRStockHolding objects
        // (2) Give values to object's instance variables
        // (3) Add to my portfolio
        
        BNRStockHolding *apple = [[BNRStockHolding alloc] init];
        
        apple.purchaseSharePrice = 2.30;
        apple.currentSharePrice = 500;
        apple.numberOfShares = 1500;
        apple.stockName = @"APPLE";
        [myPortfolio addToPortfolio:apple];
        
        BNRStockHolding *google = [[BNRStockHolding alloc] init];
        
        google.purchaseSharePrice = 15.43;
        google.currentSharePrice = 500;
        google.numberOfShares = 1500;
        google.stockName = @"GOOGL";
        [myPortfolio addToPortfolio:google];
        
        BNRStockHolding *facebook = [[BNRStockHolding alloc] init];
        
        facebook.purchaseSharePrice = 30.50;
        facebook.currentSharePrice = 800;
        facebook.numberOfShares = 1500;
        facebook.stockName = @"FCBOK";
        [myPortfolio addToPortfolio:facebook];
        
        // (1) Create instances of BNRForeignStockHolding objects
        // (2) Give values to object's instance variables
        // (3) Add to my portfolio
        
        BNRForeignStockHolding *kakaoTalk = [[BNRForeignStockHolding alloc] init];
        
        kakaoTalk.purchaseSharePrice = 15000;
        kakaoTalk.currentSharePrice = 30000;
        kakaoTalk.numberOfShares = 400;
        kakaoTalk.stockName = @"KAKAO";
        kakaoTalk.conversionRate = 0.000973;
        [myPortfolio addToPortfolio:kakaoTalk];
        
        BNRForeignStockHolding *daum = [[BNRForeignStockHolding alloc] init];
        
        daum.purchaseSharePrice = 30000;
        daum.currentSharePrice = 50000;
        daum.numberOfShares = 600;
        daum.stockName = @"DAUM";
        daum.conversionRate = 0.000973;
        [myPortfolio addToPortfolio:daum];
        
        BNRForeignStockHolding *naver = [[BNRForeignStockHolding alloc] init];
        
        naver.purchaseSharePrice = 50000;
        naver.currentSharePrice = 70000;
        naver.numberOfShares = 300;
        naver.stockName = @"NAVER";
        naver.conversionRate = 0.000973;
        [myPortfolio addToPortfolio:naver];
        
        // Iterate though arrays and print the values
        
        for (BNRStockHolding *i in myPortfolio.holdings) {
            // declare local variables
            float purchasedAt = [i costInDollars];
            float currentValue = [i valueInDollars];
            float profit = [i profit];
            NSString *name = [i stockName];
            NSLog(@"\nStock: %@\nPurchased Price: %.2f\nCurrent Value: %.2f\nProfit: %.2f\n", name, purchasedAt, currentValue, profit);
        }
        
        // Print the total value of stocks in my portfolio
        
        NSLog(@"\n%@", myPortfolio);
        
    }
    return 0;
}