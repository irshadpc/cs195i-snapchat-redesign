//
//  SCSearchResultsController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/6/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSearchResultsController.h"
#import "UIColor+SCColorPalette.h"
@interface SCSearchResultsController ()

@end

@implementation SCSearchResultsController
@synthesize contacts;

@synthesize users;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.contacts = [NSMutableArray array];
        SCFriend *friend1 = [[SCFriend alloc]init];
        friend1.username = @"ac115";
        friend1.nickname = @"Alex Chou";
        [self.contacts addObject:friend1];
        // Custom initialization
        self.users = [NSMutableArray array];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return [self.contacts count];
    } else {
        return [self.users count];
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
    if (section == 0) {
        tempLabel.text = @"Snapchat users in your contacts";
    } else {;
        tempLabel.text = @"Snapchat users with username";
    }
    [tempView addSubview:tempLabel];

    return tempView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    SCFriend *user;
    if (indexPath.section == 0) {
        user = [self.contacts objectAtIndex:indexPath.row];
    } else {
        user = [self.users objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = user.nickname;
    cell.detailTextLabel.text = user.username;
    
    UIButton *acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(width -40, 12, 24, 24)];
    [acceptButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [acceptButton addTarget:self action:@selector(acceptFriend:) forControlEvents:UIControlEventTouchUpInside];
    //[acceptButton setImage:[UIImage imageNamed:@"lightGreenCheckSmall"] forState:UIControlStateSelected];
    [cell addSubview:acceptButton];
    
    return cell;
}
- (void)acceptFriend:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:@"darkGreenCheckSmall"] forState:UIControlStateNormal];
    //fire some stuff maybe?
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
