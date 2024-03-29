//
//  SCFriendSelectController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCFriendSelectController.h"
#import "UIColor+SCColorPalette.h"
#import "SCCameraViewController.h"
@interface SCFriendSelectController ()
{
    NSString *_goButton;
}
@end

@implementation SCFriendSelectController

- (id)init
{
    self = [super init];
    if (self) {
        self.tvc = [[SCSelectFriendsViewController alloc]init];
        CGRect frame = self.view.bounds;
        frame.size.height = frame.size.height - 44;
        self.tvc.view.frame = frame;
        self.tvc.tableView.frame = frame;
        self.tvc.delegate = self.delegate;
        self.bar = [[UIView alloc] initWithFrame:CGRectMake(0,568-44- 20- 44, 320, 44)];
        self.bar.backgroundColor = [UIColor darkGreenColor];
        self.sendButton = [[UIButton alloc]initWithFrame:CGRectMake(320-70, 5, 60, 34)];
        [self.sendButton setTitle:self.goButton forState:UIControlStateNormal];
        [self.sendButton addTarget:self action:@selector(returnToCamera) forControlEvents:UIControlEventTouchUpInside];
        [self.bar addSubview:self.sendButton];
        self.sendButton.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.sendButton.layer.borderWidth = 1.0f;
        [self.view addSubview:self.tvc.tableView];
        [self.view addSubview:self.bar];
        // Custom initialization
    }
    return self;
}
- (void)setGoButton:(NSString *)goButton
{
    _goButton = goButton;
    [self.sendButton setTitle:_goButton forState:UIControlStateNormal];
}
- (id)initWithOutGroup: (SCGroup *)group
{
    self = [super init];
    if (self) {
        self.tvc = [[SCSelectFriendsViewController alloc]initWithoutGroup:group];
        CGRect frame = self.view.bounds;
        frame.size.height = frame.size.height - 44;
        self.tvc.view.frame = frame;
        self.tvc.tableView.frame = frame;
        self.tvc.delegate = self.delegate;
        self.bar = [[UIView alloc] initWithFrame:CGRectMake(0,568-44- 20- 44, 320, 44)];
        self.bar.backgroundColor = [UIColor darkGreenColor];
        UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(320-70, 5, 60, 34)];
        [sendButton setTitle:self.goButton forState:UIControlStateNormal];
        [sendButton addTarget:self action:@selector(returnToCamera) forControlEvents:UIControlEventTouchUpInside];
        [self.bar addSubview:sendButton];
        sendButton.layer.borderColor = [UIColor lightGreenColor].CGColor;
        sendButton.layer.borderWidth = 1.0f;
        [self.view addSubview:self.tvc.tableView];
        [self.view addSubview:self.bar];
        // Custom initialization
    }
    return self;
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
