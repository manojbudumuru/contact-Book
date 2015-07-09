//
//  DetaildViewController.m
//  assignment1
//
//  Created by Saibersys on 5/11/15.
//  Copyright (c) 2015 Saibersys. All rights reserved.
//

#import "DetaildViewController.h"

@interface DetaildViewController ()

@end

@implementation DetaildViewController
@synthesize detailDict;
@synthesize detailsDict2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.name.text=detailDict[@"name"];
    self.company.text=detailDict[@"company"];
    
    self.homePh.text=detailDict[@"phone"][@"home"];
    self.workPh.text=detailDict[@"phone"][@"work"];
    self.mobilePh.text=detailDict[@"phone"][@"mobile"];
    double unixTimeStamp = [detailDict[@"birthdate"] doubleValue];
    NSTimeInterval _interval=unixTimeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setDateStyle:NSDateFormatterLongStyle];
    NSString *_date=[_formatter stringFromDate:date];

    self.bDay.text=_date;
    
    NSString *detailsString=detailDict[@"detailsURL"];
    NSURL * detailsURL=[NSURL URLWithString:detailsString];
    NSURLRequest * request=[NSURLRequest requestWithURL:detailsURL];
    NSData * detailsData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dictDetails=[NSJSONSerialization JSONObjectWithData:detailsData options:0 error:nil];
    detailsDict2=[[NSDictionary alloc] initWithDictionary:dictDetails];
    
    NSString *newAddress=[NSString stringWithFormat:@"%@,%@,%@,%@",detailsDict2[@"address"][@"street"],detailsDict2[@"address"][@"city"],detailsDict2[@"address"][@"state"],detailsDict2[@"address"][@"zip"]];
    self.address.text=newAddress;
    NSString *string=detailsDict2[@"largeImageURL"];
    NSURL * url=[NSURL URLWithString:string];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    UIImage * image= [[UIImage alloc]initWithData:data];
    self.pic.image=image;
    self.email.text=detailsDict2[@"email"];
    
    
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
