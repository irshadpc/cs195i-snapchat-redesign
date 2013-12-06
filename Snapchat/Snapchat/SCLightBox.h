//
//  SCLightBox.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFriend.h"
@protocol SCLightBoxDelegate
- (void)deleteFriend: (SCFriend *)friend;
- (void)blockFriend:(SCFriend *)friend;
- (void)unblockFriend:(SCFriend *)friend;

@end
@interface SCLightBox : UIView <UITextFieldDelegate>
@property SCFriend *selectedfriend;
@property UIButton *exitButton;
@property UIButton *editButton;
@property UIButton *deleteButton;
@property UIButton *blockButton;
@property UITextField *name;
@property UILabel *score;
@property UILabel *bestfriends;
@property UILabel *groups;
@property UILabel *bfriend1;
@property UILabel *bfriend2;
@property UILabel *bfriend3;
@property UIImageView *bullet1;
@property UIImageView *bullet2;
@property UIImageView *bullet3;
@property UITableViewController<SCLightBoxDelegate> *delegate;
@property UIView *groupView;
@end
