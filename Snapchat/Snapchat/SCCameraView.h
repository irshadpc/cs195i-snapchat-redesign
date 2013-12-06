//
//  SCCameraView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCameraViewController.h"
@interface SCCameraView : UIView <UIGestureRecognizerDelegate>
@property UIImageView *background_image_view;
@property UIButton *menuButton;
@property UIButton *snapButton;
@property UIButton *switchButton;
@property SCCameraViewController *delegate;
@property BOOL isSelfie;
@property UIScrollView *scroll;
@end
