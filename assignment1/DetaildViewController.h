//
//  DetaildViewController.h
//  assignment1
//
//  Created by Saibersys on 5/11/15.
//  Copyright (c) 2015 Saibersys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetaildViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *workPh;
@property (weak, nonatomic) IBOutlet UILabel *homePh;
@property (weak, nonatomic) IBOutlet UILabel *mobilePh;
@property (weak, nonatomic) IBOutlet UIImageView *pic;

@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *bDay;
@property (weak, nonatomic) IBOutlet UILabel *email;

@property NSDictionary * detailDict;
@property NSDictionary * detailsDict2;

@end
