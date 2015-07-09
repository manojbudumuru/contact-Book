//
//  SearchTableViewController.m
//  assignment1
//
//  Created by Saibersys on 5/18/15.
//  Copyright (c) 2015 Saibersys. All rights reserved.
//

#import "SearchTableViewController.h"
#import "DetaildViewController.h"

@interface SearchTableViewController ()
@property NSString * string;
@end

@implementation SearchTableViewController
@synthesize data;
@synthesize dataNew;
@synthesize dataArray1;
@synthesize string;

- (void)viewDidLoad {
    [super viewDidLoad];
    data =[[NSMutableArray alloc]initWithArray:dataArray1];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search" forIndexPath:indexPath];
    
    NSString *str1=data[indexPath.row][@"name"];
   
        cell.textLabel.text=str1;
        NSString * str=data[indexPath.row][@"phone"][@"work"];
        NSArray * newArray=[str componentsSeparatedByString:@"-"];
        NSString * newString=[NSString stringWithFormat:@"(%@)%@-%@",newArray[0],newArray[1],newArray[2]];
        cell.detailTextLabel.text=newString;
        NSString *string1=data[indexPath.row][@"smallImageURL"];
        NSURL * url=[NSURL URLWithString:string1];
        NSData *data1=[[NSData alloc]initWithContentsOfURL:url];
        UIImage * image= [[UIImage alloc]initWithData:data1];
        cell.imageView.image=image;
    // Configure the cell...
    
    return cell;
}



//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search" forIndexPath:indexPath];
//    //[tableView.visibleCells sortedArrayHint [dataA]];
//       // Return NO if you do not want the specified item to be editable.
//    
//    return YES;
//}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    DetaildViewController * view=[segue destinationViewController];
    NSIndexPath * path= [[self tableView] indexPathForSelectedRow];
    NSDictionary * newDict=[data objectAtIndex:[path row]];
    [view setDetailDict:newDict];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.search.text=@"";
    [self.search resignFirstResponder];
    data=[[NSMutableArray alloc]initWithArray:dataArray1];
    [self.tableView reloadData];
    
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0)
{
    return true;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    data =[[NSMutableArray alloc]initWithArray:dataArray1];
    dataNew=[[NSMutableArray alloc]init];

    for (int i=0; i<data.count; i++) {
        NSString *stringInArray= data[i][@"name"];
        if ([stringInArray containsString:[searchText capitalizedString]]) {
            [dataNew addObject:data[i]];
        }
        
    }
    if (dataNew.count!=0) {
         data=[[NSMutableArray alloc]initWithArray:dataNew];
        [self.tableView reloadData];
        
        
    }
    if ([searchText  isEqual: @""]) {
        [self searchBarCancelButtonClicked:searchBar];
    }
   
    
    
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    data =[[NSMutableArray alloc]initWithArray:dataArray1];
    [self.search resignFirstResponder];
    dataNew=[[NSMutableArray alloc]init];

    for (int i=0; i<data.count; i++) {
       NSString *stringInArray= data[i][@"name"];
        if ([stringInArray containsString:[self.search.text capitalizedString]]) {
            [dataNew addObject:data[i]];
        }
        
    }
   
        data=[[NSMutableArray alloc]initWithArray:dataNew];
        [self.tableView reloadData];
    

}
@end
