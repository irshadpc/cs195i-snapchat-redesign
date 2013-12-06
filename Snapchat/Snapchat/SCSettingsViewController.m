//
//  SCSettingsViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSettingsViewController.h"
#import "SCSettingsView.h"
#import "UIColor+SCColorPalette.h"
@interface SCSettingsViewController ()
{
    UIPickerView *settingsPickerView;
}
@end

@implementation SCSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view = [[SCSettingsView alloc] init];
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"settings"];
        [tbi setImage: [UIImage imageNamed:@"settingsTab"]];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor :[UIColor blackColor
                                                                                        ] }
                                                 forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor darkGreenColor] }
                                                 forState:UIControlStateHighlighted];
        settingsPickerView = [[UIPickerView alloc] initWithFrame: CGRectMake(0, 0, 320, 120)];
        settingsPickerView.delegate = self;
        settingsPickerView.showsSelectionIndicator = YES;
        ((SCSettingsView *)self.view).privacy_field.inputView  = settingsPickerView;
        //[settingsPickerView setBackgroundColor:[UIColor redColor]];
        
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    ((SCSettingsView *)self.view).privacy_field.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    //[ resignFirstResponder];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger numRows = 2;
    return numRows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) return @"Friends";
    return @"Everyone";
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component:(NSInteger)component {
    int sectionWidth = 300;
    return sectionWidth;
}

@end
