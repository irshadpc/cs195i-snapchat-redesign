//
//  SCPhotoEditingView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCPhotoEditingView.h"

@implementation SCPhotoEditingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        UIImage *background_image =  [UIImage imageNamed:@"camera image"];
        UIImageView *background_image_view = [[UIImageView alloc] initWithImage:background_image];
        [self addSubview:background_image_view];
        UIButton *exitButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, 24, 24)];
        [exitButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        //exitButton.backgroundColor = [UIColor redColor];
        [exitButton addTarget:self action:@selector(returnToCamera:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:exitButton];
        UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(width - 100, height - 40, 80, 30)];
        [sendButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        //[sendButton setBackgroundColor:[UIColor greenColor]];
        [self addSubview:sendButton];
    }
    return self;
}
- (void) returnToCamera:(UIButton *) sender
{
    [self.delegate returnToCamera];
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
