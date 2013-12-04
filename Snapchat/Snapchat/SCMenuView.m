//
//  SCMenuView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCMenuView.h"
#import "SCCameraViewController.h"
#import "SCSettingsViewController.h"
#import "SCReturnCameraViewController.h"
@implementation SCMenuView
@synthesize messages;
@synthesize camera;
@synthesize friends;
@synthesize settings;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        self.messages = [[UIButton alloc] initWithFrame:CGRectMake(60, 184, 80, 80)];
        self.messages.backgroundColor = [UIColor purpleColor];
        [self.messages addTarget:self action:@selector(messagePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.camera = [[UIButton alloc] initWithFrame:CGRectMake(60, 304, 80, 80)];
        self.camera.backgroundColor = [UIColor blueColor];
        [self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.friends = [[UIButton alloc] initWithFrame:CGRectMake(180, 184, 80, 80)];
        self.friends.backgroundColor = [UIColor orangeColor];
        [self.friends addTarget:self action:@selector(friendsPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.settings = [[UIButton alloc] initWithFrame:CGRectMake(180, 304, 80, 80)];
        self.settings.backgroundColor = [UIColor whiteColor];
        [self.settings addTarget:self action:@selector(settingsPressed:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:messages];
        [self addSubview:camera];
        [self addSubview:friends];
        [self addSubview:settings];
        
        self.tbc = [[UITabBarController alloc] init];
        SCReturnCameraViewController *cam = [[SCReturnCameraViewController alloc]init];
        cam.menu = self.delegate;
        [self.tbc setViewControllers: @[[[SCCameraViewController alloc]init], [[SCCameraViewController alloc]init], cam, [[SCSettingsViewController alloc]init] ]];
        [self.tbc.tabBar setBackgroundColor:[UIColor greenColor]];
        
    }
    return self;
}
- (void)messagePressed: (UIButton *) sender
{
    NSLog(@"message selected");
    self.tbc.selectedIndex = 0;
    [self.delegate presentVC:self.tbc];
   
}
- (void)cameraPressed: (UIButton *) sender
{
    NSLog(@"camera selected");
    self.tbc.selectedIndex = 1;
    [self.delegate presentVC:self.tbc];

}
- (void)friendsPressed: (UIButton *) sender
{
    NSLog(@"friends selected");
    self.tbc.selectedIndex = 2;

    [self.delegate presentVC:self.tbc];

}
- (void)settingsPressed: (UIButton *) sender
{
    NSLog(@"settings selected");
    self.tbc.selectedIndex = 3;

    [self.delegate presentVC:self.tbc];

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
