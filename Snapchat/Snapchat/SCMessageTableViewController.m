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
        [tbi setImage: [UIImage imageNamed:@"messagesTab"]];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor :[UIColor lightGreenColor] }
                                                 forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor darkGreenColor] }
                                                 forState:UIControlStateHighlighted];
        // Custom initialization
        SCMessage *message1 = [[SCMessage alloc]init];
        message1.seen = false;
        message1.sender = @"Jake Kaufman";
        message1.timestamp = @"Just Now";
        message1.isVideo = false;
        
        SCMessage *message2 = [[SCMessage alloc]init];
        message2.seen = true;
        message2.sender = @"Alex Chou";
        message2.timestamp = @"3 hours ago";
        message2.isVideo = false;
        
        SCMessage *message3 = [[SCMessage alloc]init];
        message3.seen = true;
        message3.sender = @"Jake Kaufman";
        message3.timestamp = @"5 hours ago";
        message3.isVideo = true;
        
        SCMessage *message4 = [[SCMessage alloc]init];
        message4.seen = true;
        message4.sender = @"Jessica Liang";
        message4.timestamp = @"Dec 04 11:52AM";
        message4.isVideo = false;
        
        SCMessage *message5 = [[SCMessage alloc]init];
        message5.seen = true;
        message5.sender = @"Jake Kaufman";
        message5.timestamp = @"Dec 04 4:30AM";
        message5.isVideo = false;
        
        SCMessage *message6 = [[SCMessage alloc]init];
        message6.seen = true;
        message6.sender = @"Alex Chou";
        message6.timestamp = @"Dec 03 11:11PM";
        message6.isVideo = true;
        
        SCMessage *message7 = [[SCMessage alloc]init];
        message7.seen = true;
        message7.sender = @"Evan Li";
        message7.timestamp = @"Dec 02 1:29PM";
        message7.isVideo = false;
        
        SCMessage *message8 = [[SCMessage alloc]init];
        message8.seen = true;
        message8.sender = @"Jake Kaufman";
        message8.timestamp = @"Dec 02 1:00PM";
        message8.isVideo = false;
        
        SCMessage *message9 = [[SCMessage alloc]init];
        message9.seen = true;
        message9.sender = @"Evan Li";
        message9.timestamp = @"Dec 01 10:58AM";
        message9.isVideo = true;
        
        SCMessage *message10 = [[SCMessage alloc]init];
        message10.seen = true;
        message10.sender = @"Jake Kaufman";
        message10.timestamp = @"Dec 01 1:23AM";
        message10.isVideo = false;
        
        SCMessage *message11 = [[SCMessage alloc]init];
        message11.seen = true;
        message11.sender = @"Jake Kaufman";
        message11.timestamp = @"Nov 28 5:47PM";
        message11.isVideo = false;
        
        SCMessage *message12 = [[SCMessage alloc]init];
        message12.seen = true;
        message12.sender = @"Alex Chou";
        message12.timestamp = @"Nov 28 3:19PM";
        message12.isVideo = true;
        
        self.messages = [NSMutableArray array];
        [self.messages addObject: message1];
        [self.messages addObject: message2];
        [self.messages addObject:message3];
        [self.messages addObject:message4];
        [self.messages addObject:message5];
        [self.messages addObject:message6];
        [self.messages addObject:message7];
        [self.messages addObject:message8];
        [self.messages addObject:message9];
        [self.messages addObject:message10];
        [self.messages addObject:message11];
        [self.messages addObject:message12];
        
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
    UIImage *icon;
    if (message.isVideo) {
        if (message.seen) {
            icon = [UIImage imageNamed:@"greyVideo"];
        } else {
            icon = [UIImage imageNamed:@"greenVideo"];
        }
    } else {
        if (message.seen) {
            icon = [UIImage imageNamed:@"greyPhoto"];
        } else {
            icon = [UIImage imageNamed:@"greenPhoto"];
        }
    }
    cell.imageView.image = icon;
    cell.textLabel.text = message.sender;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    cell.detailTextLabel.text = message.timestamp;
    
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    if (message.seen) {
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    
    return cell;
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
