//
//  SCMessageCell.h
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMessage.h"
@protocol SCMessageCellDelegate
- (void)showImage:(SCMessage *)message;
@end
@interface SCMessageCell : UITableViewCell
@property UITableViewController<SCMessageCellDelegate>* delegate;
@property SCMessage *message;
@end

