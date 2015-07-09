//
//  NewTableViewController.m
//  assignment1
//
//  Created by Saibersys on 5/11/15.
//  Copyright (c) 2015 Saibersys. All rights reserved.
//

#import "NewTableViewController.h"
#import "DetaildViewController.h"
#import "SearchTableViewController.h"

@interface NewTableViewController ()

@end

@implementation NewTableViewController
@synthesize dataArray;
@synthesize dict;



- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://solstice.applauncher.com/external/contacts.json"]];
    NSLog(@"%@",request);
    //NSError * error;
    NSData * data =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@",array[0]);
    dataArray=[[NSArray alloc] initWithArray:array];
    
    //dict =[[NSDictionary alloc]ini
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    int x= dataArray.count;
//}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text=dataArray[indexPath.row][@"name"];
    NSString * str=dataArray[indexPath.row][@"phone"][@"work"];
    NSArray * newArray=[str componentsSeparatedByString:@"-"];
    NSString * newString=[NSString stringWithFormat:@"(%@)%@-%@",newArray[0],newArray[1],newArray[2]];
    cell.detailTextLabel.text=newString;
    NSString *string=dataArray[indexPath.row][@"smallImageURL"];
    NSURL * url=[NSURL URLWithString:string];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    UIImage * image= [[UIImage alloc]initWithData:data];
    cell.imageView.image=image;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if([segue.identifier  isEqual: @"search"])
    {
        SearchTableViewController * search=[segue destinationViewController];
        [search setDataArray1:dataArray];
        
    }
    else
    {
   DetaildViewController * view=[segue destinationViewController];
    NSIndexPath * path= [[self tableView] indexPathForSelectedRow];
    NSDictionary * newDict=[dataArray objectAtIndex:[path row]];
    [view setDetailDict:newDict];
    }
    
    // Pass the selected object to the new view controller.
}

@end
