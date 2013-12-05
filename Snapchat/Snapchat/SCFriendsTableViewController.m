//
//  SCFriendsTableViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCFriendsTableViewController.h"
#import "SCFriend.h"
#import "SCRequestCell.h"
#import "SCLightBox.h"
#import "UIColor+SCColorPalette.h"
@interface SCFriendsTableViewController ()

@end

@implementation SCFriendsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.friends = [NSMutableArray array];
        
        SCFriend *friend1 = [[SCFriend alloc]init];
        friend1.username = @"jck2";
        friend1.nickname = @"Jake Kaufman";
        
        SCFriend *friend2 = [[SCFriend alloc]init];
        friend2.username = @"ac115";
        friend2.nickname = @"Alex Chou";
        
        SCFriend *friend3 = [[SCFriend alloc]init];
        friend3.username = @"eyl";
        friend3.nickname = @"Evan Li";
        
        SCFriend *friend4 = [[SCFriend alloc]init];
        friend4.username = @"jsl15";
        friend4.nickname = @"Jessica Liang";
        
        [self.friends addObject:friend1];
        [self.friends addObject:friend2];
        [self.friends addObject:friend3];
        [self.friends addObject: friend4];
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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.lightbox removeFromSuperview];
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
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       // cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
        //myBackView.backgroundColor = [UIColor clearColor];
        //cell.selectedBackgroundView = myBackView;
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 1)];
        separatorLineView.backgroundColor = [UIColor separatorColor]; // set color as you want.
        [cell.contentView addSubview:separatorLineView];
    }
    SCFriend *friend = (SCFriend *)[self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = friend.nickname;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.lightbox = [[SCLightBox alloc] initWithFrame:CGRectMake(30, 20, width - 60, 350)];
    [self.view addSubview:self.lightbox];
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
