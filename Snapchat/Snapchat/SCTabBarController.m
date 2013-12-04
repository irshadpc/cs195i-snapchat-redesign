//
//  SCTabBarController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCTabBarController.h"
#define SELECTED_VIEW_CONTROLLER_TAG 98456345
#import "SCCameraViewController.h"
@interface SCTabBarController ()

@end

@implementation SCTabBarController

- (id)init
{
    self = [super init];
    if (self) {
        self.tabBar = [[SCTabBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        [self.tabBar addButtonWithSelectedImage:[UIImage imageNamed:@"pusheen"] unselectedImage:[UIImage imageNamed:@"pikachu"] delegate: self andViewController:[[SCCameraViewController alloc] init]];
        
        [self.tabBar addButtonWithSelectedImage:[UIImage imageNamed:@"pikachu"] unselectedImage:[UIImage imageNamed:@"pusheen"] delegate: self andViewController:[[SCCameraViewController alloc] init]];
        
        [self.tabBar addButtonWithSelectedImage:[UIImage imageNamed:@"pusheen"] unselectedImage:[UIImage imageNamed:@"pikachu"] delegate: self andViewController:[[SCCameraViewController alloc] init]];
        
        [self.tabBar addButtonWithSelectedImage:[UIImage imageNamed:@"pusheen"] unselectedImage:[UIImage imageNamed:@"pusheen"] delegate: self andViewController:[[SCCameraViewController alloc] init]];
        self.view = self.tabBar;
        [self.view addSubview:self.tabBar];
        // Custom initialization
    }
    return self;
}
- (void)presentVC:(UIViewController *)viewController
{
    NSLog(@"kdlsjfldksjfjld");
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    // Set the view controller's frame to account for the tab bar
    viewController.view.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height-self.tabBar.frame.size.height*2);
    
    // Se the tag so we can find it later
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    
    // Add the new view controller's view
    [self.view insertSubview:viewController.view belowSubview:self.tabBar];
    
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBar addButtons];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
