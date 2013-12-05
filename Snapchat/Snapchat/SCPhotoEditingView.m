//
//  SCPhotoEditingView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCPhotoEditingView.h"
#import "SCSelectFriendsViewController.h"
#import "UIColor+SCColorPalette.h"
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
        exitButton.backgroundColor = [UIColor redColor];
        [exitButton addTarget:self action:@selector(returnToCamera:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:exitButton];
        UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(width - 100, height - 40, 80, 30)];
        [sendButton setBackgroundColor:[UIColor greenColor]];
        [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendButton];
    }
    return self;
}
- (void) send: (UIButton *)sender
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SCSelectFriendsViewController alloc] init]];
    [nav.navigationBar.topItem setTitle:@"Send to..." ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];

    [self.delegate presentVC: nav];
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
