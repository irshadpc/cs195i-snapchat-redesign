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
      
    }
    return self;
}
- (void)presentVC: (UIViewController *)viewController;
{
    [self presentViewController:viewController animated:YES completion:Nil];
}
- (void)dismissTableView
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.cameraVC dismissViewControllerAnimated:YES completion:nil];
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
