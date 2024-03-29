//
//  SCPhotoEditingView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCPhotoEditingView.h"
#import "SCSelectFriendsViewController.h"
#import "UIColor+SCColorPalette.h"
#import "SCFriendSelectController.h"
@implementation SCPhotoEditingView
@synthesize delegate;
@synthesize drawToggleButton;
@synthesize undoButton;
@synthesize blackToggleButton;
@synthesize redToggleButton;
@synthesize colorPallet;
@synthesize saveButton;
@synthesize timeButton;
@synthesize currColor;
@synthesize timerImageArray;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        UIImage *background_image =  [UIImage imageNamed:@"camera image"];
        UIImageView *background_image_view = [[UIImageView alloc] initWithImage:background_image];
        [self addSubview:background_image_view];
        UIButton *exitButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 24, 24)];
        [exitButton setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        //exitButton.backgroundColor = [UIColor redColor];
        [exitButton addTarget:self action:@selector(returnToCamera:) forControlEvents:UIControlEventTouchUpInside];
        self.saveButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 85, 30, 30, 30)];
        [self.saveButton setBackgroundImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
        [saveButton addTarget:self action:@selector(displayFeedback) forControlEvents:UIControlEventTouchUpInside];
        self.timeButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 40, 30, 30, 30)];
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"timer3"] forState:UIControlStateNormal];
        [self.timeButton addTarget:self action:@selector(timerPicker:) forControlEvents:UIControlEventTouchUpInside];
        UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(width - 70, height - 42, 60, 30)];
        [sendButton addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [sendButton setBackgroundImage:[UIImage imageNamed:@"sendButton"] forState:UIControlStateNormal];
        self.drawToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10, height - 40, 30, 30)];
        [self.drawToggleButton setBackgroundImage:[UIImage imageNamed:@"selectColor"] forState:UIControlStateNormal];
        [self.drawToggleButton addTarget:self action:@selector(toggleDrawing:)forControlEvents:UIControlEventTouchUpInside];
        self.undoButton = [[UIButton alloc] initWithFrame:CGRectMake(10, height - 80, 30, 30)];
        [self.undoButton setBackgroundImage:[UIImage imageNamed:@"undo"] forState:UIControlStateNormal];
        self.colorPallet = [[UIImageView alloc] initWithFrame:CGRectMake(50, height - 80, 120, 70)];
        self.colorPallet.image = [UIImage imageNamed:@"colorPallete"];
        self.redToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(110, height - 80, 60, 70)];
        [self.redToggleButton setBackgroundColor:[UIColor clearColor]];
        self.redToggleButton.tag = 0;
        [self.redToggleButton addTarget:self action:@selector(toggleColor:) forControlEvents:UIControlEventTouchUpInside];
        self.blackToggleButton = [[UIButton alloc] initWithFrame:CGRectMake(50, height - 80, 60, 70)];
        [self.blackToggleButton setBackgroundColor:[UIColor clearColor]];
        self.blackToggleButton.tag = 1;
        [self.blackToggleButton addTarget:self action:@selector(toggleColor:) forControlEvents:UIControlEventTouchUpInside];
        self.drawingview = [[SCDrawingView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        self.drawingview.drawingOn = NO;
        self.currColor = [UIColor redColor];
        timerImageArray = [NSMutableArray array];
        [timerImageArray addObject:[UIImage imageNamed:@"timer1"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer2"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer3"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer4"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer5"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer6"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer7"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer8"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer9"]];
        [timerImageArray addObject:[UIImage imageNamed:@"timer10"]];

        [self addSubview:self.drawingview];
        [self addSubview:exitButton];
        [self addSubview:sendButton];
        [self addSubview:timeButton];
        [self addSubview:saveButton];
        [self addSubview:drawToggleButton];
        [self addSubview:blackToggleButton];
        [self addSubview:redToggleButton];
    }
    return self;
}
- (void)displayFeedback
{
    UILabel *feedback = [[UILabel alloc]initWithFrame:CGRectMake(20, 370, 280, 30)];
    feedback.textColor = [UIColor whiteColor];
    feedback.textAlignment = UITextAlignmentCenter;
    [feedback setText:@"Photo saved to camera roll!"];
    [feedback setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.7f]];
    [self addSubview:feedback];
    feedback.alpha = 1.0f;
    [UIView animateWithDuration:20.0
                          delay:20.0 options:nil
                     animations:^{
                         feedback.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0
                                          animations:^{
                                              feedback.alpha = 0;
                                          }
                                          completion:^(BOOL finished){
                                              [feedback removeFromSuperview];
                                          }];
                     }];
}

- (void) send: (UIButton *)sender
{
    SCFriendSelectController *s = [[SCFriendSelectController alloc] init];
    s.goButton = @"Send";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:s];
    [nav.navigationBar.topItem setTitle:@"Send to..." ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [nav.navigationBar setTranslucent:NO];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
    s.delegate = self.delegate;
    [self.delegate presentVC: nav];
}
- (void) returnToCamera:(UIButton *) sender
{
    [self.delegate returnToCamera];
}
- (void) toggleDrawing:(UIButton *) sender {
    if (self.drawingview.drawingOn) {
        self.drawingview.drawingOn = NO;
        [self.undoButton removeFromSuperview];
        [self.colorPallet removeFromSuperview];
        [self.blackToggleButton removeFromSuperview];
        [self.redToggleButton removeFromSuperview];
        [sender setBackgroundImage:[UIImage imageNamed:@"selectColor"] forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor clearColor]];
    }
    else {
        self.drawingview.drawingOn = YES;
        [self addSubview:undoButton];
        [self addSubview:colorPallet];
        [self addSubview:blackToggleButton];
        [self addSubview:redToggleButton];
        [sender setBackgroundImage:[UIImage imageNamed:@"selectColorBorder"] forState:UIControlStateNormal];
        [sender setBackgroundColor:self.currColor];
        [undoButton setBackgroundColor:self.currColor];
    }
}
- (void) toggleColor:(UIButton *)sender {
    if (sender.tag == 0) {
        self.currColor = [UIColor redColor];
        self.drawingview.drawColor = [UIColor redColor];
    }
    else {
        self.currColor = [UIColor blackColor];
        self.drawingview.drawColor = [UIColor blackColor];
    }
    [self.undoButton setBackgroundColor:self.currColor];
    [self.drawToggleButton setBackgroundColor:self.currColor];
}
- (void) timerPicker:(UIButton *)sender {
    return;
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
