//
//  SCMenuViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMenuView.h"
#import "SCCameraViewController.h"
#import "MHTabBarController.h"

@interface SCMenuViewController : UIViewController<SCMenuDelegate, MHTabBarControllerDelegate>
@property SCCameraViewController* cameraVC;
@end
