//
//  SCCameraView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCCameraView.h"
#import "SCMenuViewController.h"
#import "MHTabBarController.h"
#import "SCPhotoEditingViewController.h"
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
@synthesize isSelfie;
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
    self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 500, 50, 50)];
    [self.menuButton setBackgroundImage:[UIImage imageNamed:@"menu1Big"] forState:UIControlStateNormal];
    //self.menuButton.backgroundColor = [UIColor redColor];
    [self.menuButton addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    self.switchButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 500, 50, 50)];
    [self.switchButton setBackgroundImage:[UIImage imageNamed:@"flipCamera"] forState:UIControlStateNormal];
    //self.switchButton.backgroundColor = [UIColor purpleColor];
    [self.switchButton addTarget:self action:@selector(switchCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    self.snapButton = [[UIButton alloc] initWithFrame:CGRectMake(115, 460, 90, 90)];
    [self.snapButton setBackgroundImage:[UIImage imageNamed:@"cameraCircle"] forState:UIControlStateNormal];
    //self.snapButton.backgroundColor = [UIColor greenColor];
    [self.snapButton addTarget:self action:@selector(takeSnap:) forControlEvents:UIControlEventTouchUpInside];
    self.isSelfie = NO;
        
        self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 430, 320, 20)];
               [self.scroll setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.7f]];
        self.scroll.contentSize = CGSizeMake(390, 20);
        [self.scroll setShowsHorizontalScrollIndicator:NO];
        [self.scroll setShowsVerticalScrollIndicator:NO];
        UILabel *video = [[UILabel alloc]initWithFrame:CGRectMake(210, 0, 50, 20)];
        video.text = @"Video";
        UILabel *photo = [[UILabel alloc]initWithFrame:CGRectMake(135, 0, 50, 20)];
        photo.text = @"Photo";
        photo.textColor = [UIColor grayColor];
        video.textColor = [UIColor grayColor];

        [self.scroll addSubview:photo];
        [self.scroll addSubview:video];
        
    [self addSubview: self.background_image_view];
    [self addSubview:self.menuButton];
    [self addSubview:self.switchButton];
    [self addSubview:self.snapButton];
        [self addSubview:self.scroll];
    }
    return self;
}
- (void)openMenu: (UIButton*) sender
{
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    SCMenuViewController *modal = [[SCMenuViewController alloc]init];
    modal.cameraVC = self.delegate;
    //[tabBarController setViewControllers: @[[[SCCameraViewController alloc]init], modal]];
    ///[tabBarController.tabBar setBackgroundColor:[UIColor greenColor]];
    //[tabBarController.tabBar.subviews[1] removeFromSuperview];
    [delegate presentModal:modal withAnimation:YES];
    
}
- (void)switchCamera:(UIButton*) sender
{
    //change background image
    if (self.isSelfie) {
        self.isSelfie = NO;
        background_image_view.image = [UIImage imageNamed:@"camera image"];
    }
    else {
        self.isSelfie = YES;
        background_image_view.image = [UIImage imageNamed:@"camera image 2"];
    }
}
- (void)takeSnap:(UIButton*) sender
{
    //present editing view controller
    SCPhotoEditingViewController *modal = [[SCPhotoEditingViewController alloc]init];
    modal.cameraVC = self.delegate;
    [delegate presentModal:modal withAnimation:NO];

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
