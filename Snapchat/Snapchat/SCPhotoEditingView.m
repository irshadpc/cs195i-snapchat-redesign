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
@synthesize drawToggleButton;
@synthesize undoButton;
@synthesize whiteToggleButton;
@synthesize redToggleButton;
@synthesize colorPallet;
@synthesize saveButton;
@synthesize timeButton;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        UIImage *background_image =  [UIImage imageNamed:@"camera image"];
        UIImageView *background_image_view = [[UIImageView alloc] initWithImage:background_image];
        [self addSubview:background_image_view];
        UIButton *exitButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 24, 24)];
        [exitButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        //exitButton.backgroundColor = [UIColor redColor];
        [exitButton addTarget:self action:@selector(returnToCamera:) forControlEvents:UIControlEventTouchUpInside];
        self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 85, 30, 30, 30)];
        [self.saveButton setBackgroundImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
        self.timeButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 40, 30, 30, 30)];
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"timer3"] forState:UIControlStateNormal];
        UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(width - 90, height - 40, 80, 30)];
        [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [sendButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        self.drawToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10, height - 40, 30, 30)];
        [self.drawToggleButton setBackgroundImage:[UIImage imageNamed:@"selectColor"] forState:UIControlStateNormal];
        self.undoButton = [[UIButton alloc] initWithFrame:CGRectMake(10, height - 70, 30, 30)];
        [self.undoButton setBackgroundImage:[UIImage imageNamed:@"undo"] forState:UIControlStateNormal];
        self.colorPallet = [[UIImageView alloc] initWithFrame:CGRectMake(50, height - 70, 120, 60)];
        self.redToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(50, height - 70, 60, 60)];
        [self.redToggleButton setBackgroundColor:[UIColor whiteColor]];
        self.whiteToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(110, height - 70, 60, 60)];
        [self.whiteToggleButton setBackgroundColor:[UIColor redColor]];
        self.drawingview = [[SCDrawingView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        [self addSubview:self.drawingview];
        [self addSubview:self.colorPallet];
        [self addSubview:exitButton];
        [self addSubview:sendButton];
        [self addSubview:undoButton];
        [self addSubview:timeButton];
        [self addSubview:saveButton];
        [self addSubview:drawToggleButton];
        [self addSubview:undoButton];
        [self addSubview:whiteToggleButton];
        [self addSubview:redToggleButton];
    }
    return self;
}
- (void) send: (UIButton *)sender
{
    SCSelectFriendsViewController *s = [[SCSelectFriendsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:s];
    [nav.navigationBar.topItem setTitle:@"Send to..." ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
    s.delegate = self.delegate;
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
