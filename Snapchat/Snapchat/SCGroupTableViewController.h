//
//  SCGroupTableViewController.h
//  Snapchat
//
//  Created by Jake Kaufman on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCGroupLightBox.h"
#import "SCSelectFriendsViewController.h"
#import "SCNewGroupBox.h"
@interface SCGroupTableViewController : UITableViewController<SCGroupLightBoxDelegate>
@property NSMutableArray *groups;
@property SCGroupLightBox *lightBox;
@property SCNewGroupBox *b;
@end
