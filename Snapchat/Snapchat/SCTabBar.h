//
//  SCTabBar.h
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SCTabBarController.h"
@protocol SCTabBarDelegate
- (void)presentVC: (UIViewController *)viewController;
@end



@interface SCTabBar : UIView
{
    UIViewController<SCTabBarDelegate> *delegate;
}
@property NSMutableArray *unselectdImages;
@property NSMutableArray *selectedImages;
@property NSMutableArray *tabButtons;
@property NSMutableArray *viewControllers;
@property UIButton *selectedButton;
- (void)addButtonWithSelectedImage: (UIImage*)selectedImage
                   unselectedImage: (UIImage *) unselectedImage
                          delegate: (UIViewController <SCTabBarDelegate>*)d
                 andViewController: (UIViewController *)vc;
- (void)addButtons;
@end
