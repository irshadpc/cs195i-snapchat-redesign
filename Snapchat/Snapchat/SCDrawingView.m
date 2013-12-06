//
//  SCDrawingView.m
//  Snapchat
//
//  Created by Jake Kaufman on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCDrawingView.h"
@implementation SCDrawingView
{
    UIBezierPath *path; // (3)
}
@synthesize drawingOn;
@synthesize drawColor;
- (id)initWithFrame:(CGRect)frame// (1)
{
    if (self = [super initWithFrame:frame])
    {
        [self setMultipleTouchEnabled:NO]; // (2)
        [self setBackgroundColor:[UIColor clearColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:5.0];
        self.drawColor = [UIColor redColor];
        self.drawingOn = YES;
    }
    return self;
}
- (void)drawRect:(CGRect)rect // (5)
{
    [self.drawColor setStroke];
    [path stroke];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (drawingOn) {
        UITouch *touch = [touches anyObject];
        CGPoint p = [touch locationInView:self];
        [path moveToPoint:p];
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (drawingOn) {
        UITouch *touch = [touches anyObject];
        CGPoint p = [touch locationInView:self];
        [path addLineToPoint:p]; // (4)
        [self setNeedsDisplay];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}
@end
