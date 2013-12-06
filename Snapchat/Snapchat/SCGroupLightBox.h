//
//  SCGroupLightBox.h
//  Snapchat
//
//  Created by Jake Kaufman on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCGroup.h"
@protocol SCGroupLightBoxDelegate
- (void)deleteFriend: (SCGroup *)friend;
- (void)presentVC:(UIViewController*)vc;
@end
@interface SCGroupLightBox : UIView <UITextFieldDelegate>
@property SCGroup *selectedgroup;
@property UIButton *exitButton;
@property UIButton *editButton;
@property UIButton *deleteButton;
@property UIButton *addButton;
@property UITextField *name;
@property UILabel *members;
@property UITableViewController<SCGroupLightBoxDelegate> *delegate;
@end
