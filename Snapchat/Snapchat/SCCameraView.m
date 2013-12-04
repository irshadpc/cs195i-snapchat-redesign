//
//  SCCameraView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCCameraView.h"
#import "SCMenuViewController.h"
#import "SCTabBarController.h"
#import "MHTabBarController.h"
@interface SCCameraView ()
{
    BOOL backCamera;
}
@end

@implementation SCCameraView
@synthesize background_image_view;
@synthesize menuButton;
@synthesize switchButton;
@synthesize snapButton;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    backCamera = true;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    NSLog(@"Width: %f, Height: %f", [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIImage *background_image =  [UIImage imageNamed:@"camera image"];
    self.background_image_view = [[UIImageView alloc] initWithImage:background_image];
    self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 518, 30, 30)];
    self.menuButton.backgroundColor = [UIColor redColor];
    [self.menuButton addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    self.switchButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 518, 30, 30)];
    self.switchButton.backgroundColor = [UIColor purpleColor];
    [self.switchButton addTarget:self action:@selector(switchCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    self.snapButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 488, 60, 60)];
    self.snapButton.backgroundColor = [UIColor greenColor];
    [self.snapButton addTarget:self action:@selector(switchCamera:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview: self.background_image_view];
    [self addSubview:self.menuButton];
    [self addSubview:self.switchButton];
    [self addSubview:self.snapButton];
    }
    return self;
}
- (void)openMenu: (UIButton*) sender
{
    sender.backgroundColor = [UIColor blueColor];
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    SCMenuViewController *modal = [[SCMenuViewController alloc]init];
    modal.cameraVC = self.delegate;
    //[tabBarController setViewControllers: @[[[SCCameraViewController alloc]init], modal]];
    ///[tabBarController.tabBar setBackgroundColor:[UIColor greenColor]];
    //[tabBarController.tabBar.subviews[1] removeFromSuperview];
    [delegate presentModal:modal];
    
}
- (void)switchCamera:(UIButton*) sender
{
    //change background image
    sender.backgroundColor = [UIColor blueColor];
}
- (void)takeSnap:(UIButton*) sender
{
    //present editing view controller
    sender.backgroundColor = [UIColor blueColor];
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
