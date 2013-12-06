//
//  SCImageView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCImageView.h"

@implementation SCImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"camera image"];
        UIButton *iv = [[UIButton alloc]initWithFrame:frame];
        [iv setImage:image forState:UIControlStateNormal];
        [iv addTarget:self action:@selector(removeFromSuperview:) forControlEvents:UIControlEventTouchUpInside];
        [self setBackgroundColor:[UIColor blackColor]];
        [self addSubview:iv];
    }
    return self;
}
- (void)removeFromSuperview:(UIButton *)sender
{
    [self.delegate finishedViewing];
    [self.delegate dismissViewControllerAnimated:NO completion:nil];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesCancelled:touches withEvent:event];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
