//
//  SCPhotoEditingViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCPhotoEditingViewController.h"
#import "SCPhotoEditingView.h"
@interface SCPhotoEditingViewController ()

@end
@implementation SCPhotoEditingViewController
@synthesize timerPickerView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view = [[SCPhotoEditingView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        ((SCPhotoEditingView*)self.view).delegate = self;
        timerPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
        timerPickerView.delegate = self;
        timerPickerView.showsSelectionIndicator = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) presentVC:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:NO completion:Nil];
}
- (void)returnToCamera
{
    [self.cameraVC dismissViewControllerAnimated:NO completion:Nil];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    SCPhotoEditingView *myview = (SCPhotoEditingView *)self.view;
    NSArray *imageArray = myview.timerImageArray;
    [myview.timeButton setBackgroundImage:[imageArray objectAtIndex:[[self pickerView:pickerView titleForRow:row forComponent:component] integerValue]] forState:UIControlStateNormal];
    //[ resignFirstResponder];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld",row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component:(NSInteger)component {
    int sectionWidth = 300;
    return sectionWidth;
}
@end
