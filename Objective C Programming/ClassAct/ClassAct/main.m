//
//  main.m
//  ClassAct
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "BNRTowel.h"
NSArray *BNRHierarchyForClass(Class cls){
    //Declare an array to hold the list
    NSMutableArray *classHierarchy = [NSMutableArray array];
    
    //Keep climbing the class hierarchy until we get to a class with no superclass
    for (Class c = cls; c!=nil; c = class_getSuperclass(c)){
        NSString *className = NSStringFromClass(c);
        [classHierarchy insertObject:className atIndex:0];
    }
    return classHierarchy;
}

NSArray *BNRMethodsForClass(Class cls){
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(cls, &methodCount);
    NSMutableArray *methodArray = [NSMutableArray array];
    for (int m=0;m<methodCount;m++){
        //Get the current method
        Method currentMethod = methodList[m];
        //Get the selector for the current method
        SEL methodSelector = method_getName(currentMethod);
        //Add its string representation to the array
        [methodArray addObject:NSStringFromSelector(methodSelector)];
    }
    return methodArray;
}
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //You don't have an object to do the observing, but send the addBoserver: message anyways, to kick off the runtime updates
        BNRTowel *myTowel = [BNRTowel new];
        [myTowel addObserver:nil
                  forKeyPath:@"location"
                     options:NSKeyValueObservingOptionNew
                     context:NULL];
        
        NSMutableArray *runTimeClassesInfo = [NSMutableArray array];
        //Declare a variable to hold the number of registered classes
        unsigned int classCount = 0;
        //umber of registered classes
        Class *classList = objc_copyClassList(&classCount);
        
        //For each class in the list
        for (int i = 0; i<classCount;i++){
            //Treat as C array
            Class currentClass = classList[i];
            
            //Class name as a string
            NSString *className = NSStringFromClass(currentClass);
            
            NSArray *hierarchy = BNRHierarchyForClass(currentClass);
            
            NSArray *methods = BNRMethodsForClass(currentClass);
            
            NSDictionary *classInfoDict = @{ @"classname":className,
                                             @"hierarchy":hierarchy,
                                             @"methods":methods};
            [runTimeClassesInfo addObject:classInfoDict];
        }
        //Free the buffer
        free(classList);
        
        //Sort the classes
        NSSortDescriptor *alphaAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        
        NSArray *sortedArray = [runTimeClassesInfo sortedArrayUsingDescriptors:@[alphaAsc]];
        
        NSLog(@"There are %ld classes registered with this program's Runtime.", sortedArray.count);
        
        NSLog(@"%@", sortedArray);
    }
    return 0;
}

