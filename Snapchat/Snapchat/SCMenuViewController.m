//
//  SCMenuViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCMenuViewController.h"
#import "SCMenuView.h"
@interface SCMenuViewController ()

@end

@implementation SCMenuViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.view = [[SCMenuView alloc] init];
        ((SCMenuView *)self.view).delegate = self;
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"menu"];
        [tbi setImage:[UIImage imageNamed:@"pikachu"]];
    }
    return self;
}
- (void)displayTabView
{
    self.view.backgroundColor = [UIColor redColor];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
