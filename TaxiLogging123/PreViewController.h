//
//  PreViewController.h
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface PreViewController : UIViewController 

{
    
    CGFloat animatedDistance;

    IBOutlet UITextField *datePickerOneTextField;
    IBOutlet UITextField *onePenceTextField;
    IBOutlet UITextField *oneTotalPenceTextField;
    IBOutlet UITextField *twoPenceTextField;
    IBOutlet UITextField *twoTotalPenceTextField;
    IBOutlet UITextField *fivePenceTextField;
    IBOutlet UITextField *fiveTotalPenceTextField;
    IBOutlet UITextField *tenPenceTextField;
    IBOutlet UITextField *tenTotalPenceTextField;
    IBOutlet UITextField *twentyPenceTextField;
    IBOutlet UITextField *twentyTotalPenceTextField;
    IBOutlet UITextField *fiftyPenceTextField;
    IBOutlet UITextField *fiftyTotalPenceTextField;
    IBOutlet UITextField *oneNoteTextField;
    IBOutlet UITextField *oneTotalNoteTextField;
    IBOutlet UITextField *twoNoteTextField;
    IBOutlet UITextField *twoTotalNoteTextField;
    IBOutlet UITextField *fiveNoteTextField;
    IBOutlet UITextField *fiveTotalNoteTextField;
    IBOutlet UITextField *tenNoteTextField;
    IBOutlet UITextField *tenTotalNoteTextField;
    IBOutlet UITextField *twentyNoteTextField;
    IBOutlet UITextField *twentyTotalNoteTextField;
    IBOutlet UITextField *fiftyNoteTextField;
    IBOutlet UITextField *fiftyTotalNoteTextField;
    IBOutlet UITextField *expectedFloatTextField;
    IBOutlet UITextField *totalCashTextField;
    IBOutlet UITextField *differenceTextField;
    IBOutlet UITextField *currentDepositTextField;
    IBOutlet UITextField *newSafeTextField;
    IBOutlet UITextField *totalSafeTextField;
    IBOutlet UITextField *newFloatTextField;
    IBOutlet UIScrollView *myScrollView;
    IBOutlet UIDatePicker *datePicker;

}
@property (strong, nonatomic) UIButton *savePreShift;
@property (strong, nonatomic) UIButton *viewDetails;

-(IBAction)totalCashPreShift:(id)sender;
-(IBAction)totalSafePreShift:(id)sender;
//-(IBAction)savePreShift:(id)sender;
//-(IBAction)viewDetails:(id)sender;
-(IBAction)pickerDateChanged:(UIDatePicker *)sender;

@end
