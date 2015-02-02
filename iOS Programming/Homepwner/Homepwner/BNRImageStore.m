//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Lucas Pennati on 17.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic,strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+(instancetype)sharedStore {
    static BNRImageStore *sharedStore;
    
    if(!sharedStore){
        sharedStore = [[BNRImageStore alloc]initPrivate];
    }
    
    return sharedStore;
}

-(instancetype)init {
    [NSException raise:@"Singleton" format:@"Use +[BNRImageStore sharedStore]"];
    return nil;
}

-(instancetype)initPrivate {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc]init];
        
    }
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key{
    self.dictionary[key]=image;
}

-(UIImage *)imageForKey:(NSString *)key {
    return self.dictionary[key];
}

-(void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}


@end
