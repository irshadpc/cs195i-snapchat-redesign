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
#import "SCGroup.h"
@interface SCFriendsTableViewController ()
{
    BOOL _blockedSection;
}
@end

@implementation SCFriendsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _blockedSection = NO;
        
        self.friends = [NSMutableArray array];
        self.blocked = [NSMutableArray array];
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
        
        SCGroup *group1 = [[SCGroup alloc]init];
        group1.groupname = @"Brown University";
        
        SCGroup *group2 = [[SCGroup alloc]init];
        group2.groupname = @"Cool frandz";
        
        SCGroup *group3 = [[SCGroup alloc]init];
        group3.groupname = @"Mah Peepz";
        
        [group1.friends addObject:friend1];
        [group1.friends addObject:friend2];
        [group1.friends addObject:friend3];
        [friend1.groups addObject:group1];
        [friend2.groups addObject:group1];
        [friend3.groups addObject:group1];
        
        [group2.friends addObject:friend4];
        [group2.friends addObject:friend7];
        [friend4.groups addObject:group2];
        [friend7.groups addObject:group2];
        
        [group3.friends addObject:friend5];
        [group3.friends addObject:friend6];
        [friend5.groups addObject:group3];
        [friend6.groups addObject:group3];
        
        [friend1.bestFriends addObject:friend2];
        [friend1.bestFriends addObject:friend3];
        [friend1.bestFriends addObject:friend4];
        
        [friend2.bestFriends addObject:friend3];
        [friend2.bestFriends addObject:friend4];
        [friend2.bestFriends addObject:friend5];
        
        [friend3.bestFriends addObject:friend4];
        [friend3.bestFriends addObject:friend5];
        [friend3.bestFriends addObject:friend6];
        
        [friend4.bestFriends addObject:friend5];
        [friend4.bestFriends addObject:friend6];
        [friend4.bestFriends addObject:friend7];
        
        [friend5.bestFriends addObject:friend6];
        [friend5.bestFriends addObject:friend7];
        [friend5.bestFriends addObject:friend1];
        
        [friend6.bestFriends addObject:friend7];
        [friend6.bestFriends addObject:friend1];
        [friend6.bestFriends addObject:friend2];
        
        [friend7.bestFriends addObject:friend1];
        [friend7.bestFriends addObject:friend2];
        [friend7.bestFriends addObject:friend3];
        
        [self.friends addObject:friend1];
        [self.friends addObject:friend2];
        [self.friends addObject:friend3];
        [self.friends addObject:friend4];
        [self.friends addObject:friend5];
        [self.friends addObject:friend6];
        [self.friends addObject:friend7];
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
    if (_blockedSection) {
        return 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return [self.friends count];
    } else {
        return [self.blocked count];
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1 && [self.blocked count] == 0) {
        return  nil;
    }
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,20)];
    tempView.backgroundColor=[UIColor paleGreen];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,2,310,20)];
    tempLabel.backgroundColor=[UIColor clearColor];
    tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    if (section == 1) {
        tempLabel.text = @"Blocked";
    } else {
        tempLabel.text = @"Friends";
    }
    [tempView addSubview:tempLabel];
    
    return tempView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
        //myBackView.backgroundColor = [UIColor lightGreenColor];
        //cell.selectedBackgroundView = myBackView;
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 1)];
        separatorLineView.backgroundColor = [UIColor separatorColor]; // set color as you want.
        [cell.contentView addSubview:separatorLineView];
        [cell.imageView setImage:[UIImage imageNamed:@"starBullet"]];
    }
    if (indexPath.section == 0) {
        SCFriend *friend = (SCFriend *)[self.friends objectAtIndex:indexPath.row];
        cell.textLabel.text = friend.nickname;
        cell.detailTextLabel.text = friend.username;
    } else {
        SCFriend *friend = (SCFriend *)[self.blocked objectAtIndex:indexPath.row];
        cell.textLabel.text = friend.nickname;
        cell.detailTextLabel.text = friend.username;

    }
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}
- (void)displayFeedbackWithFriend:(NSString *)name andAction: (NSString *)action
{
    UILabel *feedback = [[UILabel alloc]initWithFrame:CGRectMake(20, 370, 280, 20)];
    feedback.textColor = [UIColor whiteColor];
    feedback.textAlignment = UITextAlignmentCenter;
    [feedback setText:[NSString stringWithFormat:@"%@ was %@", name, action]];
    [feedback setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.7f]];
    [self.view addSubview:feedback];
    feedback.alpha = 1.0f;
        [UIView animateWithDuration:5.0
                            delay:8.0 options:nil
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.lightbox = [[SCLightBox alloc] initWithFrame:CGRectMake(30, 20, width - 60, 350)];
    if (indexPath.section == 0) {
        self.lightbox.selectedfriend = [self.friends objectAtIndex:indexPath.row];
    } else {
        self.lightbox.selectedfriend = [self.blocked objectAtIndex:indexPath.row];
    }
    self.lightbox.delegate = self;
    [self.view addSubview:self.lightbox];
}
- (void)deleteFriend:(SCFriend *)friend
{
    [self.lightbox removeFromSuperview];
    NSInteger index = [self.friends indexOfObject:friend];
    NSIndexPath *i = [NSIndexPath indexPathForRow:index inSection:0];
    [self.friends removeObject:friend];
    [self.tableView deleteRowsAtIndexPaths: @[i] withRowAnimation:UITableViewRowAnimationTop];
    [self displayFeedbackWithFriend:friend.nickname andAction:@"deleted"];
}
- (void)unblockFriend:(SCFriend *)friend
{
    [self.lightbox removeFromSuperview];
    friend.isBlocked = NO;
    NSInteger removeIndex = [self.blocked indexOfObject:friend];
    NSIndexPath *i = [NSIndexPath indexPathForItem:removeIndex inSection:1];
    [self.blocked removeObject:friend];
    [self.tableView deleteRowsAtIndexPaths: @[i] withRowAnimation:UITableViewRowAnimationFade];
    if ([self.blocked count] == 0) {
        _blockedSection= NO;
    }
    [self.friends addObject:friend];
    [self.tableView reloadData];
    [self displayFeedbackWithFriend:friend.nickname andAction:@"unblocked"];
}
- (void)blockFriend:(SCFriend *)friend
{
    [self.lightbox removeFromSuperview];
    friend.isBlocked = YES;
    NSInteger removeIndex = [self.friends indexOfObject:friend];
    NSIndexPath *i = [NSIndexPath indexPathForItem:removeIndex inSection:0];
    [self.friends removeObject:friend];
    [self.tableView deleteRowsAtIndexPaths: @[i] withRowAnimation:UITableViewRowAnimationFade];
    _blockedSection = YES;

    [self.blocked addObject:friend];
    [self.tableView reloadData];
    [self displayFeedbackWithFriend:friend.nickname andAction:@"blocked"];
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
