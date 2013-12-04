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
#import "SCMessageTableViewController.h"
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
        SCMessageTableViewController *tbvc = [[SCMessageTableViewController alloc] init];
        UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:tbvc];
        [messageNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBackground"] forBarMetrics:UIBarMetricsDefault];
        [messageNav.navigationBar.topItem setTitle:@"Messages" ];
        UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:[[SCSettingsViewController alloc] init] ];
        [settingsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBackground"] forBarMetrics:UIBarMetricsDefault];
        [settingsNav.navigationBar.topItem setTitle:@"Settings" ];

        SCMessageTableViewController *listViewController1 = [[SCMessageTableViewController alloc] init];
        SCMessageTableViewController *listViewController2 = [[SCMessageTableViewController alloc] init];
        SCMessageTableViewController *listViewController3 = [[SCMessageTableViewController alloc] init];
        
        listViewController1.title = @"Requests";
        listViewController2.title = @"Friends";
        listViewController3.title = @"Groups";
        
        
        NSArray *viewControllers = @[listViewController1, listViewController2, listViewController3];
        MHTabBarController *tabBarController = [[MHTabBarController alloc] init];

        tabBarController.delegate = self.delegate;
        tabBarController.viewControllers = viewControllers;
        tabBarController.selectedIndex = 1;

        UINavigationController *friendsNav = [[UINavigationController alloc] initWithRootViewController: tabBarController];
        [friendsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBackground"] forBarMetrics:UIBarMetricsDefault];
        [friendsNav.navigationBar.topItem setTitle:@"Friends"];

        [self.tbc setViewControllers: @[messageNav, cam, friendsNav, settingsNav]];
        UIImage *tabBarBackground = [UIImage imageNamed:@"tabBackground"];
        
        [self.tbc.tabBar setBackgroundColor:[UIColor greenColor]];
        [[UITabBar appearance] setBackgroundImage:tabBarBackground];
        [[UITabBar appearance] setTintColor:[UIColor redColor]];
        

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
