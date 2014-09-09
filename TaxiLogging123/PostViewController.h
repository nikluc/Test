//
//  PostViewController.h
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


@interface PostViewController : UIViewController


{
    IBOutlet UITextField *datePickerTwoTextField;
    IBOutlet UITextField *onePenceSecondTextField;
    IBOutlet UITextField *oneTotalPenceSecondTextField;
    IBOutlet UITextField *twoPenceSecondTextField;
    IBOutlet UITextField *twoTotalPenceSecondTextField;
    IBOutlet UITextField *fivePenceSecondTextField;
    IBOutlet UITextField *fiveTotalPenceSecondTextField;
    IBOutlet UITextField *tenPenceSecondTextField;
    IBOutlet UITextField *tenTotalPenceSecondTextField;
    IBOutlet UITextField *twentyPenceSecondTextField;
    IBOutlet UITextField *twentyTotalPenceSecondTextField;
    IBOutlet UITextField *fiftyPenceSecondTextField;
    IBOutlet UITextField *fiftyTotalPenceSecondTextField;
    IBOutlet UITextField *oneNoteSecondTextField;
    IBOutlet UITextField *oneTotalNoteSecondTextField;
    IBOutlet UITextField *twoNoteSecondTextField;
    IBOutlet UITextField *twoTotalNoteSecondTextField;
    IBOutlet UITextField *fiveNoteSecondTextField;
    IBOutlet UITextField *fiveTotalNoteSecondTextField;
    IBOutlet UITextField *tenNoteSecondTextField;
    IBOutlet UITextField *tenTotalNoteSecondTextField;
    IBOutlet UITextField *twentyNoteSecondTextField;
    IBOutlet UITextField *twentyTotalNoteSecondTextField;
    IBOutlet UITextField *fiftyNoteSecondTextField;
    IBOutlet UITextField *fiftyTotalNoteSecondTextField;
    
    
    IBOutlet UITextField *openingFloatSecondTextField;
    IBOutlet UITextField *fuelReceiptsTextField;
    IBOutlet UITextField *premierCashShareTextField;
    IBOutlet UITextField *premierAccountShareTextField;
    IBOutlet UITextField *totalCashSecondTextField;
    IBOutlet UITextField *currentDepositSecondTextField;
    IBOutlet UITextField *totalTakingsTextField;
    IBOutlet UITextField *expectedTakingsTextField;
    IBOutlet UITextField *cashUnderOverTextField;
    IBOutlet UITextField *newSafeSecondTextField;
    IBOutlet UITextField *totalSafeSecondTextField;
    IBOutlet UITextField *newOpeningSecondTextField;
    IBOutlet UIScrollView *myScrollView;
    IBOutlet UIDatePicker *datePicker;
    
}
-(IBAction)totalCashPostShift:(id)sender;
-(IBAction)totalSafePostShift:(id)sender;
-(IBAction)savePostShift:(id)sender;
-(IBAction)viewDetailsPostShift:(id)sender;
-(IBAction)pickerDateChanged:(UIDatePicker *)sender; 
 


@end
