//
//  SCRequestCell.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFriend.h"
@protocol SCRequestDelegate

- (void)deleteCellForFriend: (SCFriend *)friend;
@end

@interface SCRequestCell : UITableViewCell
{
    UIButton *acceptButton;
    UIButton *rejectButton;
}
@property SCFriend* friend;
@property UITableViewController<SCRequestDelegate> *delegate;
@end
