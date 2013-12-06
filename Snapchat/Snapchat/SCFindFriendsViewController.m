//
//  SCFriendSelectController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCFindFriendsViewController.h"
#import "UIColor+SCColorPalette.h"
#import "SCCameraViewController.h"
#import "SCSelectFriendsViewController.h"
#import "SCSearchBar.h"
@interface SCFindFriendsViewController ()

@end

@implementation SCFindFriendsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tvc = [[SCSearchResultsController alloc]init];
        CGRect frame = self.view.bounds;
        frame.origin.y = 35;
        self.tvc.view.frame = frame;
        self.tvc.tableView.frame = frame;
        //self.tvc.delegate = self.delegate;
        self.bar = [[SCSearchBar alloc]init];
        self.bar.textField.delegate = self;
        [self.view setBackgroundColor: [UIColor whiteColor]];
       // [self.view addSubview:self.tvc.tableView];
        [self.view addSubview:self.bar];
        // Custom initialization
        
}
    return self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self.view addSubview:self.tvc.view];
    return  YES;
}

- (void)returnToCamera
{
    [self presentViewController:[[SCCameraViewController alloc] init] animated:NO completion:nil];
}
- (void)returnToPicture
{
    [self.delegate dismissViewControllerAnimated:NO completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *imgNavLog = [UIImage imageNamed:@"backSmall"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:(imgNavLog) style:UIBarButtonItemStylePlain target:self action:@selector(returnToPicture)];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButton;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
