//
//  SCPhotoEditingView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCPhotoEditingDelegate
- (void)presentVC: (UIViewController *)viewController;
- (void)returnToCamera;
@end

@interface SCPhotoEditingView : UIView
@property UIViewController<SCPhotoEditingDelegate> *delegate;
@end
