
#import "MHTabBarController.h"
#import "UIColor+SCColorPalette.h"
#import "SCSelectFriendsViewController.h"
static const NSInteger TagOffset = 1000;

@implementation MHTabBarController
{
    UIView *tabButtonsContainerView;
    UIView *contentContainerView;
    UIImageView *indicatorImageView;
}
- (id)init
{
    if (self = [super init]) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"Contacts"];
        [tbi setImage: [UIImage imageNamed:@"contactsTab"]];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor :[UIColor lightGreenColor] }
                                                     forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor darkGreenColor] }
                                                     forState:UIControlStateHighlighted];
    }
    return  self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *imgNavLog = [UIImage imageNamed:@"addFriend"];
    UIBarButtonItem *rightbutton= [[UIBarButtonItem alloc] initWithImage:(imgNavLog) style:UIBarButtonItemStylePlain target:self action:@selector(presentFindFriends)];
    rightbutton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightbutton;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.tabBarHeight);
    tabButtonsContainerView = [[UIView alloc] initWithFrame:rect];
    tabButtonsContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:tabButtonsContainerView];
    
    rect.origin.y = self.tabBarHeight;
    rect.size.height = self.view.bounds.size.height - self.tabBarHeight;
    contentContainerView = [[UIView alloc] initWithFrame:rect];
    contentContainerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentContainerView];
    
    indicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MHTabBarIndicator"]];
    [self.view addSubview:indicatorImageView];
    
    [self reloadTabButtons];
}
- (void)presentFindFriends
{
    
    SCFindFriendsViewController *s = [[SCFindFriendsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:s];
    [nav.navigationBar.topItem setTitle:@"Find friends" ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [nav.navigationBar setTranslucent:NO];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
    s.delegate = self;
    

    [self presentViewController: nav animated:YES completion:nil];
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self layoutTabButtons];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Only rotate if all child view controllers agree on the new orientation.
    for (UIViewController *viewController in self.viewControllers)
    {
        if (![viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation])
            return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && self.view.window == nil)
    {
        self.view = nil;
        tabButtonsContainerView = nil;
        contentContainerView = nil;
        indicatorImageView = nil;
    }
}

- (void)reloadTabButtons
{
    [self removeTabButtons];
    [self addTabButtons];
    
    // Force redraw of the previously active tab.
    NSUInteger lastIndex = _selectedIndex;
    _selectedIndex = NSNotFound;
    self.selectedIndex = lastIndex;
}

- (void)addTabButtons
{
    NSUInteger index = 0;
    for (UIViewController *viewController in self.viewControllers)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = TagOffset + index;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        //button.titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
        
        UIOffset offset = viewController.tabBarItem.titlePositionAdjustment;
        button.titleEdgeInsets = UIEdgeInsetsMake(offset.vertical, offset.horizontal, 0.0f, 0.0f);
        button.imageEdgeInsets = viewController.tabBarItem.imageInsets;
        [button setTitle:viewController.tabBarItem.title forState:UIControlStateNormal];
        [button setImage:viewController.tabBarItem.image forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(tabButtonPressed:) forControlEvents:UIControlEventTouchDown];
        
        [self deselectTabButton:button];
        [tabButtonsContainerView addSubview:button];
        
        ++index;
    }
}

- (void)removeTabButtons
{
    while ([tabButtonsContainerView.subviews count] > 0)
    {
        [[tabButtonsContainerView.subviews lastObject] removeFromSuperview];
    }
}

- (void)layoutTabButtons
{
    NSUInteger index = 0;
    NSUInteger count = [self.viewControllers count];
    
    CGRect rect = CGRectMake(0.0f, 0.0f, floorf(self.view.bounds.size.width / count), self.tabBarHeight);
    
    indicatorImageView.hidden = YES;
    
    NSArray *buttons = [tabButtonsContainerView subviews];
    for (UIButton *button in buttons)
    {
        if (index == count - 1)
            rect.size.width = self.view.bounds.size.width - rect.origin.x;
        
        button.frame = rect;
        rect.origin.x += rect.size.width;
        
        if (index == self.selectedIndex)
            [self centerIndicatorOnButton:button];
        
        ++index;
    }
}

- (void)centerIndicatorOnButton:(UIButton *)button
{
    CGRect rect = indicatorImageView.frame;
    rect.origin.x = button.center.x - floorf(indicatorImageView.frame.size.width/2.0f);
    rect.origin.y = self.tabBarHeight - indicatorImageView.frame.size.height;
    indicatorImageView.frame = rect;
    indicatorImageView.hidden = NO;
}

