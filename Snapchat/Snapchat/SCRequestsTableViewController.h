//
//  SCRequestsTableViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCRequestCell.h"
@interface SCRequestsTableViewController : UITableViewController<SCRequestDelegate>
@property NSMutableArray *requests;
@end
