//
//  SCSelectFriendsCell.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSelectFriendsCell : UITableViewCell
@property UIButton *unselectedButton;
@property UIButton *selectedButton;
- (void)hideButton;
@end
