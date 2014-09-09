//
//  PostViewController.m
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "PostViewController.h"
#define kOFFSET_FOR_KEYBOARD 80.0

@interface PostViewController ()
@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation PostViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    onePenceSecondTextField = nil;
    twoPenceSecondTextField = nil;
    fivePenceSecondTextField = nil;
    tenPenceSecondTextField = nil;
    twentyPenceSecondTextField = nil;
    fiftyPenceSecondTextField = nil;
    oneNoteSecondTextField = nil;
    twoNoteSecondTextField = nil;
    fiveNoteSecondTextField = nil;
    tenNoteSecondTextField = nil;
    twentyNoteSecondTextField = nil;
    fiftyNoteSecondTextField = nil;
    fuelReceiptsTextField = nil;
    premierAccountShareTextField = nil;
    premierCashShareTextField = nil;
    newSafeSecondTextField = nil;
    
    //activeField = nil;
    myScrollView = nil;
    [self unregisterForKeyboardNotifications];
    
    
    
    
    
    
}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [self setUpTextField];
    
    
    NSString *cashFromPre = [[DBManager getSharedInstance]cashFromPreToPostOpeningFloat];
    NSLog(@"opening float postshift : %@", cashFromPre);
    
    openingFloatSecondTextField.text=cashFromPre;
    
    NSString *depositFromTotalSum = [[DBManager getSharedInstance]currentDepositFromTotalCashPost];
    NSLog(@"current deposit postshift : %@", depositFromTotalSum);
    
    currentDepositSecondTextField.text=depositFromTotalSum;
    
    NSString *expectedTakingExp = [[DBManager getSharedInstance]expectedTakingsFromTotalExpenses:datePickerTwoTextField.text];
    NSLog(@"expected takings : %@", expectedTakingExp);
    
    expectedTakingsTextField.text=expectedTakingExp;
    
    
    

   }



- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    
    
    onePenceSecondTextField.text = @"";
    oneTotalPenceSecondTextField.text = @"";
    twoPenceSecondTextField.text = @"";
    twoTotalPenceSecondTextField.text = @"";
    fivePenceSecondTextField.text = @"";
    fiveTotalPenceSecondTextField.text = @"";
    tenPenceSecondTextField.text = @"";
    tenTotalPenceSecondTextField.text = @"";
    twentyPenceSecondTextField.text = @"";
    twentyTotalPenceSecondTextField.text = @"";
    fiftyPenceSecondTextField.text = @"";
    fiftyTotalPenceSecondTextField.text = @"";
    oneNoteSecondTextField.text = @"";
    oneTotalNoteSecondTextField.text = @"";
    twoNoteSecondTextField.text = @"";
    twoTotalNoteSecondTextField.text = @"";
    fiveNoteSecondTextField.text = @"";
    fiveTotalNoteSecondTextField.text = @"";
    tenNoteSecondTextField.text = @"";
    tenTotalNoteSecondTextField.text = @"";
    twentyNoteSecondTextField.text = @"";
    twentyTotalNoteSecondTextField.text = @"";
    fiftyNoteSecondTextField.text = @"";
    fiftyTotalNoteSecondTextField.text = @"";
    
    
    openingFloatSecondTextField.text = @"";
    fuelReceiptsTextField.text = @"";
    premierCashShareTextField.text = @"";
    premierAccountShareTextField.text = @"";
    totalCashSecondTextField.text = @"";
    currentDepositSecondTextField.text = @"";
    totalTakingsTextField.text = @"";
    expectedTakingsTextField.text = @"";
    cashUnderOverTextField.text = @"";
    newSafeSecondTextField.text = @"";
    totalSafeSecondTextField.text = @"";
    newOpeningSecondTextField.text = @"";
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void)setUpTextField {
    
    
   
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
     [self.dateFormatter setDateFormat: @"yyyy-MM-dd"];
    //[self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
  //  [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *defaultDate = [NSDate date];
    
    self->datePickerTwoTextField.text = [self.dateFormatter stringFromDate:defaultDate];
    self->datePickerTwoTextField.textColor = [self.view tintColor];
    self->datePicker.hidden = NO;
    self->datePicker.alpha = 0.0f;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self->datePicker.alpha = 1.0f;
        
    }];
    self.selectedDate = defaultDate;
    datePicker.date = [NSDate date];

}


