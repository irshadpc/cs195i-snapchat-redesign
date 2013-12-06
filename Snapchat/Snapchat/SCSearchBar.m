//
//  SCSearchBar.m
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSearchBar.h"
#import "UIColor+SCColorPalette.h"

@implementation SCSearchBar

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 35)];
    if (self) {
        // Initialization code
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(45, 5, 320-55, 25)];
        self.textField.layer.borderColor = [UIColor whiteColor].CGColor;
        self.textField.layer.borderWidth = 1.0f;
        self.textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pusheen"]];
        UIButton *clearButton = [[UIButton alloc]initWithFrame:CGRectMake(320 - 34, 8, 18, 18)];
        [clearButton setBackgroundColor:[UIColor redColor]];
        [clearButton addTarget:self action:@selector(clearButtonSelected) forControlEvents:UIControlEventTouchUpInside];
        searchIcon.frame = CGRectMake(9, 2, 30, 30);
        [self.textField becomeFirstResponder];
        self.textField.textColor = [UIColor darkGreenColor];
        self.textField.backgroundColor = [UIColor separatorColor];
        [[UITextField appearance] setTintColor:[UIColor darkGreenColor]];
        self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Search for contacts or users" attributes:@{NSForegroundColorAttributeName: [UIColor darkGreenColor]}];


        [self addSubview:searchIcon];
        [self addSubview:self.textField];
        [self addSubview:clearButton];
        [self setBackgroundColor:[UIColor lightGreenColor]];
    }
    return self;
}
-(void)clearButtonSelected{
    self.textField.text=@"";
}
- (void)setDelegate:(UIViewController<UITextFieldDelegate>*)delegate
{
    self.textField.delegate = delegate;
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
