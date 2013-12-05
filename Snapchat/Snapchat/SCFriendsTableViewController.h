//
//  SCFriendsTableViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCLightBox.h"
@interface SCFriendsTableViewController : UITableViewController<SCLightBoxDelegate>
@property NSMutableArray* friends;
@property SCLightBox *lightbox;
@property UIButton *lightBoxButton;
@end