- (void)setViewControllers:(NSArray *)newViewControllers
{
    NSAssert([newViewControllers count] >= 2, @"MHTabBarController requires at least two view controllers");
    
    UIViewController *oldSelectedViewController = self.selectedViewController;
    
    // Remove the old child view controllers.
    for (UIViewController *viewController in _viewControllers)
    {
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    
    _viewControllers = [newViewControllers copy];
    
    // This follows the same rules as UITabBarController for trying to
    // re-select the previously selected view controller.
    NSUInteger newIndex = [_viewControllers indexOfObject:oldSelectedViewController];
    if (newIndex != NSNotFound)
        _selectedIndex = newIndex;
    else if (newIndex < [_viewControllers count])
        _selectedIndex = newIndex;
    else
        _selectedIndex = 0;
    
    // Add the new child view controllers.
    for (UIViewController *viewController in _viewControllers)
    {
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
    }
    
    if ([self isViewLoaded])
        [self reloadTabButtons];
}

- (void)setSelectedIndex:(NSUInteger)newSelectedIndex
{
    [self setSelectedIndex:newSelectedIndex animated:NO];
}

- (void)setSelectedIndex:(NSUInteger)newSelectedIndex animated:(BOOL)animated
{
    NSAssert(newSelectedIndex < [self.viewControllers count], @"View controller index out of bounds");
    
    if ([self.delegate respondsToSelector:@selector(mh_tabBarController:shouldSelectViewController:atIndex:)])
    {
        UIViewController *toViewController = (self.viewControllers)[newSelectedIndex];
        if (![self.delegate mh_tabBarController:self shouldSelectViewController:toViewController atIndex:newSelectedIndex])
            return;
    }
    
    if (![self isViewLoaded])
    {
        _selectedIndex = newSelectedIndex;
    }
    else if (_selectedIndex != newSelectedIndex)
    {
        UIViewController *fromViewController;
        UIViewController *toViewController;
        
        if (_selectedIndex != NSNotFound)
        {
            UIButton *fromButton = (UIButton *)[tabButtonsContainerView viewWithTag:TagOffset + _selectedIndex];
            [self deselectTabButton:fromButton];
            fromViewController = self.selectedViewController;
        }
        
        NSUInteger oldSelectedIndex = _selectedIndex;
        _selectedIndex = newSelectedIndex;
        
        UIButton *toButton;
        if (_selectedIndex != NSNotFound)
        {
            toButton = (UIButton *)[tabButtonsContainerView viewWithTag:TagOffset + _selectedIndex];
            [self selectTabButton:toButton];
            toViewController = self.selectedViewController;
        }
        
        if (toViewController == nil)  // don't animate
        {
            [fromViewController.view removeFromSuperview];
        }
        else if (fromViewController == nil)  // don't animate
        {
            toViewController.view.frame = contentContainerView.bounds;
            [contentContainerView addSubview:toViewController.view];
            [self centerIndicatorOnButton:toButton];
            
            if ([self.delegate respondsToSelector:@selector(mh_tabBarController:didSelectViewController:atIndex:)])
                [self.delegate mh_tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
        }
        else if (animated)
        {
            CGRect rect = contentContainerView.bounds;
            if (oldSelectedIndex < newSelectedIndex)
                rect.origin.x = rect.size.width;
            else
                rect.origin.x = -rect.size.width;
            
            toViewController.view.frame = rect;
            tabButtonsContainerView.userInteractionEnabled = NO;
            
            [self transitionFromViewController:fromViewController
                              toViewController:toViewController
                                      duration:0.3f
                                       options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionCurveEaseOut
                                    animations:^
             {
                 CGRect rect = fromViewController.view.frame;
                 if (oldSelectedIndex < newSelectedIndex)
                     rect.origin.x = -rect.size.width;
                 else
                     rect.origin.x = rect.size.width;
                 
                 fromViewController.view.frame = rect;
                 toViewController.view.frame = contentContainerView.bounds;
                 [self centerIndicatorOnButton:toButton];
             }
                                    completion:^(BOOL finished)
             {
                 tabButtonsContainerView.userInteractionEnabled = YES;
                 
                 if ([self.delegate respondsToSelector:@selector(mh_tabBarController:didSelectViewController:atIndex:)])
                     [self.delegate mh_tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
             }];
        }
        else  // not animated
        {
            [fromViewController.view removeFromSuperview];
            
            toViewController.view.frame = contentContainerView.bounds;
            [contentContainerView addSubview:toViewController.view];
            [self centerIndicatorOnButton:toButton];
            
            if ([self.delegate respondsToSelector:@selector(mh_tabBarController:didSelectViewController:atIndex:)])
                [self.delegate mh_tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
        }
    }
}

- (UIViewController *)selectedViewController
{
    if (self.selectedIndex != NSNotFound)
        return (self.viewControllers)[self.selectedIndex];
    else
        return nil;
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController
{
    [self setSelectedViewController:newSelectedViewController animated:NO];
}

- (void)setSelectedViewController:(UIViewController *)newSelectedViewController animated:(BOOL)animated
{
    NSUInteger index = [self.viewControllers indexOfObject:newSelectedViewController];
    if (index != NSNotFound)
        [self setSelectedIndex:index animated:animated];
}

- (void)tabButtonPressed:(UIButton *)sender
{
    [self setSelectedIndex:sender.tag - TagOffset animated:YES];
}

#pragma mark - Change these methods to customize the look of the buttons

- (void)selectTabButton:(UIButton *)button
{
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIImage *image = [[UIImage imageNamed:@"lightGreen"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[button setTitleShadowColor:[UIColor colorWithWhite:0.0f alpha:0.5f] forState:UIControlStateNormal];
}

- (void)deselectTabButton:(UIButton *)button
{
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIImage *image = [[UIImage imageNamed:@"miscTab"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor darkGreenColor] forState:UIControlStateNormal];
    //[button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (CGFloat)tabBarHeight
{
    return 44.0f;
}

@end