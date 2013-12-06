//
//  SCGroupLightBox.m
//  Snapchat
//
//  Created by Jake Kaufman on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCGroupLightBox.h"
#import "UIColor+SCColorPalette.h"
#import "SCFriend.h"
#import "SCFriendSelectController.h"
@interface SCGroupLightBox()
{
    SCGroup * _selectedgroup;
}
@end
@implementation SCGroupLightBox
@synthesize selectedgroup;
@synthesize exitButton;
@synthesize editButton;
@synthesize addButton;
@synthesize deleteButton;
@synthesize name;
@synthesize members;
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        [self.exitButton setBackgroundImage:[UIImage imageNamed:@"greyX"] forState:UIControlStateNormal];
        [self.exitButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(30,10,200,30)];
        self.name.textColor = [UIColor darkGreenColor];
        self.name.textAlignment = UITextAlignmentCenter;
        
        self.editButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 50, 72, 30)];
        self.editButton.backgroundColor = [UIColor clearColor];
        self.editButton.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.editButton.layer.borderWidth = 1;
        self.editButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.editButton setTitle:@"Edit Name" forState:UIControlStateNormal];
        [self.editButton setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        
        self.addButton = [[UIButton alloc] initWithFrame:CGRectMake(177, 50, 72, 30)];
        self.addButton.backgroundColor = [UIColor clearColor];
        self.addButton.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.addButton.layer.borderWidth = 1;
        self.addButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.addButton setTitle:@"Add Friend" forState:UIControlStateNormal];
        [self.addButton setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        [self.addButton addTarget:self action:@selector(addFriends) forControlEvents:UIControlEventTouchUpInside];
        
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 50, 72, 30)];
        self.deleteButton.backgroundColor = [UIColor clearColor];
        self.deleteButton.layer.borderColor = [UIColor darkGreenColor].CGColor;
        self.deleteButton.layer.borderWidth = 1;
        self.deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
        [self.deleteButton setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        [self.deleteButton addTarget:self action:@selector(deleteGroup:) forControlEvents:UIControlEventTouchUpInside];
        self.members = [[UILabel alloc] initWithFrame:CGRectMake(11,90,250,20)];
        self.members.text = @"Members";
        
    }
    [self addSubview:editButton];
    [self addSubview:deleteButton];
    [self addSubview:addButton];
    [self addSubview:name];
    [self addSubview:members];
    [self addSubview: self.exitButton];
    self.layer.borderColor = [UIColor darkGreenColor].CGColor;
    self.layer.borderWidth = 2.0f;
    return self;
}
- (SCGroup *)selectedgroup
{
    return _selectedgroup;
}
- (void) dismiss: (UIButton*)sender
{
    [self removeFromSuperview];
}
- (void)deleteGroup:(UIButton *)sender
{
    [self.delegate deleteFriend:self.selectedgroup];
}

- (void)setSelectedgroup:(SCGroup *)selectedgroup
{
    _selectedgroup = selectedgroup;
    /*change the below label to something else to allow for editing the text */
    self.name.text = _selectedgroup.groupname;
    
    NSMutableArray *grouparray = _selectedgroup.friends;
    for (int i = 0; i < [grouparray count]; i++) {
        CGFloat y_pos = 115 + i * 20;
        UIImageView *groupbullet = [[UIImageView alloc] initWithFrame:CGRectMake(11, y_pos, 15, 15)];
        UILabel *grouplabel = [[UILabel alloc] initWithFrame:CGRectMake(36,y_pos, 150, 15)];
        UIButton *groupremove = [[UIButton alloc] initWithFrame:CGRectMake(186, y_pos, 60, 15)];
        grouplabel.text = ((SCFriend *) [grouparray objectAtIndex:i]).nickname;
        grouplabel.font = [UIFont systemFontOfSize:10.0];
        [groupremove setTitle:@"Remove" forState:UIControlStateNormal];
        [groupremove setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
        [groupbullet setImage:[UIImage imageNamed:@"circleBullet"]];
        groupremove.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        groupremove.layer.borderColor = [UIColor darkGreenColor].CGColor;
        groupremove.layer.borderWidth = 1;
        groupremove.tag = i;

        [groupremove addTarget:self action:@selector(removeFriendWithButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: grouplabel];
        [self addSubview: groupremove];
        [self addSubview: groupbullet];
    }
}

- (void)addFriends
{
    SCFriendSelectController *vc = [[SCFriendSelectController alloc]initWithOutGroup:self.selectedgroup];
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
- (void)removeFriendWithButton:(UIButton *)sender {
    NSInteger index = sender.tag;
    [selectedgroup.friends removeObjectAtIndex:index];
    [sender removeFromSuperview];
    [self setNeedsDisplay];
    /*need to add additional functionality for label to disappear in addition to button*/
}
@end
