//
//  SCReturnCameraViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCReturnCameraViewController.h"

@interface SCReturnCameraViewController ()

@end

@implementation SCReturnCameraViewController

- (id)init{
    UITabBarItem *tbi = [self tabBarItem];
    [tbi setTitle: @"camera"];
    [tbi setImage: [UIImage imageNamed:@"pusheen"]];
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.menu dismissTableView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end