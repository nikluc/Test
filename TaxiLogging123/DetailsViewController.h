//
//  DetailsViewController.h
//  TaxiLogging
//
//  Created by PPTS on 17/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface DetailsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,MFMailComposeViewControllerDelegate>

{
int shiftVar;
NSMutableArray *remainders;
    
    NSString *tipSum;
    NSString *cashSum;
    NSString *accountSum;
    NSString *totalSum;
  
}

@property (strong, nonatomic) IBOutlet UITextField *fromDate;
@property (strong, nonatomic) IBOutlet UITextField *toDate;
@property (strong, nonatomic) IBOutlet UITextField *grandTipText;
@property (strong, nonatomic) IBOutlet UITextField *grandCashText;
@property (strong, nonatomic) IBOutlet UITextField *grandAccountText;
@property (strong, nonatomic) IBOutlet UITextField *grandTotalText;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerFrom;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerTo;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UILabel *grandTip;
@property (strong, nonatomic) IBOutlet UILabel *grandCash;
@property (strong, nonatomic) IBOutlet UILabel *grandAccount;
@property (strong, nonatomic) IBOutlet UILabel *grandTotal;
@property (nonatomic) int shiftVar;

-(IBAction)findByDateChange:(id)sender;
-(IBAction)downloadFromDb:(id)sender;

- (IBAction)fromPickerDateChanged:(UIDatePicker *)sender;
- (IBAction)toPickerDateChanged:(UIDatePicker *)sender;
@end
