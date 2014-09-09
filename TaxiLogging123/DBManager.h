//
//  DBManager.h
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>



@interface DBManager : NSObject
{
    NSString *databasePath;
     
}
+(DBManager*)getSharedInstance;

-(BOOL)createDB;

-(BOOL)saveData:(NSString *)dateChange
startMileage:(NSString *)startMileage
finishMileage:(NSString *)finishMileage
pickUpPoint:(NSString *)pickUpPoint
viaTaxi:(NSString *)viaTaxi
dropPoint:(NSString *)dropPoint
tipsDiscount:(NSString *)tipsDiscount
cashPrice:(NSString *)cashPrice
   accountTotal:(NSString *)accountTotal
totalSum:(NSString *)totalSum
shift:(NSString *)shift;
//-(void)deleteExpensesByRow:(NSString *) mID;
- (NSString *) exportImpl:(NSString *)dateChange toDateChange:(NSString *)toDate shiftChange:(int)shiftNo totalTips:(NSString *)testTips totalCash:(NSString *)testCash totalAccount:(NSString *)testAccount totalTotal:(NSString *)testTotal;
- (NSMutableArray *)findByDateChange:(NSString *)dateChange toDateChange:(NSString *)toDate;
- (NSMutableArray *)findByPreShiftDetails:(NSString *)dateChange toDateChange:(NSString *)toDate;
- (NSMutableArray *)findByPostShiftDetails:(NSString *)dateChange toDateChange:(NSString *)toDate;

//-(void) exportCsv: (NSString*) filename;

//Expense update

- (BOOL) updateExpenses:(NSString *)dateChange
           startMileage:(NSString *)startMileage
          finishMileage:(NSString *)finishMileage
            pickUpPoint:(NSString *)pickUpPoint
                viaTaxi:(NSString *)viaTaxi
              dropPoint:(NSString *)dropPoint
           tipsDiscount:(NSString *)tipsDiscount
              cashPrice:(NSString *)cashPrice
           accountTotal:(NSString *)accountTotal
               totalSum:(NSString *)totalSum
                  shift:(NSString *)shift
                  idExp:(NSString *)idExp;




-(BOOL)savePreShift:(NSString *)datePickerOne
onePence:(NSString *)onePence
oneTotalPence:(NSString *)oneTotalPence
twoPence:(NSString *)twoPence
twoTotalPence:(NSString *)twoTotalPence
fivePence:(NSString *)fivePence
fiveTotalPence:(NSString *)fiveTotalPence
tenPence:(NSString *)tenPence
tenTotalPence:(NSString *)tenTotalPence
twentyPence:(NSString *)twentyPence
twentyTotalPence:(NSString *)twentyTotalPence
fiftyPence:(NSString *)fiftyPence
fiftyTotalPence:(NSString *)fiftyTotalPence
oneNote:(NSString *)oneNote
oneTotalNote:(NSString *)oneTotalNote
twoNote:(NSString *)twoNote
twoTotalNote:(NSString *)twoTotalNote
fiveNote:(NSString *)fiveNote
fiveTotalNote:(NSString *)fiveTotalNote
tenNote:(NSString *)tenNote
tenTotalNote:(NSString *)tenTotalNote
twentyNote:(NSString *)twentyNote
twentyTotalNote:(NSString *)twentyTotalNote
fiftyNote:(NSString *)fiftyNote
fiftyTotalNote:(NSString *)fiftyTotalNote
difference:(NSString *)difference
      expectedFloat:(NSString *)expectedFloat
     currentDeposit:(NSString *)currentDeposit
totalCash:(NSString *)totalCash
newSafe:(NSString *)newSafe
totalSafe:(NSString *)totalSafe
newFloat:(NSString *)newFloat;


-(NSArray *) viewDetails:(NSString *)datePickerOne;

-(BOOL)

savePostShift:(NSString *)datePickerTwo
onePenceSecond:(NSString *)onePenceSecond
oneTotalPenceSecond:(NSString *)oneTotalPenceSecond
twoPenceSecond:(NSString *)twoPenceSecond
twoTotalPenceSecond:(NSString *)twoTotalPenceSecond
fivePenceSecond:(NSString *)fivePenceSecond
fiveTotalPenceSecond:(NSString *)fiveTotalPenceSecond
tenPenceSecond:(NSString *)tenPenceSecond
tenTotalPenceSecond:(NSString *)tenTotalPenceSecond
twentyPenceSecond:(NSString *)twentyPenceSecond
twentyTotalPenceSecond:(NSString *)twentyTotalPenceSecond
fiftyPenceSecond:(NSString *)fiftyPenceSecond
fiftyTotalPenceSecond:(NSString *)fiftyTotalPenceSecond
oneNoteSecond:(NSString *)oneNoteSecond
oneTotalNoteSecond:(NSString *)oneTotalNoteSecond
twoNoteSecond:(NSString *)twoNoteSecond
twoTotalNoteSecond:(NSString *)twoTotalNoteSecond
fiveNoteSecond:(NSString *)fiveNoteSecond
fiveTotalNoteSecond:(NSString *)fiveTotalNoteSecond
tenNoteSecond:(NSString *)tenNoteSecond
tenTotalNoteSecond:(NSString *)tenTotalNoteSecond
twentyNoteSecond:(NSString *)twentyNoteSecond
twentyTotalNoteSecond:(NSString *)twentyTotalNoteSecond
fiftyNoteSecond:(NSString *)fiftyNoteSecond
fiftyTotalNoteSecond:(NSString *)fiftyTotalNoteSecond


openingFloatSecond:(NSString *)openingFloatSecond
fuelReceipts:(NSString *)fuelReceipts
premierCashShare:(NSString *)premierCashShare
premierAccountShare:(NSString *)premierAccountShare
totalCashSecond:(NSString *)totalCashSecond
currentDepositSecond:(NSString *)currentDepositSecond
totalTakings:(NSString *)totalTakings
expectedTakings:(NSString *)expectedTakings
cashUnderOver:(NSString *)cashUnderOver
newSafeSecond:(NSString *)newSafeSecond
totalSafeSecond:(NSString *)totalSafeSecond
newOpeningSecond:(NSString *)newOpeningSecond;


-(NSString *) retrieve;
-(NSString *) preExpectedOpeningFloat;
-(NSString *) cashFromPreToPostOpeningFloat;
-(NSString *) currentDepositFromTotalCashPost;
-(NSString *) expectedTakingsFromTotalExpenses:(NSString *)datePickerFromPost;



-(NSArray *) viewDetailsPostShift:(NSString *)datePickerTwo;
@property (nonatomic, retain) NSMutableArray *reminders;
@end

