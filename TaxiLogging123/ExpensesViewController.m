//
//  ExpensesViewController.m
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "ExpensesViewController.h"


@interface ExpensesViewController ()
@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;


@end

@implementation ExpensesViewController
@synthesize daccount,dcash,ddate,ddrop,dfinish,dpick,dshift,dstart,dtip,dtotal,dvia,uniqueId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    
     shiftTextField.text = dshift;
     dateChangeTextField.text = ddate;
    startMileageTextField.text =dstart;
    finishMileageTextField.text =dfinish ;
    pickUpPointTextField.text =dpick;
    viaTaxiTextField.text =dvia;
    dropPointTextField.text =ddrop;
    tipsDiscountTextField.text =dtip;
    cashPriceTextField.text =dcash;
    accountTextField.text =daccount;
    totalSumTextField.text =dtotal;
   
    
    NSLog(@"fsdfsdgfsd %@",uniqueId);
    
    

}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   [self setUpTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpTextField {   

    
    self.dateFormatter = [[NSDateFormatter alloc] init];
     [self.dateFormatter setDateFormat: @"yyyy-MM-dd"];
   // [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  //  [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *defaultDate = [NSDate date];
    
    self->dateChangeTextField.text = [self.dateFormatter stringFromDate:defaultDate];
    self->dateChangeTextField.textColor = [self.view tintColor];
    self->datePicker.hidden = NO;
    self->datePicker.alpha = 0.0f;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self->datePicker.alpha = 1.0f;
        
    }];

    
    self.selectedDate = defaultDate;
    
}


-(IBAction)grandTotalExp:(id)sender
{
    NSLog(@"button clicked expenses");
    float tipOneTipTwo = [tipOneTextField.text floatValue] + [tipTwoTextField.text floatValue];
    [tipsDiscountTextField setText:[NSString stringWithFormat:@"%.2f", tipOneTipTwo]];
    
    
    float cashOnecashTwo = [cashOneTextField.text floatValue] + [cashTwoTextField.text floatValue];
    [cashPriceTextField setText:[NSString stringWithFormat:@"%.2f", cashOnecashTwo]];
    
    
    float accountOneaccountTwo = [accountOneTextField.text floatValue] + [accountTwoTextField.text floatValue];
    [accountTextField setText:[NSString stringWithFormat:@"%.2f", accountOneaccountTwo]];
    
    float tipPlusCashPlusAccount = [tipsDiscountTextField.text floatValue] + [cashPriceTextField.text floatValue] + [accountTextField.text floatValue];
    [totalSumTextField setText:[NSString stringWithFormat:@"%.2f", tipPlusCashPlusAccount]];
    
 
    
}





-(IBAction)saveData:(id)sender
{


    
      NSString *alertFields = @"Enter required fields";
    
    
    
    if (pickUpPointTextField.text.length>0 &&dropPointTextField.text.length>0 &&tipsDiscountTextField.text.length>0 &&cashPriceTextField.text.length>0 &&totalSumTextField.text.length>0  &&shiftTextField.text.length>0)
    {
        
        if (uniqueId != nil) {
            
            [[DBManager getSharedInstance]updateExpenses:dateChangeTextField.text startMileage:startMileageTextField.text finishMileage:finishMileageTextField.text pickUpPoint:pickUpPointTextField.text viaTaxi:viaTaxiTextField.text dropPoint:dropPointTextField.text tipsDiscount:tipsDiscountTextField.text cashPrice:cashPriceTextField.text accountTotal:accountTextField.text totalSum:totalSumTextField.text shift:shiftTextField.text idExp:uniqueId ];
            NSLog(@"update expenses");
           }
        
        else{
     
        
        
        [[DBManager getSharedInstance]saveData:dateChangeTextField.text startMileage:startMileageTextField.text finishMileage:finishMileageTextField.text pickUpPoint:pickUpPointTextField.text viaTaxi:viaTaxiTextField.text dropPoint:dropPointTextField.text tipsDiscount:tipsDiscountTextField.text cashPrice:cashPriceTextField.text accountTotal:accountTextField.text totalSum:totalSumTextField.text shift:shiftTextField.text];
            NSLog(@"insert expense");
        }
        
        self->startMileageTextField.text =@"";
        self->finishMileageTextField.text = @"";
        self->pickUpPointTextField.text =@"";
        self->viaTaxiTextField.text =@"";
        self->dropPointTextField.text =@"";
        self->tipsDiscountTextField.text =@"";
        self->cashPriceTextField.text =@"";
        self->accountTextField.text =@"";
        self->totalSumTextField.text =@"";
        self->tipOneTextField.text =@"";
        self->tipTwoTextField.text =@"";
        self->cashOneTextField.text =@"";
        self->cashTwoTextField.text =@"";
        self->accountOneTextField.text =@"";
        self->accountTwoTextField.text =@"";
        [self.view endEditing:YES];


    }
    
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertFields message:@"Enter the required fields !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

    }
}


#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [myScrollView setFrame:CGRectMake(10, 50, 300, 200)];
    [myScrollView setContentSize:CGSizeMake(300, 350)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [myScrollView setFrame:CGRectMake(10, 50, 300, 350)];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)pickerDateChanged:(UIDatePicker *)sender {
    
    self->dateChangeTextField.text =  [self.dateFormatter stringFromDate:sender.date];
    
    self.selectedDate = sender.date;
    self->shiftTextField.text = @"";
    [self.view endEditing:YES];
}

@end