-(IBAction)totalCashPostShift:(id)sender;
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
    
    float g = [[onePenceSecondTextField text] floatValue];
    float h = [[twoPenceSecondTextField text] floatValue];
    float i = [[fivePenceSecondTextField text] floatValue];
    float j = [[tenPenceSecondTextField text] floatValue];
    float k = [[twentyPenceSecondTextField text] floatValue];
    float l = [[fiftyPenceSecondTextField text] floatValue];
    float s = [[oneNoteSecondTextField text] floatValue];
    float t = [[twoNoteSecondTextField text] floatValue];
    float u = [[fiveNoteSecondTextField text] floatValue];
    float v = [[tenNoteSecondTextField text] floatValue];
    float w = [[twentyNoteSecondTextField text] floatValue];
    float x = [[fiftyNoteSecondTextField text] floatValue];
   
    
    
    [oneTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", a * g]];
    [twoTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", b * h]];
    [fiveTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", c * i]];
    [tenTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", d * j]];
    [twentyTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", e * k]];
    [fiftyTotalPenceSecondTextField setText:[NSString stringWithFormat:@"%.2f", f * l]];
    [oneTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", m * s]];
    [twoTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", n * t]];
    [fiveTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", o * u]];
    [tenTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", p * v]];
    [twentyTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", q * w]];
    [fiftyTotalNoteSecondTextField setText:[NSString stringWithFormat:@"%.2f", r * x]];
    float y = [oneTotalPenceSecondTextField.text floatValue] + [twoTotalPenceSecondTextField.text floatValue] + [fiveTotalPenceSecondTextField.text floatValue] + [tenTotalPenceSecondTextField.text floatValue] + [twentyTotalPenceSecondTextField.text floatValue] + [fiftyTotalPenceSecondTextField.text floatValue] + [oneTotalNoteSecondTextField.text floatValue] + [twoTotalNoteSecondTextField.text floatValue] + [fiveTotalNoteSecondTextField.text floatValue] + [tenTotalNoteSecondTextField.text floatValue] + [twentyTotalNoteSecondTextField.text floatValue] + [fiftyTotalNoteSecondTextField.text floatValue];
    [totalCashSecondTextField setText:[NSString stringWithFormat:@"%.2f", y]];
    
    
    float cashMinusOpeningFloat = [totalCashSecondTextField.text floatValue] - [openingFloatSecondTextField.text floatValue];
    
   float totalPostTakings = cashMinusOpeningFloat + [fuelReceiptsTextField.text floatValue] + [premierCashShareTextField.text floatValue] + [premierAccountShareTextField.text floatValue];
    
    [totalTakingsTextField setText:[NSString stringWithFormat:@"%.2f", totalPostTakings]];
    
     float totalTakingMinusExpectedTaking = [totalTakingsTextField.text floatValue] - [expectedTakingsTextField.text floatValue];
    
    [cashUnderOverTextField setText:[NSString stringWithFormat:@"%.2f", totalTakingMinusExpectedTaking]];
    
    
    
}
-(IBAction)totalSafePostShift:(id)sender;
{
    
    
    
    float currentPlusNewSafe =  [currentDepositSecondTextField.text floatValue] + [newSafeSecondTextField.text floatValue];
    [totalSafeSecondTextField setText:[NSString stringWithFormat:@"%.2f", currentPlusNewSafe]];
    
    float totalCashMinusNewSafe = [totalCashSecondTextField.text floatValue] - [newSafeSecondTextField.text floatValue];
    [newOpeningSecondTextField setText:[NSString stringWithFormat:@"%.2f", totalCashMinusNewSafe]];
    
    
    
    
}
-(IBAction)savePostShift:(id)sender;
{
    NSString *alertFields = @"Enter required fields";
    if(  totalCashSecondTextField.text.length>0 &&totalSafeSecondTextField.text.length>0)
    {
    [[DBManager getSharedInstance]savePostShift:datePickerTwoTextField.text onePenceSecond:onePenceSecondTextField.text oneTotalPenceSecond:oneTotalPenceSecondTextField.text twoPenceSecond:twoPenceSecondTextField.text twoTotalPenceSecond:twoTotalPenceSecondTextField.text fivePenceSecond:fivePenceSecondTextField.text fiveTotalPenceSecond:fiveTotalPenceSecondTextField.text tenPenceSecond:tenPenceSecondTextField.text tenTotalPenceSecond:tenTotalPenceSecondTextField.text twentyPenceSecond:twentyPenceSecondTextField.text twentyTotalPenceSecond:twentyTotalPenceSecondTextField.text fiftyPenceSecond:fiftyPenceSecondTextField.text fiftyTotalPenceSecond:fiveTotalPenceSecondTextField.text oneNoteSecond:oneNoteSecondTextField.text oneTotalNoteSecond:oneTotalNoteSecondTextField.text twoNoteSecond:twoNoteSecondTextField.text twoTotalNoteSecond:twoTotalNoteSecondTextField.text fiveNoteSecond:fiveNoteSecondTextField.text fiveTotalNoteSecond:fiveTotalNoteSecondTextField.text tenNoteSecond:tenNoteSecondTextField.text tenTotalNoteSecond:tenTotalNoteSecondTextField.text twentyNoteSecond:twentyNoteSecondTextField.text twentyTotalNoteSecond:twentyTotalNoteSecondTextField.text fiftyNoteSecond:fiftyNoteSecondTextField.text fiftyTotalNoteSecond:fiftyTotalNoteSecondTextField.text  openingFloatSecond:openingFloatSecondTextField.text fuelReceipts:fuelReceiptsTextField.text premierCashShare:premierCashShareTextField.text premierAccountShare:premierAccountShareTextField.text totalCashSecond:totalCashSecondTextField.text currentDepositSecond:currentDepositSecondTextField.text totalTakings:totalTakingsTextField.text expectedTakings:expectedTakingsTextField.text cashUnderOver:cashUnderOverTextField.text newSafeSecond:newSafeSecondTextField.text totalSafeSecond:totalSafeSecondTextField.text newOpeningSecond:newOpeningSecondTextField.text];
        
        
    
       self->onePenceSecondTextField.text = @"";
       self->oneTotalPenceSecondTextField.text = @"";
       self->twoPenceSecondTextField.text = @"";
       self->twoTotalPenceSecondTextField.text = @"";
       self->fivePenceSecondTextField.text = @"";
       self->fiveTotalPenceSecondTextField.text = @"";
       self->tenPenceSecondTextField.text = @"";
       self->tenTotalPenceSecondTextField.text = @"";
       self->twentyPenceSecondTextField.text = @"";
       self->twentyTotalPenceSecondTextField.text = @"";
       self->fiftyPenceSecondTextField.text = @"";
       self->fiftyTotalPenceSecondTextField.text = @"";
       self->oneNoteSecondTextField.text = @"";
       self->oneTotalNoteSecondTextField.text = @"";
       self->twoNoteSecondTextField.text = @"";
       self->twoTotalNoteSecondTextField.text = @"";
       self->fiveNoteSecondTextField.text = @"";
       self->fiveTotalNoteSecondTextField.text = @"";
       self->tenNoteSecondTextField.text = @"";
       self->tenTotalNoteSecondTextField.text = @"";
       self->twentyNoteSecondTextField.text = @"";
       self->twentyTotalNoteSecondTextField.text = @"";
       self->fiftyNoteSecondTextField.text = @"";
       self->fiftyTotalNoteSecondTextField.text = @"";
    
    
       self->openingFloatSecondTextField.text = @"";
       self->fuelReceiptsTextField.text = @"";
       self->premierCashShareTextField.text = @"";
       self->premierAccountShareTextField.text = @"";
       self->totalCashSecondTextField.text = @"";
       self->currentDepositSecondTextField.text = @"";
       self->totalTakingsTextField.text = @"";
       self->expectedTakingsTextField.text = @"";
       self->cashUnderOverTextField.text = @"";
       self->newSafeSecondTextField.text = @"";
       self->totalSafeSecondTextField.text = @"";
       self->newOpeningSecondTextField.text = @"";
   
        [self.view endEditing:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertFields message:@"Enter the required fields !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
-(IBAction)viewDetailsPostShift:(id)sender;
{
    
    NSArray *data = [[DBManager getSharedInstance]viewDetailsPostShift:datePickerTwoTextField.text];
    
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No postShift values" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
        onePenceSecondTextField.text = @" ";
        oneTotalPenceSecondTextField.text = @" ";
        twoPenceSecondTextField.text = @" ";
        twoTotalPenceSecondTextField.text = @" ";
        fivePenceSecondTextField.text = @" ";
        fiveTotalPenceSecondTextField.text = @" ";
        tenPenceSecondTextField.text = @" ";
        tenTotalPenceSecondTextField.text = @" ";
        twentyPenceSecondTextField.text = @" ";
        twentyTotalPenceSecondTextField.text = @" ";
        fiftyPenceSecondTextField.text = @" ";
        fiftyTotalPenceSecondTextField.text = @" ";
        oneNoteSecondTextField.text = @" ";
        oneTotalNoteSecondTextField.text = @" ";
        twoNoteSecondTextField.text = @" ";
        twoTotalNoteSecondTextField.text = @" ";
        fiveNoteSecondTextField.text = @" ";
        fiveTotalNoteSecondTextField.text = @" ";
        tenNoteSecondTextField.text = @" ";
        tenTotalNoteSecondTextField.text = @" ";
        twentyNoteSecondTextField.text = @" ";
        twentyTotalNoteSecondTextField.text = @" ";
        fiftyNoteSecondTextField.text = @" ";
        fiftyTotalNoteSecondTextField.text = @" ";
        
        
        openingFloatSecondTextField.text = @" ";
        fuelReceiptsTextField.text = @" ";
        premierCashShareTextField.text = @" ";
        premierAccountShareTextField.text = @" ";
        totalCashSecondTextField.text = @" ";
        currentDepositSecondTextField.text = @" ";
        totalTakingsTextField.text = @" ";
        expectedTakingsTextField.text = @" ";
        cashUnderOverTextField.text = @" ";
        newSafeSecondTextField.text = @" ";
        totalSafeSecondTextField.text = @" ";
        newOpeningSecondTextField.text = @" ";
        
        
        
    }
    else{
        
        
        onePenceSecondTextField.text = [data objectAtIndex:0];
        oneTotalPenceSecondTextField.text = [data objectAtIndex:1];
        twoPenceSecondTextField.text = [data objectAtIndex:2];
        twoTotalPenceSecondTextField.text = [data objectAtIndex:3];
        fivePenceSecondTextField.text = [data objectAtIndex:4];
        fiveTotalPenceSecondTextField.text = [data objectAtIndex:5];
        tenPenceSecondTextField.text = [data objectAtIndex:6];
        tenTotalPenceSecondTextField.text = [data objectAtIndex:7];
        twentyPenceSecondTextField.text = [data objectAtIndex:8];
        twentyTotalPenceSecondTextField.text = [data objectAtIndex:9];
        fiftyPenceSecondTextField.text = [data objectAtIndex:10];
        fiftyTotalPenceSecondTextField.text = [data objectAtIndex:11];
        oneNoteSecondTextField.text = [data objectAtIndex:12];
        oneTotalNoteSecondTextField.text = [data objectAtIndex:13];
        twoNoteSecondTextField.text = [data objectAtIndex:14];
        twoTotalNoteSecondTextField.text = [data objectAtIndex:15];
        fiveNoteSecondTextField.text = [data objectAtIndex:16];
        fiveTotalNoteSecondTextField.text = [data objectAtIndex:17];
        tenNoteSecondTextField.text = [data objectAtIndex:18];
        tenTotalNoteSecondTextField.text = [data objectAtIndex:19];
        twentyNoteSecondTextField.text = [data objectAtIndex:20];
        twentyTotalNoteSecondTextField.text = [data objectAtIndex:21];
        fiftyNoteSecondTextField.text = [data objectAtIndex:22];
        fiftyTotalNoteSecondTextField.text = [data objectAtIndex:23];
        
        
        openingFloatSecondTextField.text = [data objectAtIndex:24];
        fuelReceiptsTextField.text = [data objectAtIndex:25];
        premierCashShareTextField.text = [data objectAtIndex:26];
        premierAccountShareTextField.text = [data objectAtIndex:27];
        totalCashSecondTextField.text = [data objectAtIndex:28];
        currentDepositSecondTextField.text = [data objectAtIndex:29];
        totalTakingsTextField.text = [data objectAtIndex:30];
        expectedTakingsTextField.text = [data objectAtIndex:31];
        cashUnderOverTextField.text = [data objectAtIndex:32];
        newSafeSecondTextField.text = [data objectAtIndex:33];
        totalSafeSecondTextField.text = [data objectAtIndex:34];
        newOpeningSecondTextField.text = [data objectAtIndex:35];
        
        
    }
    

    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    //[myScrollView setFrame:CGRectMake(10, 50, 768, 1200)];
    //[myScrollView setContentSize:CGSizeMake(768, 1200)];
    
    onePenceSecondTextField = textField;
   
    twoPenceSecondTextField = textField;
    
    fivePenceSecondTextField = textField;
    
    tenPenceSecondTextField = textField;
    
    twentyPenceSecondTextField = textField;
    
    fiftyPenceSecondTextField = textField;
    
    oneNoteSecondTextField = textField;
    
    twoNoteSecondTextField = textField;
    
    fiveNoteSecondTextField = textField;
    
    tenNoteSecondTextField = textField;
    
    twentyNoteSecondTextField = textField;
    
    fiftyNoteSecondTextField = textField;
    
    
    
    
    fuelReceiptsTextField = textField;
    premierCashShareTextField = textField;
    premierAccountShareTextField = textField;
    
    newSafeSecondTextField = textField;
    
    //Add tap recognizer to scroll view, user can tap other part of scroll view to
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    [myScrollView addGestureRecognizer:tapRecognizer];
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //[myScrollView setFrame:CGRectMake(10, 50, 768, 1200)];
    
    onePenceSecondTextField = nil;
    twoPenceSecondTextField = nil;
    fivePenceSecondTextField = nil;
    
    tenPenceSecondTextField = nil;
    
    twentyPenceSecondTextField = nil;
    
    fiftyPenceSecondTextField = nil;
    
    oneNoteSecondTextField = nil;
    
    twoNoteSecondTextField = nil;
    
    fiveNoteSecondTextField = nil;
    
    tenNoteSecondTextField = nil;
    
    twentyNoteSecondTextField = nil;
    
    fiftyNoteSecondTextField = nil;
    
    
    
   
    fuelReceiptsTextField = nil;
    premierCashShareTextField = nil;
    premierAccountShareTextField = nil;
    
    newSafeSecondTextField = nil;
   
    
    
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
    
    [onePenceSecondTextField resignFirstResponder];
    
    [twoPenceSecondTextField resignFirstResponder];
   
    [fivePenceSecondTextField resignFirstResponder];
    
    [tenPenceSecondTextField resignFirstResponder];
    [twentyPenceSecondTextField resignFirstResponder];
    
    [fiftyPenceSecondTextField resignFirstResponder];
    
    [oneNoteSecondTextField resignFirstResponder];
    
    [twoNoteSecondTextField resignFirstResponder];
    
    [fiveNoteSecondTextField resignFirstResponder];
    
    [tenNoteSecondTextField resignFirstResponder];
   
    [twentyNoteSecondTextField resignFirstResponder];
       [fiftyNoteSecondTextField resignFirstResponder];
    
    
    
    
    [fuelReceiptsTextField resignFirstResponder];
    [premierCashShareTextField resignFirstResponder];
    [premierAccountShareTextField resignFirstResponder];
   
   
    [newSafeSecondTextField resignFirstResponder];
    
    
   [myScrollView removeGestureRecognizer:tapRecognizer];
    
}



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
    
    CGPoint fOrigin1 = onePenceSecondTextField.frame.origin;
    CGPoint fOrigin2 = twoPenceSecondTextField.frame.origin;
    CGPoint fOrigin3 = fivePenceSecondTextField.frame.origin;
    CGPoint fOrigin4 = tenPenceSecondTextField.frame.origin;
    CGPoint fOrigin5 = twentyPenceSecondTextField.frame.origin;
    CGPoint fOrigin6 = fiftyPenceSecondTextField.frame.origin;
    CGPoint fOrigin7 = oneNoteSecondTextField.frame.origin;
    CGPoint fOrigin8 = twoNoteSecondTextField.frame.origin;
    CGPoint fOrigin9 = fiveNoteSecondTextField.frame.origin;
    CGPoint fOrigin10 = tenNoteSecondTextField.frame.origin;
    CGPoint fOrigin11 = twentyNoteSecondTextField.frame.origin;
    CGPoint fOrigin12 = fiftyNoteSecondTextField.frame.origin;
    CGPoint fOrigin13 = fuelReceiptsTextField.frame.origin;
    CGPoint fOrigin14 = premierAccountShareTextField.frame.origin;
    CGPoint fOrigin15 = premierCashShareTextField.frame.origin;
    CGPoint fOrigin16 = newSafeSecondTextField.frame.origin;

    
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
    fOrigin14.y -= myScrollView.contentOffset.y;
    fOrigin15.y -= myScrollView.contentOffset.y;
    fOrigin16.y -= myScrollView.contentOffset.y;
    
    
    fOrigin1.y += onePenceSecondTextField.frame.size.height;
    fOrigin2.y += twoPenceSecondTextField.frame.size.height;
    fOrigin3.y += fivePenceSecondTextField.frame.size.height;
    fOrigin4.y += tenPenceSecondTextField.frame.size.height;
    
    fOrigin5.y += twentyPenceSecondTextField.frame.size.height;
    fOrigin6.y += fiftyPenceSecondTextField.frame.size.height;
    fOrigin7.y += oneNoteSecondTextField.frame.size.height;
    fOrigin8.y += twoNoteSecondTextField.frame.size.height;
    fOrigin9.y += fiveNoteSecondTextField.frame.size.height;
    
    fOrigin10.y += tenNoteSecondTextField.frame.size.height;
    fOrigin11.y += twentyNoteSecondTextField.frame.size.height;
    fOrigin12.y += fiftyNoteSecondTextField.frame.size.height;
    fOrigin13.y += fuelReceiptsTextField.frame.size.height;
    fOrigin14.y += premierAccountShareTextField.frame.size.height;
    fOrigin15.y += premierCashShareTextField.frame.size.height;
    fOrigin16.y += newSafeSecondTextField.frame.size.height;
    
    
    if (!CGRectContainsPoint(frame, fOrigin1) ) {
        CGPoint scrollPoint = CGPointMake(0.0, onePenceSecondTextField.frame.origin.y + onePenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin2) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twoPenceSecondTextField.frame.origin.y + twoPenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin3) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fivePenceSecondTextField.frame.origin.y + fivePenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin4) ) {
        CGPoint scrollPoint = CGPointMake(0.0, tenPenceSecondTextField.frame.origin.y + tenPenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin5) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twentyPenceSecondTextField.frame.origin.y + twentyPenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin6) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiftyPenceSecondTextField.frame.origin.y + fiftyPenceSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin7) ) {
        CGPoint scrollPoint = CGPointMake(0.0, oneNoteSecondTextField.frame.origin.y + oneNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin8) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twoNoteSecondTextField.frame.origin.y + twoNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin9) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiveNoteSecondTextField.frame.origin.y + fiveNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin10) ) {
        CGPoint scrollPoint = CGPointMake(0.0, tenNoteSecondTextField.frame.origin.y + tenNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin11) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twentyNoteSecondTextField.frame.origin.y + twentyNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin12) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiftyNoteSecondTextField.frame.origin.y + fiftyNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin13) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fuelReceiptsTextField.frame.origin.y + fuelReceiptsTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin11) ) {
        CGPoint scrollPoint = CGPointMake(0.0, twentyNoteSecondTextField.frame.origin.y + twentyNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin12) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fiftyNoteSecondTextField.frame.origin.y + fiftyNoteSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin13) ) {
        CGPoint scrollPoint = CGPointMake(0.0, fuelReceiptsTextField.frame.origin.y + fuelReceiptsTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin11) ) {
        CGPoint scrollPoint = CGPointMake(0.0, premierAccountShareTextField.frame.origin.y + premierAccountShareTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    if (!CGRectContainsPoint(frame, fOrigin12) ) {
        CGPoint scrollPoint = CGPointMake(0.0, premierCashShareTextField.frame.origin.y + premierCashShareTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    if (!CGRectContainsPoint(frame, fOrigin13) ) {
        CGPoint scrollPoint = CGPointMake(0.0, newSafeSecondTextField.frame.origin.y + newSafeSecondTextField.frame.size.height - frame.size.height);
        [myScrollView setContentOffset:scrollPoint animated:YES];
    }
    
    
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [myScrollView setContentOffset:CGPointZero animated:YES];
}








- (IBAction)pickerDateChanged:(UIDatePicker *)sender {
    
    self->datePickerTwoTextField.text =  [self.dateFormatter stringFromDate:sender.date];
    
    self.selectedDate = sender.date;
}

@end
