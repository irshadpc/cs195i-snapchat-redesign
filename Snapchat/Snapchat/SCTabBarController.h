//
//  SCTabBarController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTabBar.h"

@interface SCTabBarController : UIViewController<SCTabBarDelegate>
@property SCTabBar *tabBar;
- (void)presentVC: (UIViewController *)viewController;
@end
