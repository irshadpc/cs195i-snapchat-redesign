//
//  SCGroupTableViewController.m
//  Snapchat
//
//  Created by Jake Kaufman on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCGroupTableViewController.h"
#import "SCGroup.h"
#import "SCFriend.h"
#import "UIColor+SCColorPalette.h"
@interface SCGroupTableViewController ()

@end

@implementation SCGroupTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.groups = [NSMutableArray array];
        
        SCGroup *group1 = [[SCGroup alloc]init];
        group1.groupname = @"Brown University";
        
        SCGroup *group2 = [[SCGroup alloc]init];
        group2.groupname = @"Cool frandz";
        
        SCGroup *group3 = [[SCGroup alloc]init];
        group3.groupname = @"Mah Peepz";
        
        
        SCFriend *friend1 = [[SCFriend alloc]init];
        friend1.username = @"ac115";
        friend1.nickname = @"Alex Chou";
        
        SCFriend *friend2 = [[SCFriend alloc]init];
        friend2.username = @"eyl";
        friend2.nickname = @"Evan Li";
        
        SCFriend *friend3 = [[SCFriend alloc]init];
        friend3.username = @"jsl15";
        friend3.nickname = @"Jessica Liang";
        
        SCFriend *friend4 = [[SCFriend alloc]init];
        friend4.username = @"lduan5";
        friend4.nickname = @"Lucy Duan";
        
        SCFriend *friend5 = [[SCFriend alloc]init];
        friend5.username = @"DB60";
        friend5.nickname = @"D'Brickashaw Ferguson";
        
        SCFriend *friend6 = [[SCFriend alloc]init];
        friend6.username = @"ibrahim4";
        friend6.nickname = @"Ibrahim Moizoos";
        
        SCFriend *friend7 = [[SCFriend alloc]init];
        friend7.username = @"Tjess6";
        friend7.nickname = @"Thomas Jessison";
        
        [group1.friends addObject:friend1];
        [group1.friends addObject:friend2];
        [group1.friends addObject:friend3];
        
        [group2.friends addObject:friend4];
        [group2.friends addObject:friend7];

        [group3.friends addObject:friend5];
        [group3.friends addObject:friend6];
        
        [self.groups addObject:group1];
        [self.groups addObject:group2];
        [self.groups addObject:group3];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.groups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 1)];
        separatorLineView.backgroundColor = [UIColor separatorColor]; // set color as you want.
        [cell.contentView addSubview:separatorLineView];
    }
    SCGroup *group = (SCGroup *)[self.groups objectAtIndex:indexPath.row];
    cell.textLabel.text = group.groupname;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.lightBox = [[SCGroupLightBox alloc] initWithFrame:CGRectMake(30, 20, width - 60, 350)];
    self.lightBox.selectedgroup = [self.groups objectAtIndex:indexPath.row];
    self.lightBox.delegate = self;
    [self.view addSubview:self.lightBox];
}
- (void)deleteFriend:(SCFriend *)friend
{
    [self.lightBox removeFromSuperview];
    NSInteger index = [self.groups indexOfObject:friend];
    NSIndexPath *i = [NSIndexPath indexPathForRow:index inSection:0];
    [self.groups removeObject:friend];
    [self.tableView deleteRowsAtIndexPaths: @[i] withRowAnimation:UITableViewRowAnimationTop];
}
- (void)presentFindFriends
{
    
    SCSelectFriendsViewController *s = [[SCSelectFriendsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:s];
    [nav.navigationBar.topItem setTitle:@"Send to..." ];
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 1)];
    separatorLineView.backgroundColor = [UIColor lightGreenColor]; // set color as you want.
    [nav.navigationBar addSubview:separatorLineView];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [nav.navigationBar setTranslucent:NO];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBackground"] forBarMetrics:UIBarMetricsDefault];
    s.delegate = self;
    
    [self presentViewController: nav animated:YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
