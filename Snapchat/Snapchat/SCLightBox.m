//
//  SCLightBox.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCLightBox.h"
#import "UIColor+SCColorPalette.h"
@implementation SCLightBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 24, 24)];
        self.exitButton.backgroundColor = [UIColor redColor];
        [self.exitButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: self.exitButton];
        self.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.layer.borderWidth = 2.0f;
        
    }
    return self;
}
- (void)removeFromSuperview
{
    [super removeFromSuperview];
    
}
- (void) dismiss: (UIButton*)sender
{
    [self removeFromSuperview];
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
