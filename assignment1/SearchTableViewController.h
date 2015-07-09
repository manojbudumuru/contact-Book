//
//  SearchTableViewController.h
//  assignment1
//
//  Created by Saibersys on 5/18/15.
//  Copyright (c) 2015 Saibersys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property NSArray *dataArray1;
@property NSMutableArray *data;
@property NSMutableArray *dataNew;
@end
