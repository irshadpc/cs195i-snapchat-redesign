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
    UIBezierPath *path;
    UIImage *incrementalImage; // (1)
}
@synthesize drawingOn;
@synthesize drawColor;
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor clearColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:5.0];
        drawingOn = NO;
        drawColor = [UIColor redColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    [drawColor setStroke];
    [incrementalImage drawInRect:rect]; // (3)
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
        [path addLineToPoint:p];
        [self setNeedsDisplay];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event // (2)
{
    if (drawingOn) {
        UITouch *touch = [touches anyObject];
        CGPoint p = [touch locationInView:self];
        [path addLineToPoint:p];
        [self drawBitmap]; // (3)
        [self setNeedsDisplay];
        [path removeAllPoints]; //(4)
    }
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}
- (void)drawBitmap // (3)
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [drawColor setStroke];
    if (!incrementalImage) // first draw; paint background white by ...
    {
        UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:self.bounds]; // enclosing bitmap by a rectangle defined by another UIBezierPath object
        [[UIColor clearColor] setFill];
        [rectpath fill]; // filling it with white
    }
    [incrementalImage drawAtPoint:CGPointZero];
    [path stroke];
    incrementalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
@end
