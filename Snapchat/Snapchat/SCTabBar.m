//
//  SCTabBar.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCTabBar.h"
@interface SCTabBar()
- (void)presentVC: (UIButton *)sender;
@end
@implementation SCTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.unselectdImages = [NSMutableArray array];
        self.selectedImages = [NSMutableArray array];
        self.viewControllers = [NSMutableArray array];
        
        self.tabButtons = [NSMutableArray array];
    }
    return self;
}
- (void)addButtons
{
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width / [self.viewControllers count];
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    for (int i = 0; i < [self.viewControllers count]; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(i *buttonWidth, screenHeight - 50, buttonWidth, 50)];
        [button setImage:[self.selectedImages objectAtIndex:i] forState:UIControlStateSelected];
        [button setImage:[self.unselectdImages objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(presentVC:) forControlEvents: UIControlEventAllTouchEvents];
        [self.tabButtons addObject:button];
        [button setBackgroundColor:[UIColor greenColor]];
        [self addSubview:button];
    }
}

- (void)presentVC: (UIButton *)sender
{
    NSLog(@"ldksjflkdajf");
    if (self.selectedButton && (self.selectedButton != sender)) {
        [self.selectedButton setSelected:NO];
    }
    [sender setSelected:YES];
    self.selectedButton = sender;
    NSUInteger buttonIndex = [self.tabButtons indexOfObject: sender];
    [delegate presentVC:[self.viewControllers objectAtIndex:buttonIndex]];
}
- (void)addButtonWithSelectedImage: (UIImage*)selectedImage
                   unselectedImage: (UIImage *) unselectedImage
                          delegate: (UIViewController <SCTabBarDelegate>*)d
                 andViewController: (UIViewController *)vc
{
    [self.selectedImages addObject:selectedImage];
    [self.unselectdImages addObject:unselectedImage];
    [self.viewControllers addObject:vc];
    delegate = d;
    [self layoutSubviews];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
