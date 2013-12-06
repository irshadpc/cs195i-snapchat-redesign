//
//  SCNewGroupBox.m
//  Snapchat
//
//  Created by Jessica Liang on 12/6/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCNewGroupBox.h"
#import "UIColor+SCColorPalette.h"
#import "SCFriendSelectController.h"
@implementation SCNewGroupBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        [self.exitButton setBackgroundImage:[UIImage imageNamed:@"greyX"] forState:UIControlStateNormal];
        //self.exitButton.backgroundColor = [UIColor redColor];
        [self.exitButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.layer.borderWidth = 2.0f;

        self.name = [[UITextField alloc] initWithFrame:CGRectMake(30,10,200,30)];
        self.name.textAlignment = UITextAlignmentCenter;
        self.name.delegate = self;
        
        self.addButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 50, 200, 30)];

        [self.addButton setTitle:@"Add Friend" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        [self.addButton addTarget:self action:@selector(addFriends) forControlEvents:UIControlEventTouchUpInside];
        self.addButton.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.addButton.layer.borderWidth = 1.0f;
        
        self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 200, 30)];
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
        [self.saveButton setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        [self.saveButton addTarget:self action:@selector(displayFeedback) forControlEvents:UIControlEventTouchUpInside];
        self.saveButton.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.saveButton.layer.borderWidth = 1.0f;
        
        [self addSubview:self.addButton];
        [self addSubview: self.saveButton];
        [self addSubview: self.name];
        [self addSubview:self.exitButton];
    }
    return self;
}
- (void) dismiss: (UIButton*)sender
{
    [self removeFromSuperview];
}
- (void)addFriends
{
    SCFriendSelectController *vc = [[SCFriendSelectController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar.topItem setTitle:@"Add friends to Group" ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [nav.navigationBar setTranslucent:NO];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
    vc.delegate = self.delegate;
    
    vc.goButton = @"Save";
    [self.delegate presentVC: nav];
    [self removeFromSuperview];
}
- (void)displayFeedback
{
    UILabel *feedback = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 240, 30)];
    feedback.textColor = [UIColor whiteColor];
    feedback.textAlignment = UITextAlignmentCenter;
    [feedback setText:@"New group saved!"];
    [feedback setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.7f]];
    [self addSubview:feedback];
    feedback.alpha = 1.0f;
    [UIView animateWithDuration:20.0
                          delay:20.0 options:nil
                     animations:^{
                         feedback.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              feedback.alpha = 0;
                                          }
                                          completion:^(BOOL finished){
                                              [feedback removeFromSuperview];
                                          }];
                     }];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
