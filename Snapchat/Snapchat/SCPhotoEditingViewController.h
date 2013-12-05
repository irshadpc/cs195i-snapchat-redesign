//
//  SCPhotoEditingViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCCameraViewController.h"
#import "SCPhotoEditingView.h"
@interface SCPhotoEditingViewController : UIViewController<SCPhotoEditingDelegate>
@property SCCameraViewController* cameraVC;
@end
