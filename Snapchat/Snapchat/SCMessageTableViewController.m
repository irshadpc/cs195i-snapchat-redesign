//
//  SCMessageTableViewController.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCMessageTableViewController.h"
#import "UIColor+SCColorPalette.h"
@interface SCMessageTableViewController ()

@end

@implementation SCMessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle: @"Messages"];
        [tbi setImage: [UIImage imageNamed:@"pusheen"]];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor :[UIColor lightGreenColor] }
                                                 forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor darkGreenColor] }
                                                 forState:UIControlStateHighlighted];
        // Custom initialization
        SCMessage *message1 = [[SCMessage alloc]init];
        message1.seen = false;
        message1.sender = @"Jake Kaufman";
        message1.timestamp = [NSDate date];
        message1.isVideo = false;
        
        SCMessage *message2 = [[SCMessage alloc]init];
        message2.seen = false;
        message2.sender = @"Jake Kaufman";
        message2.timestamp = [NSDate date];
        message2.isVideo = false;
        
        SCMessage *message3 = [[SCMessage alloc]init];
        message3.seen = true;
        message3.sender = @"Jake Kaufman";
        message3.timestamp = [NSDate date];
        message3.isVideo = false;
        
        self.messages = [NSMutableArray array];
        [self.messages addObject: message1];
        [self.messages addObject: message2];
        [self.messages addObject:message3];
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, 320, 1)];
        separatorLineView.backgroundColor = [UIColor separatorColor]; // set color as you want.
        [cell.contentView addSubview:separatorLineView];

    }
    
    SCMessage *message = (SCMessage *)[self.messages objectAtIndex:indexPath.row];
    UIImage *icon = [UIImage imageNamed:@"pusheen"];
    cell.imageView.image = icon;
    cell.textLabel.text = message.sender;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString* time = [dateFormatter stringFromDate: message.timestamp];
    cell.detailTextLabel.text = time;
    
    cell.detailTextLabel.textColor = [UIColor grayColor];
    if (message.seen) {
        cell.textLabel.textColor = [UIColor grayColor];
    }
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"FRAnzzzzzz";
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
