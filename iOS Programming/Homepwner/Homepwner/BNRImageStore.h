//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Lucas Pennati on 17.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+(instancetype)sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;

@end
