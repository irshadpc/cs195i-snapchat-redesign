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
#import "SCFriendsTableViewController.h"
#import "SCGroupTableViewController.h"
#import "SCRequestsTableViewController.h"
#import "UIColor+SCColorPalette.h"
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
        [self setBackgroundColor:[UIColor darkGreenColor]];

        self.messages = [[UIButton alloc] initWithFrame:CGRectMake(60, 184, 80, 80)];
        //self.messages.backgroundColor = [UIColor purpleColor];
        [self.messages setBackgroundImage:[UIImage imageNamed:@"messages"] forState:UIControlStateNormal];
        [self.messages addTarget:self action:@selector(messagePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.camera = [[UIButton alloc] initWithFrame:CGRectMake(60, 304, 80, 80)];
        [self.camera setBackgroundImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        //elf.camera.backgroundColor = [UIColor blueColor];
        [self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.friends = [[UIButton alloc] initWithFrame:CGRectMake(180, 184, 80, 80)];
        //self.friends.backgroundColor = [UIColor orangeColor];
        [self.friends setBackgroundImage:[UIImage imageNamed:@"friends"] forState:UIControlStateNormal];
        [self.friends addTarget:self action:@selector(friendsPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.settings = [[UIButton alloc] initWithFrame:CGRectMake(180, 304, 80, 80)];
        //self.settings.backgroundColor = [UIColor whiteColor];
        [self.settings setBackgroundImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
        [self.settings addTarget:self action:@selector(settingsPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.exit = [[UIButton alloc] initWithFrame:CGRectMake(15, 30, 30, 30)];
        [self.exit setBackgroundImage:[UIImage imageNamed:@"greyX"] forState:UIControlStateNormal]; // or cancel
        [self.exit addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:messages];
        [self addSubview:camera];
        [self addSubview:friends];
        [self addSubview:settings];
        [self addSubview:self.exit];
        
        self.tbc = [[UITabBarController alloc] init];
        SCReturnCameraViewController *cam = [[SCReturnCameraViewController alloc]init];
        cam.menu = self.delegate;
        SCMessageTableViewController *tbvc = [[SCMessageTableViewController alloc] init];
        UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:tbvc];
        [messageNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
        UIView* separatorLineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
        separatorLineView1.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
        [messageNav.navigationBar addSubview:separatorLineView1];

        [messageNav.navigationBar.topItem setTitle:@"Messages" ];
        [messageNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        messageNav.navigationBar.translucent = NO;

        UINavigationController *settingsNav = [[UINavigationController alloc] initWithRootViewController:[[SCSettingsViewController alloc] init] ];
        [settingsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
        [settingsNav.navigationBar.topItem setTitle:@"Settings" ];
        [settingsNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        //settingsNav.navigationBar.translucent = NO;
        UIView* separatorLineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
        separatorLineView1.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
        [settingsNav.navigationBar addSubview:separatorLineView2];
        [settingsNav.navigationBar addSubview:separatorLineView2];

        SCRequestsTableViewController *listViewController1 = [[SCRequestsTableViewController alloc] init];
        SCFriendsTableViewController *listViewController2 = [[SCFriendsTableViewController alloc] init];
        SCGroupTableViewController *listViewController3 = [[SCGroupTableViewController alloc] init];
        
        
        listViewController1.title = @"Requests";
        listViewController2.title = @"Friends";
        listViewController3.title = @"Groups";
        
        
        
        NSArray *viewControllers = @[listViewController1, listViewController2, listViewController3];
        MHTabBarController *friendsTab = [[MHTabBarController alloc] init];

        friendsTab.delegate = self.delegate;
        friendsTab.viewControllers = viewControllers;
        friendsTab.selectedIndex = 1;

        UINavigationController *friendsNav = [[UINavigationController alloc] initWithRootViewController: friendsTab];
        [friendsNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
        [friendsNav.navigationBar.topItem setTitle:@"Contacts"];
        [friendsNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        friendsNav.navigationBar.translucent = NO;
        [self.tbc setViewControllers: @[messageNav, cam, friendsNav, settingsNav]];
        UIImage *tabBarBackground = [UIImage imageNamed:@"tabBackground"];
        UIView* separatorLineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
        separatorLineView1.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
        [friendsNav.navigationBar addSubview:separatorLineView3];
        [friendsNav.navigationBar addSubview:separatorLineView3];

       // [self.tbc.tabBar setBackgroundColor:[UIColor greenColor]];
        [[UITabBar appearance] setBackgroundImage:tabBarBackground];
        [[UITabBar appearance] setTintColor:[UIColor lightGreenColor]];
        [self.tbc.tabBar setSelectedImageTintColor: [UIColor redColor]];
        //[[UITabBar appearance] setTintColor:[UIColor redColor]];
        
       
        

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
    [self.delegate dismissViewControllerAnimated:YES completion:nil];

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
