//
//  SCMenuView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMenuViewController.h"
@interface SCMenuView : UIView

@property UIButton *messages;
@property UIButton *camera;
@property UIButton *friends;
@property UIButton *settings;
@property SCMenuViewController *delegate;

@end
