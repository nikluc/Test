//
//  ExpensesViewController.h
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "DetailsViewController.h"


@interface ExpensesViewController : UIViewController<UITextFieldDelegate>


{
    
    
    
    IBOutlet UITextField *shiftTextField;
    IBOutlet UITextField *dateChangeTextField;
    IBOutlet UITextField *startMileageTextField;
    IBOutlet UITextField *finishMileageTextField;
    IBOutlet UITextField *pickUpPointTextField;
    IBOutlet UITextField *viaTaxiTextField;
    IBOutlet UITextField *dropPointTextField;
    
    IBOutlet UITextField *tipOneTextField;
    IBOutlet UITextField *tipTwoTextField;
    IBOutlet UITextField *cashOneTextField;
    IBOutlet UITextField *cashTwoTextField;
    IBOutlet UITextField *accountOneTextField;
    IBOutlet UITextField *accountTwoTextField;
    
    IBOutlet UITextField *tipsDiscountTextField;
    IBOutlet UITextField *cashPriceTextField;
    IBOutlet UITextField *accountTextField;
    IBOutlet UITextField *totalSumTextField;
    IBOutlet UIScrollView *myScrollView;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIButton *saveData;
    
    IBOutlet UIButton *grandTotalExp;
    
}
@property (nonatomic, strong) NSString *dshift;
@property (nonatomic, strong) NSString *ddate;
@property (nonatomic, strong) NSString *dstart;
@property (nonatomic, strong) NSString *dfinish;
@property (nonatomic, strong) NSString *dpick;
@property (nonatomic, strong) NSString *dvia;
@property (nonatomic, strong) NSString *ddrop;

@property (nonatomic, strong) NSString *dtip;
@property (nonatomic, strong) NSString *dcash;
@property (nonatomic, strong) NSString *daccount;
@property (nonatomic, strong) NSString *dtotal;

@property (nonatomic, strong) NSString *uniqueId;






-(IBAction)saveData:(id)sender;
- (IBAction)grandTotalExp:(id)sender;

- (IBAction)pickerDateChanged:(UIDatePicker *)sender;


@end







