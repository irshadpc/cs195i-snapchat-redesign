//
//  SCSelectFriendsViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSelectFriendsViewController.h"
#import "UIColor+SCColorPalette.h"
#import "SCSelectFriendsCell.h"
@interface SCSelectFriendsViewController ()
{
    UITableView *_tableView;
    UIToolbar *_toolbar;
}
@end

@implementation SCSelectFriendsViewController
@synthesize friends;
@synthesize groups;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.friends = [NSMutableArray array];
        self.groups = [NSMutableArray array];
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
        
        [self.friends addObject:friend1];
        [self.friends addObject:friend2];
        [self.friends addObject:friend3];
        [self.friends addObject:friend4];
        [self.friends addObject:friend5];
        [self.friends addObject:friend6];
        [self.friends addObject:friend7];

        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view addSubview:self.tableView];
       
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
    return [self.groups count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section >= [self.groups count]){
        return [self.friends count];
    } else {
        return [((SCGroup *)[self.groups objectAtIndex:section]).friends count] + 1;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tempView=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,20)];
    tempView.backgroundColor=[UIColor lightGreenColor];
    
    UILabel *tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,2,310,20)];
    tempLabel.backgroundColor=[UIColor clearColor];
    tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    if (section < [self.groups count]) {
        SCGroup *group = [self.groups objectAtIndex:section];
        tempLabel.text = group.groupname;
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
        cell = [[SCSelectFriendsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    if (indexPath.section < [self.groups count]) {
        SCGroup *currentGroup = ((SCGroup *)[self.groups objectAtIndex:indexPath.section]);
        if (indexPath.row == 0) {
            cell.textLabel.text = @"All members of group";
            cell.detailTextLabel.text = nil;
        } else {
            SCFriend *currFriend = [currentGroup.friends objectAtIndex:indexPath.row - 1];
            cell.textLabel.text = currFriend.nickname;
            cell.detailTextLabel.text = currFriend.username;
        }
        //cell.imageView.image = [UIImage imageNamed:@"pusheen"];
    } else {
        SCFriend *currentFriend = [self.friends objectAtIndex:indexPath.row];
        cell.textLabel.text = currentFriend.nickname;
        cell.detailTextLabel.text = currentFriend.username;
    }

    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section < [self.groups count]) {
        SCGroup *group = [self.groups objectAtIndex:section];
        return group.groupname;
    } else {
        return @"Friends";
    }
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
