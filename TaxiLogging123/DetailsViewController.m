//
//  DetailsViewController.m
//  TaxiLogging
//
//  Created by PPTS on 17/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "DetailsViewController.h"
#import "reportView.h"
#import "ExpensesViewController.h"


  NSUserDefaults *defaults;
@interface DetailsViewController ()
@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSArray *data;

@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;



- (IBAction)segmentedControlIndexChanged:(UISegmentedControl *)sender;

@end

@implementation DetailsViewController
@synthesize shiftVar;



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
    [self setUpTextField];
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     remainders = [[DBManager getSharedInstance]findByPreShiftDetails:self.fromDate.text toDateChange:self.toDate.text];    
    [self.myTableView reloadData];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.grandCash setHidden:YES];
    [self.grandTip setHidden:YES];
    [self.grandAccount setHidden:YES];
    [self.grandTotal setHidden:YES];
    [self.grandCashText setHidden:YES];
    [self.grandTipText setHidden:YES];
    [self.grandAccountText setHidden:YES];
    [self.grandTotalText setHidden:YES];
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
   // [self.dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSDate *defaultDate = [NSDate date];
    
    self.fromDate.text = [self.dateFormatter stringFromDate:defaultDate];
    self.fromDate.textColor = [self.view tintColor];
   
    self.toDate.text = [self.dateFormatter stringFromDate:defaultDate];
    self.toDate.textColor = [self.view tintColor];
    
    self.datePickerFrom.hidden = NO;
    self.datePickerFrom.alpha = 0.0f;
    
    self.datePickerTo.hidden = NO;
    self.datePickerTo.alpha = 0.0f;
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.datePickerFrom.alpha = 1.0f;
        self.datePickerTo.alpha = 1.0f;
        
    }];

    self.selectedDate = defaultDate;
}




