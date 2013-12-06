//
//  SCMessageTableViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMessage.h"
#import "SCMessageCell.h"
#import "SCImageView.h"
@interface SCMessageTableViewController : UITableViewController<SCMessageCellDelegate,SCImageViewDelegate>
@property NSMutableArray* messages;
@end
