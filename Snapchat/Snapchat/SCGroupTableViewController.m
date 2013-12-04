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

    }
    SCGroup *group = (SCGroup *)[self.groups objectAtIndex:indexPath.row];
    cell.textLabel.text = group.groupname;
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
    
    // If you are not using ARC:
    // return [[UIView new] autorelease];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.5f;
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
