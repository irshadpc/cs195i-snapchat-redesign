//
//  SCSelectFriendsViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCGroup.h"
#import "SCFriend.h"

@interface SCSelectFriendsViewController : UITableViewController
@property NSMutableArray *friends;
@property NSMutableArray *groups;
@property UIViewController *delegate;
- (void)removeGroup:(SCGroup *)group;
- (id)initWithoutGroup:(SCGroup *)group;
@end
