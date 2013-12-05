//
//  SCCameraViewControlerViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCCameraViewController.h"
#import "SCCameraView.h"
@interface SCCameraViewController ()

@end

@implementation SCCameraViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.view = [[SCCameraView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        ((SCCameraView *)self.view).delegate = self;
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"cameraaaa"];
        [tbi setImage: [UIImage imageNamed:@"pusheen"]];

        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) presentModal: (UIViewController *) modal withAnimation: (BOOL) animation
{
    [self presentViewController:modal animated:animation completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
