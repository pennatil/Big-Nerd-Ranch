//
//  BNRAppliance.h
//  Appliances
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BNRAppliance : NSObject
{
    NSString *_productName;
}

@property (nonatomic) int voltage;
//@property (nonatomic, copy) NSString *productName;

//Designated Initializer
- (instancetype)initWithProductName:(NSString *)pn;
@end
