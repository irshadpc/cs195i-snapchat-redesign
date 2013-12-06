//
//  SCPhotoEditingView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCDrawingView.h"
@protocol SCPhotoEditingDelegate
- (void)presentVC: (UIViewController *)viewController;
- (void)returnToCamera;
@end

@interface SCPhotoEditingView : UIView
@property UIViewController<SCPhotoEditingDelegate> *delegate;
@property SCDrawingView *drawingview;
@property UIButton *drawToggleButton;
@property UIButton *undoButton;
@property UIButton *whiteToggleButton;
@property UIButton *redToggleButton;
@property UIButton *saveButton;
@property UIButton *timeButton;
@property UIImageView *colorPallet;
@end
