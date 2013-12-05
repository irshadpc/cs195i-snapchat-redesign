//
//  SCPhotoEditingViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCPhotoEditingViewController.h"
#import "SCPhotoEditingView.h"
@interface SCPhotoEditingViewController ()

@end

@implementation SCPhotoEditingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view = [[SCPhotoEditingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        ((SCPhotoEditingView*)self.view).delegate = self;
    }
    return self;
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
- (void) presentVC:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:NO completion:Nil];
}
- (void)returnToCamera
{
    [self.cameraVC dismissViewControllerAnimated:NO completion:Nil];
}
@end
