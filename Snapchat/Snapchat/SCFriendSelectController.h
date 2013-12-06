//
//  SCFriendSelectController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSelectFriendsViewController.h"
@interface SCFriendSelectController : UIViewController
@property SCSelectFriendsViewController *tvc;
@property UIView *bar;
@property UIViewController *delegate;
@property NSString *goButton;
@property UIButton *sendButton;
- (void)removeGroup:(SCGroup *)group;
- (id)initWithOutGroup: (SCGroup *)group;
@end