- (IBAction)segmentedControlIndexChanged:(UISegmentedControl *)sender
{
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case 0:
            
            self.shiftVar = 1;
            
         
            
            
            
             break;
        case 1:
            self.shiftVar = 2;
    
            
            break;
        case 2: 
            self.shiftVar = 3;
          
            
            
            
            break;
        default:
            break; 
    } 
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
     return [remainders count];
    
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierExp;
    static NSString *CellIdentifierPre;
    static NSString *CellIdentifierPost;
    // cell.textLabel.text = [mainArray objectAtIndex:indexPath.row];
    
    reportView *reminderToDisplay = [remainders objectAtIndex:indexPath.section];
    
    NSString * shiftRetunValue = reminderToDisplay.shiftFinder;
   
    
    if([shiftRetunValue  isEqual: @"3"]){
        CellIdentifierExp = @"contentCell";
    UITableViewCell *cellExp = [tableView dequeueReusableCellWithIdentifier:CellIdentifierExp];
        
     self.grandTipText.text = reminderToDisplay.sumTipsDiscount;
      self.grandCashText.text = reminderToDisplay.sumCashPrice;
self.grandAccountText.text = reminderToDisplay.sumAccount;
     self.grandTotalText.text = reminderToDisplay.sumTotal;

        
        
        
        
        
        
        if (cellExp == nil) {
            cellExp = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierExp];
        }
        
        UILabel *label1 = (UILabel *)[cellExp viewWithTag:1];
        
        label1.text= reminderToDisplay.pickUpPoint;
        
        UILabel *label2 = (UILabel *)[cellExp viewWithTag:2];
        label2.text= reminderToDisplay.viaTaxi;
        
        UILabel *label3 = (UILabel *)[cellExp viewWithTag:3];
        label3.text= reminderToDisplay.dropPoint;
        
        UILabel *label4 = (UILabel *)[cellExp viewWithTag:4];
        label4.text= reminderToDisplay.tipsDiscount;
        
        UILabel *label5 = (UILabel *)[cellExp viewWithTag:5];
        label5.text= reminderToDisplay.cashPrice;
        
        UILabel *label9 = (UILabel *)[cellExp viewWithTag:6];
        label9.text= reminderToDisplay.accountPrice;
        
        UILabel *label6 = (UILabel *)[cellExp viewWithTag:7];
        label6.text= reminderToDisplay.totalSum;
        
        UILabel *label7 = (UILabel *)[cellExp viewWithTag:8];
        label7.text= reminderToDisplay.dateChange;
        
        UILabel *label8 = (UILabel *)[cellExp viewWithTag:9];
        label8.text= reminderToDisplay.rshift;
        
        
        
      return cellExp;
    }else if([shiftRetunValue  isEqual: @"1"]){
        CellIdentifierPre = @"preShiftCell";

       UITableViewCell *cellPre = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPre];
                if (cellPre == nil) {
            cellPre = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierPre];
        }
        
        
        UILabel *label11 = (UILabel *)[cellPre viewWithTag:11];
        label11.text= reminderToDisplay.rdatePickerOne;
        
        UILabel *label12 = (UILabel *)[cellPre viewWithTag:12];
        label12.text= reminderToDisplay.rexpectedFloat;
        
        UILabel *label13 = (UILabel *)[cellPre viewWithTag:13];
        label13.text= reminderToDisplay.rtotalCash;
        
        UILabel *label14 = (UILabel *)[cellPre viewWithTag:14];
        label14.text= reminderToDisplay.rdifference;
        
        UILabel *label15 = (UILabel *)[cellPre viewWithTag:15];
        label15.text= reminderToDisplay.rcurrentDeposit;
        
        UILabel *label16 = (UILabel *)[cellPre viewWithTag:16];
        label16.text= reminderToDisplay.rpreNewSafe;
        
        UILabel *label17 = (UILabel *)[cellPre viewWithTag:17];
        label17.text= reminderToDisplay.rtotalSafe;
        
       return cellPre;
        
    }else if([shiftRetunValue  isEqual: @"2"]){
         CellIdentifierPost = @"postShiftCell";
       UITableViewCell *cellPost = [tableView dequeueReusableCellWithIdentifier:CellIdentifierPost];
       
        if (cellPost == nil) {
            cellPost = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierPost];
        }
        
        UILabel *label21 = (UILabel *)[cellPost viewWithTag:21];
        
        label21.text= reminderToDisplay.postRDate;
        
        UILabel *label22 = (UILabel *)[cellPost viewWithTag:22];
        label22.text= reminderToDisplay.postROpeningFloat;
        
        UILabel *label23 = (UILabel *)[cellPost viewWithTag:23];
        label23.text= reminderToDisplay.postRTotalCash;
        
        UILabel *label24 = (UILabel *)[cellPost viewWithTag:24];
        label24.text= reminderToDisplay.postRTotalTaking;
        
        UILabel *label25 = (UILabel *)[cellPost viewWithTag:25];
        label25.text= reminderToDisplay.postRExpectedTaking;
        
        UILabel *label26 = (UILabel *)[cellPost viewWithTag:26];
        label26.text= reminderToDisplay.postRUnderOver;
        
        UILabel *label27 = (UILabel *)[cellPost viewWithTag:27];
        label27.text= reminderToDisplay.postRNewSafe;
        
        UILabel *label28 = (UILabel *)[cellPost viewWithTag:28];
        label28.text= reminderToDisplay.postRTotalSafe;
        
        UILabel *label29 = (UILabel *)[cellPost viewWithTag:29];
        label29.text= reminderToDisplay.postRNewFloat;
       return cellPost;
        
    }
    
    return nil;
    
   }
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    //DB to remove
    //NSDictionary * rowVals = (NSDictionary *) [remainders objectAtIndex:indexPath.row];
    
  
    NSString *stringSTR = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    NSLog(@"test : %@",stringSTR);
    [[DBManager getSharedInstance]deleteExpensesByRow:stringSTR];
    
    
    // Remove the row from data model
  //  [remainders removeObjectAtIndex:indexPath.row];
    // Request table view to reload
    [self.myTableView reloadData];


} */


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"updateCell"]) {
        NSIndexPath *indexPath = [self.myTableView indexPathForSelectedRow];
        NSLog(@"index %@", indexPath);
        ExpensesViewController *destViewController = segue.destinationViewController;
        
        reportView *test = [remainders objectAtIndex:indexPath.section];
        
        
        
        
    //    test.uniqueExpenseId;
        
        destViewController.uniqueId = test.uniqueExpenseId;
        
     destViewController.dpick = test.pickUpPoint;
        destViewController.dfinish = test.finishNote;
        destViewController.ddate = test.dateChange;
        destViewController.daccount = test.accountPrice;
        destViewController.dcash = test.cashPrice;
        destViewController.ddrop = test.dropPoint;
        destViewController.dstart = test.startNote;
        destViewController.dshift = test.rshift;
        destViewController.dtip = test.tipsDiscount;
        destViewController.dtotal = test.totalSum;
        destViewController.dvia = test.viaTaxi;
    }
}







-(IBAction)downloadFromDb:(id)sender

