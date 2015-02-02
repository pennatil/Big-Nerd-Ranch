//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Lucas Pennati on 18.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"
#define CC_RADIANS_TO_DEGREES(__ANGLE__) ((__ANGLE__) * 57.29577951f) // PI * 180
@interface BNRDrawView ()

@property (nonatomic,strong) NSMutableDictionary *linesInProgress;
@property (nonatomic,strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

-(instancetype)initWithFrame:(CGRect)r {
    self = [super initWithFrame:r];
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc]init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

-(void) strokeLine:(BNRLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}


-(void)drawRect:(CGRect)rect {
    [[UIColor blackColor]set];
    for (BNRLine *line in self.finishedLines){
        //get the angle between the two points
        CGFloat deltaX = abs(line.end.x -line.begin.x);
        CGFloat deltaY = abs(line.end.y - line.begin.y);
        CGFloat endAngle = CC_RADIANS_TO_DEGREES(atan(deltaY/deltaX));
        //set the color depending on the angle. This can be expanded to accomodate more options
        if (endAngle >=45.0) {
            [[UIColor blueColor]set];
        } else {
            [[UIColor greenColor]set];
        }
        
        [self strokeLine:line];
        
    }
    
    [[UIColor redColor]set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches){
        CGPoint location = [t locationInView:self];
        
        BNRLine *line = [[BNRLine alloc]init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView:self];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        
        
        
        [self.linesInProgress removeObjectForKey:key];
        
    }

    
    [self setNeedsDisplay];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}
@end
