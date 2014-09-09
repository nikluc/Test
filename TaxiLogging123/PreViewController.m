//
//  PreViewController.m
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "PreViewController.h"

#define kOFFSET_FOR_KEYBOARD 80.0

@interface PreViewController ()

@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;




@end
//(NSString *)changeButtonTitle ;
@implementation PreViewController


@synthesize savePreShift, viewDetails;
//UIButton *buttonSender;



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
    [self registerForKeyboardNotifications];
//[buttonSender setTitle:@"sAvE" forState:UIControlStateNormal];
    }
/*
- (void)setButtonTitle { // can't change button title
    [viewDetails setTitle:@"buttonTitle" forState:UIControlStateNormal];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    onePenceTextField = nil;
    twoPenceTextField = nil;
    fivePenceTextField = nil;
    tenPenceTextField = nil;
    twentyPenceTextField = nil;
    fiftyPenceTextField = nil;
    oneNoteTextField = nil;
    twoNoteTextField = nil;
    fiveNoteTextField = nil;
    tenNoteTextField = nil;
    twentyNoteTextField = nil;
    fiftyNoteTextField = nil;
    newSafeTextField = nil;
    
    //activeField = nil;
    myScrollView = nil;
    [self unregisterForKeyboardNotifications];
    
  
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *lastCurrentDeposit = [[DBManager getSharedInstance]retrieve];
    NSLog(@"lastCurrentDeposit : %@", lastCurrentDeposit);
    
    currentDepositTextField.text=lastCurrentDeposit;
    
    
    NSString *lastOpeningFloat = [[DBManager getSharedInstance]preExpectedOpeningFloat];
    NSLog(@"Expected opening float : %@", lastOpeningFloat);
    
    expectedFloatTextField.text=lastOpeningFloat;
    NSLog(@"Viewwillappear in pre"); 
    
     [self setUpTextField];
 
 //   [savePreShift setTitle:@"sAVe" forState:UIControlStateNormal];
 //   [self setButtonTitle];

    
}




- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    onePenceTextField.text = @"";
    oneTotalPenceTextField.text =@"";
    twoPenceTextField.text = @"";
    twoTotalPenceTextField.text =@"";
    fivePenceTextField.text =@" ";
    fiveTotalPenceTextField.text =@"";
    tenPenceTextField.text =@" ";
    tenTotalPenceTextField.text =@"";
    twentyPenceTextField.text =@"";
    twentyTotalPenceTextField.text = @"";
    fiftyPenceTextField.text =@"";
    fiftyTotalPenceTextField.text = @"";
    oneNoteTextField.text =@"";
    oneTotalNoteTextField.text =@"";
    twoNoteTextField.text =@"";
    twoTotalNoteTextField.text =@"";
    fiveNoteTextField.text =@"";
    fiveTotalNoteTextField.text =@"";
    tenNoteTextField.text = @"";
    tenTotalNoteTextField.text =@"";
    twentyNoteTextField.text = @"";
    twentyTotalNoteTextField.text =@"";
    fiftyNoteTextField.text =@"";
    fiftyTotalNoteTextField.text =@"";
    differenceTextField.text =@"";
    expectedFloatTextField.text =@"";
    currentDepositTextField.text =@"";
    totalCashTextField.text =@"";
    newSafeTextField.text =@"";
    totalSafeTextField.text =@"";
    newFloatTextField.text =@"";
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpTextField {
    

    self.dateFormatter = [[NSDateFormatter alloc] init];
     [self.dateFormatter setDateFormat: @"yyyy-MM-dd"];
  
    
    NSDate *defaultDate = [NSDate date];
    
    datePickerOneTextField.text = [self.dateFormatter stringFromDate:defaultDate];
    datePickerOneTextField.textColor = [self.view tintColor];
    datePicker.hidden = NO;
    datePicker.alpha = 0.0f;
    [datePicker reloadInputViews];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self->datePicker.alpha = 1.0f;
        
    }];
    self.selectedDate = defaultDate;
    datePicker.date = [NSDate date];
}




-(IBAction)savePreShift:(id)sender
{
  // buttonSender = (UIButton *)sender;
   BOOL success = NO;
    NSString *alertFields = @"Enter required fields";
 if(  totalCashTextField.text.length>0 &&totalSafeTextField.text.length>0)
 {
    
  success = [[DBManager getSharedInstance]savePreShift:datePickerOneTextField.text onePence:onePenceTextField.text oneTotalPence:oneTotalPenceTextField.text twoPence:twoPenceTextField.text twoTotalPence:twoTotalPenceTextField.text fivePence:fivePenceTextField.text fiveTotalPence:fiveTotalPenceTextField.text tenPence:tenPenceTextField.text tenTotalPence:tenTotalPenceTextField.text twentyPence:twentyPenceTextField.text twentyTotalPence:twentyTotalPenceTextField.text fiftyPence:fiftyPenceTextField.text fiftyTotalPence:fiftyTotalPenceTextField.text oneNote:oneNoteTextField.text oneTotalNote:oneTotalNoteTextField.text twoNote:twoNoteTextField.text twoTotalNote:twoTotalNoteTextField.text fiveNote:fiveNoteTextField.text fiveTotalNote:fiveTotalNoteTextField.text tenNote:tenNoteTextField.text tenTotalNote:tenTotalNoteTextField.text twentyNote:twentyNoteTextField.text twentyTotalNote:twentyTotalNoteTextField.text fiftyNote:fiftyNoteTextField.text fiftyTotalNote:fiftyTotalNoteTextField.text difference:differenceTextField.text expectedFloat:expectedFloatTextField.text currentDeposit:currentDepositTextField.text totalCash:totalCashTextField.text newSafe:newSafeTextField.text totalSafe:totalSafeTextField.text newFloat:newFloatTextField.text];
        
    if (success == NO){
        NSLog(@"not inserted");
    }
        
        self->onePenceTextField.text = @"";
           self->oneTotalPenceTextField.text =@"";
           self->twoPenceTextField.text = @"";
           self->twoTotalPenceTextField.text =@"";
           self->fivePenceTextField.text =@"";
           self->fiveTotalPenceTextField.text =@"";
           self->tenPenceTextField.text =@"";
           self->tenTotalPenceTextField.text =@"";
           self->twentyPenceTextField.text =@"";
           self->twentyTotalPenceTextField.text = @"";
           self->fiftyPenceTextField.text =@"";
           self->fiftyTotalPenceTextField.text = @"";
           self->oneNoteTextField.text =@"";
           self->oneTotalNoteTextField.text =@"";
           self->twoNoteTextField.text =@"";
           self->twoTotalNoteTextField.text =@"";
           self->fiveNoteTextField.text =@"";
           self->fiveTotalNoteTextField.text =@"";
           self->tenNoteTextField.text = @"";
           self->tenTotalNoteTextField.text =@"";
           self->twentyNoteTextField.text = @"";
           self->twentyTotalNoteTextField.text =@"";
           self->fiftyNoteTextField.text =@"";
           self->fiftyTotalNoteTextField.text =@"";
           self->differenceTextField.text =@"";
           self->expectedFloatTextField.text =@"";
           self->currentDepositTextField.text =@"";
           self->totalCashTextField.text =@"";
           self->newSafeTextField.text =@"";
           self->totalSafeTextField.text =@"";
           self->newFloatTextField.text =@"";
           [self.view endEditing:YES];
     
     
 }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertFields message:@"Enter the required fields !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    

  
    
}
    

    
-(IBAction)totalCashPreShift:(id)sender
{
    
    
    float a = 0.01;
    float b = 0.02;
    float c = 0.05;
    float d = 0.1;
    float e = 0.2;
    float f = 0.5;
    float m = 1;
    float n = 2;
    float o = 5;
    float p = 10;
    float q = 20;
    float r = 50;
    
    float g = [[onePenceTextField text] floatValue];
    float h = [[twoPenceTextField text] floatValue];
    float i = [[fivePenceTextField text] floatValue];
    float j = [[tenPenceTextField text] floatValue];
    float k = [[twentyPenceTextField text] floatValue];
    float l = [[fiftyPenceTextField text] floatValue];
    float s = [[oneNoteTextField text] floatValue];
    float t = [[twoNoteTextField text] floatValue];
    float u = [[fiveNoteTextField text] floatValue];
    float v = [[tenNoteTextField text] floatValue];
    float w = [[twentyNoteTextField text] floatValue];
    float x = [[fiftyNoteTextField text] floatValue];
    float expOpeningFloatVal = [[expectedFloatTextField text] floatValue];
    
    
    [oneTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", a * g]];
    [twoTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", b * h]];
    [fiveTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", c * i]];
    [tenTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", d * j]];
    [twentyTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", e * k]];
    [fiftyTotalPenceTextField setText:[NSString stringWithFormat:@"%.2f", f * l]];
    [oneTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", m * s]];
    [twoTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", n * t]];
    [fiveTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", o * u]];
    [tenTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", p * v]];
    [twentyTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", q * w]];
    [fiftyTotalNoteTextField setText:[NSString stringWithFormat:@"%.2f", r * x]];
    float y = [oneTotalPenceTextField.text floatValue] + [twoTotalPenceTextField.text floatValue] + [fiveTotalPenceTextField.text floatValue] + [tenTotalPenceTextField.text floatValue] + [twentyTotalPenceTextField.text floatValue] + [fiftyTotalPenceTextField.text floatValue] + [oneTotalNoteTextField.text floatValue] + [twoTotalNoteTextField.text floatValue] + [fiveTotalNoteTextField.text floatValue] + [tenTotalNoteTextField.text floatValue] + [twentyTotalNoteTextField.text floatValue] + [fiftyTotalNoteTextField.text floatValue];
    [totalCashTextField setText:[NSString stringWithFormat:@"%.2f", y]];
    [newFloatTextField setText:[NSString stringWithFormat:@"%.2f", y]];
    [differenceTextField setText:[NSString stringWithFormat:@"%.2f", y - expOpeningFloatVal]];
}
-(IBAction)totalSafePreShift:(id)sender
{
    
    float totalSafeDeposit = [currentDepositTextField.text floatValue] + [newSafeTextField.text floatValue];
    [totalSafeTextField setText:[NSString stringWithFormat:@"%.2f", totalSafeDeposit]];

}



-(IBAction)viewDetails:(id)sender
{
  //[buttonSender setTitle:@"Update" forState:UIControlStateNormal];
    NSArray *data = [[DBManager getSharedInstance]viewDetails:datePickerOneTextField.text];
    
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Preshift values" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    //  [buttonSender setTitle:@"sAvE" forState:UIControlStateNormal];
// [self.savePreAction setTitle:@"SaVe" forState:UIControlStateNormal];
        onePenceTextField.text =@"";
        oneTotalPenceTextField.text =@"";
        twoPenceTextField.text =@" ";
        twoTotalPenceTextField.text =@"";
        fivePenceTextField.text =@"";
        fiveTotalPenceTextField.text =@"";
        tenPenceTextField.text =@"";
        tenTotalPenceTextField.text =@"";
        twentyPenceTextField.text =@"";
        twentyTotalPenceTextField.text =@"";
        fiftyPenceTextField.text =@"";
        fiftyTotalPenceTextField.text =@"";
        oneNoteTextField.text =@"";
        oneTotalNoteTextField.text =@"";
        twoNoteTextField.text =@"";
        twoTotalNoteTextField.text =@"";
        fiveNoteTextField.text =@"";
        fiveTotalNoteTextField.text =@"";
        tenNoteTextField.text =@"";
        tenTotalNoteTextField.text =@"";
        twentyNoteTextField.text =@"";
        twentyTotalNoteTextField.text =@"";
        fiftyNoteTextField.text =@"";
        fiftyTotalNoteTextField.text =@"";
        differenceTextField.text =@"";
        expectedFloatTextField.text =@"";
        currentDepositTextField.text =@"";
        totalCashTextField.text =@"";
        newSafeTextField.text =@"";
        totalSafeTextField.text =@"";
        newFloatTextField.text =@"";
        
      
        
       
    }
    else{
        
     //    [self.savePreAction setTitle:@"UPDATE" forState:UIControlStateNormal];
     //   [buttonSender setTitle:@"Update" forState:UIControlStateNormal];
        onePenceTextField.text =[data objectAtIndex:0];
        oneTotalPenceTextField.text =[data objectAtIndex:1];
        twoPenceTextField.text =[data objectAtIndex:2];
        twoTotalPenceTextField.text =[data objectAtIndex:3];
        fivePenceTextField.text =[data objectAtIndex:4];
        fiveTotalPenceTextField.text =[data objectAtIndex:5];
        tenPenceTextField.text =[data objectAtIndex:6];
        tenTotalPenceTextField.text =[data objectAtIndex:7];
        twentyPenceTextField.text =[data objectAtIndex:8];
        twentyTotalPenceTextField.text =[data objectAtIndex:9];
        fiftyPenceTextField.text =[data objectAtIndex:10];
        fiftyTotalPenceTextField.text =[data objectAtIndex:11];
        oneNoteTextField.text =[data objectAtIndex:12];
        oneTotalNoteTextField.text =[data objectAtIndex:13];
        twoNoteTextField.text =[data objectAtIndex:14];
        twoTotalNoteTextField.text =[data objectAtIndex:15];
        fiveNoteTextField.text =[data objectAtIndex:16];
        fiveTotalNoteTextField.text =[data objectAtIndex:17];
        tenNoteTextField.text =[data objectAtIndex:18];
        tenTotalNoteTextField.text =[data objectAtIndex:19];
        twentyNoteTextField.text =[data objectAtIndex:20];
        twentyTotalNoteTextField.text =[data objectAtIndex:21];
        fiftyNoteTextField.text =[data objectAtIndex:22];
        fiftyTotalNoteTextField.text =[data objectAtIndex:23];
        differenceTextField.text =[data objectAtIndex:24];
        expectedFloatTextField.text =[data objectAtIndex:25];
        currentDepositTextField.text =[data objectAtIndex:26];
        totalCashTextField.text =[data objectAtIndex:27];
        newSafeTextField.text =[data objectAtIndex:28];
        totalSafeTextField.text =[data objectAtIndex:29];
        newFloatTextField.text =[data objectAtIndex:30];
        
       
        

    }
   
}




- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
   // [myScrollView setFrame:CGRectMake(20, 100, 768, 1200)];
  //  [myScrollView setContentSize:CGSizeMake(768, 1200)];
    
    onePenceTextField = textField;
     twoPenceTextField = textField;
     fivePenceTextField = textField;
     tenPenceTextField = textField;
     twentyPenceTextField = textField;
     fiftyPenceTextField = textField;
     oneNoteTextField = textField;
     twoNoteTextField = textField;
    fiveNoteTextField = textField;
    tenNoteTextField = textField;
    twentyNoteTextField = textField;
    fiftyNoteTextField = textField;
    newSafeTextField = textField;
   
    //Add tap recognizer to scroll view, user can tap other part of scroll view to
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    [myScrollView addGestureRecognizer:tapRecognizer];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    //[myScrollView setFrame:CGRectMake(20, 100, 768, 1200)];
    
    onePenceTextField = nil;
    twoPenceTextField = nil;
    fivePenceTextField = nil;
    tenPenceTextField = nil;
    twentyPenceTextField = nil;
    fiftyPenceTextField = nil;
    oneNoteTextField = nil;
    twoNoteTextField = nil;
    fiveNoteTextField = nil;
    tenNoteTextField = nil;
    twentyNoteTextField = nil;
    fiftyNoteTextField = nil;
    newSafeTextField = nil;
}

//when the keyboard is number pad, there will be not reture key
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/*
 When user tap on the scroll view, the method is called to disable the keyboard
 */
- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    
    [onePenceTextField resignFirstResponder];
    [twoPenceTextField resignFirstResponder];
    [fivePenceTextField resignFirstResponder];
    [tenPenceTextField resignFirstResponder];
    [twentyPenceTextField resignFirstResponder];
    [fiftyPenceTextField resignFirstResponder];
    [oneNoteTextField resignFirstResponder];
    [twoNoteTextField resignFirstResponder];
    [fiveNoteTextField resignFirstResponder];
    [tenNoteTextField resignFirstResponder];
    [twentyNoteTextField resignFirstResponder];
    [fiftyNoteTextField resignFirstResponder];
    [newSafeTextField resignFirstResponder];
    
    //[activeField resignFirstResponder];
    [myScrollView removeGestureRecognizer:tapRecognizer];
}

#pragma mark - event of keyboard relative methods
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}


- (void)keyboardWillShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    CGRect frame = self.view.frame;
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        frame.size.height -= kbSize.height;
        
    }else{
        frame.size.height -= kbSize.width;
    }
    
    
    
    
    
    CGPoint fOrigin1 = onePenceTextField.frame.origin;
     CGPoint fOrigin2 = twoPenceTextField.frame.origin;
    CGPoint fOrigin3 = fivePenceTextField.frame.origin;
    CGPoint fOrigin4 = tenPenceTextField.frame.origin;
    CGPoint fOrigin5 = twentyPenceTextField.frame.origin;
    CGPoint fOrigin6 = fiftyPenceTextField.frame.origin;
    CGPoint fOrigin7 = oneNoteTextField.frame.origin;
    CGPoint fOrigin8 = twoNoteTextField.frame.origin;
    CGPoint fOrigin9 = fiveNoteTextField.frame.origin;
    CGPoint fOrigin10 = tenNoteTextField.frame.origin;
    CGPoint fOrigin11 = twentyNoteTextField.frame.origin;
    CGPoint fOrigin12 = fiftyNoteTextField.frame.origin;
    CGPoint fOrigin13 = newSafeTextField.frame.origin;
    
    fOrigin1.y -= myScrollView.contentOffset.y;
    fOrigin2.y -= myScrollView.contentOffset.y;
    fOrigin3.y -= myScrollView.contentOffset.y;
    fOrigin4.y -= myScrollView.contentOffset.y;
    fOrigin5.y -= myScrollView.contentOffset.y;
    fOrigin6.y -= myScrollView.contentOffset.y;
    fOrigin7.y -= myScrollView.contentOffset.y;
    fOrigin8.y -= myScrollView.contentOffset.y;
    fOrigin9.y -= myScrollView.contentOffset.y;
    fOrigin10.y -= myScrollView.contentOffset.y;
    fOrigin11.y -= myScrollView.contentOffset.y;
    fOrigin12.y -= myScrollView.contentOffset.y;
    fOrigin13.y -= myScrollView.contentOffset.y;
    
    
    fOrigin1.y += onePenceTextField.frame.size.height;
    fOrigin2.y += twoPenceTextField.frame.size.height;
    fOrigin3.y += fivePenceTextField.frame.size.height;
    fOrigin4.y += tenPenceTextField.frame.size.height;
    
    fOrigin5.y += twentyPenceTextField.frame.size.height;
    fOrigin6.y += fiftyPenceTextField.frame.size.height;
    fOrigin7.y += oneNoteTextField.frame.size.height;
    fOrigin8.y += twoNoteTextField.frame.size.height;
    fOrigin9.y += fiveNoteTextField.frame.size.height;
    
    fOrigin10.y += tenNoteTextField.frame.size.height;
    fOrigin11.y += twentyNoteTextField.frame.size.height;
    fOrigin12.y += fiftyNoteTextField.frame.size.height;
    fOrigin13.y += newSafeTextField.frame.size.height;
    
    
    if (!CGRectContainsPoint(frame, fOrigin1) ) {
        CGPoint scrollPoint = CGPointMake(0.0, onePenceTextField.frame.origin.y + onePenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin2) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twoPenceTextField.frame.origin.y + twoPenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin3) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fivePenceTextField.frame.origin.y + fivePenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin4) ) {
        CGPoint scrollPoint = CGPointMake(0.0, tenPenceTextField.frame.origin.y + tenPenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin5) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twentyPenceTextField.frame.origin.y + twentyPenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin6) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiftyPenceTextField.frame.origin.y + fiftyPenceTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin7) ) {
        CGPoint scrollPoint = CGPointMake(0.0, oneNoteTextField.frame.origin.y + oneNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin8) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twoNoteTextField.frame.origin.y + twoNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin9) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiveNoteTextField.frame.origin.y + fiveNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin10) ) {
        CGPoint scrollPoint = CGPointMake(0.0, tenNoteTextField.frame.origin.y + tenNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin11) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twentyNoteTextField.frame.origin.y + twentyNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin12) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiftyNoteTextField.frame.origin.y + fiftyNoteTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }

    if (!CGRectContainsPoint(frame, fOrigin13) ) {
        CGPoint scrollPoint = CGPointMake(0.0, newSafeTextField.frame.origin.y + newSafeTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }



}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [myScrollView setContentOffset:CGPointZero animated:YES];
}


- (IBAction)pickerDateChanged:(UIDatePicker *)sender {
    
    self->datePickerOneTextField.text =  [self.dateFormatter stringFromDate:sender.date];
    
    self.selectedDate = sender.date;
    
 //[savePreShift setTitle:@"Save" forState:UIControlStateNormal];
    
    
}

@end