{
    
    
    NSLog(@" test tips %@",tipSum);
    NSLog(@" test cash %@",cashSum);
    NSLog(@" test cash %@",accountSum);
    NSLog(@" test total %@",totalSum);

    NSString *filePath = [[DBManager getSharedInstance]exportImpl:self.fromDate.text toDateChange:self.toDate.text shiftChange:self.shiftVar totalTips:self.grandTipText.text totalCash:self.grandCashText.text totalAccount:self.grandAccountText.text totalTotal:self.grandTotalText.text];
    
    [self mail_clicked:filePath];
}











-(void)mail_clicked:(NSString *)filePath {
    Class emailClass=(NSClassFromString(@"MFMailComposeViewController"));
    if (emailClass!=nil)
    {
        if ([emailClass canSendMail])
            [self displayComposePage:filePath];
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Email cannot be send!"
                                                         message:@"Device is not configured to send email"
                                                        delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Email cannot be send!"
                                                     message:@"Device cannot send email"
                                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}


-(void)displayComposePage:(NSString *)filePath{
    
    NSData* attachCsv = [NSData dataWithContentsOfFile: filePath];
    NSLog(@"email data : %@", attachCsv);
    if (attachCsv != nil) {
        MFMailComposeViewController *composePage=[[MFMailComposeViewController alloc]init];
        composePage.mailComposeDelegate=self;
        NSArray *recipients=[NSArray arrayWithObject:@"mailid@mail.com"];
        [composePage setToRecipients:recipients];
        [composePage setSubject:@"Logging Journey and Fares Attachment"];
        NSString* filename = [filePath lastPathComponent];
        [composePage addAttachmentData: attachCsv mimeType:@"application/octet-stream" fileName: filename];

        [composePage setMessageBody:@"Hi, attached the file with this mail...please kindly leaf through it." isHTML:NO];
        [composePage setTitle:@"Logging Journey and Fares"];
        composePage.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:composePage animated:YES completion:nil];
        

           }

    }
-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Logging Journey and Fares"
                                                 message:@"Email has been sent!"
                                                delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}







-(IBAction)findByDateChange:(id)sender{
    

    
 
    //deleteExpensesByRow
    switch (shiftVar)
    {
        case 1://preshift
             remainders = [[DBManager getSharedInstance]findByPreShiftDetails:self.fromDate.text toDateChange:self.toDate.text];
             [self.myTableView reloadData];
            [self.grandAccount setHidden:YES];
            [self.grandCash setHidden:YES];
            [self.grandTip setHidden:YES];
            [self.grandTotal setHidden:YES];
            [self.grandCashText setHidden:YES];
            [self.grandTipText setHidden:YES];
            [self.grandAccountText setHidden:YES];
            [self.grandTotalText setHidden:YES];
            
            break;
            
        case 2://postshift
             remainders = [[DBManager getSharedInstance]findByPostShiftDetails:self.fromDate.text toDateChange:self.toDate.text];
             [self.myTableView reloadData];
            
            [self.grandCash setHidden:YES];
            [self.grandTip setHidden:YES];
            [self.grandAccount setHidden:YES];
            [self.grandTotal setHidden:YES];
            [self.grandCashText setHidden:YES];
            [self.grandTipText setHidden:YES];
            [self.grandAccountText setHidden:YES];
            [self.grandTotalText setHidden:YES];
            
            
            
            
            
            break;
            
        case 3://expenses
            remainders = [[DBManager getSharedInstance]findByDateChange:self.fromDate.text toDateChange:self.toDate.text];
             [self.myTableView reloadData];
            
            [self.grandCash setHidden:NO];
            [self.grandTip setHidden:NO];
            [self.grandAccount setHidden:NO];
            [self.grandTotal setHidden:NO];
            [self.grandCashText setHidden:NO];
            [self.grandTipText setHidden:NO];
             [self.grandAccountText setHidden:NO];
            [self.grandTotalText setHidden:NO];
         
       
            NSLog(@"Data saved");
            break;
  /*
        default://Preshift
             remainders = [[DBManager getSharedInstance]findByPreShiftDetails:self.fromDate.text toDateChange:self.toDate.text];
             [self.myTableView reloadData];
            break;*/
    }
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)fromPickerDateChanged:(UIDatePicker *)sender {
    
    self.fromDate.text =  [self.dateFormatter stringFromDate:sender.date];
   
    
    self.selectedDate = sender.date;
}
- (IBAction)toPickerDateChanged:(UIDatePicker *)sender {
    
   
    self.toDate.text =  [self.dateFormatter stringFromDate:sender.date];
    
    self.selectedDate = sender.date;
}

@end
