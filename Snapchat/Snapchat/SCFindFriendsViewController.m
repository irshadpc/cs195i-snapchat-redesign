//
//  SCFindFriendsViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCFindFriendsViewController.h"
#import "SCSearchBar.h"
@interface SCFindFriendsViewController ()

@end

@implementation SCFindFriendsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        SCSearchBar *searchbar = [[SCSearchBar alloc]init];
        [searchbar setDelegate:self];
        [self.view addSubview:searchbar];
        [self.view setBackgroundColor:[UIColor whiteColor]];
        //[self.view setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *imgNavLog = [UIImage imageNamed:@"starBullet"];
    UIBarButtonItem *left= [[UIBarButtonItem alloc] initWithImage:(imgNavLog) style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    left.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = left;

	// Do any additional setup after loading the view.
}
- (void)dismiss
{
    [self.delegate dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
