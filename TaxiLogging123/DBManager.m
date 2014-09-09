//
//  DBManager.m
//  TaxiLogging
//
//  Created by PPTS on 07/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "DBManager.h"
#import "reportView.h"



static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
//static sqlite3_stmt *statement = nil;
NSString *tempFile;
NSString* csvPath;
NSString* sumCal;


@implementation DBManager
@synthesize reminders;

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}


-(BOOL)createDB{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent: @"taxilogging007.db"]];
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            
            char *errMsg;
            
            //TABLE FOR loggingJourneyFares
            const char *sql_stmt = "create table if not exists loggingJourneyFares (_id INTEGER PRIMARY KEY AUTOINCREMENT, dateid text, startMileage text, finishMileage text, pickUpPoint text, viaTaxi text, dropPoint text, tipsDiscount text, cashPrice text, accountTotal text, totalSum text, shiftExpected text)";
            
            //TABLE FOR preShift
            
            const char *sql_stmt1 = "create table if not exists preShift (_preshiftid INTEGER PRIMARY KEY AUTOINCREMENT, dateidone text, onepqPreShift text, oneptPreShift text, twopqPreShift text, twoptPreShift text, fivepqPreShift text, fiveptPreShift text, tenpqPreShift text, tenptPreShift text, twentypqPreShift text, twentyptPreShift text, fiftypqPreShift text, fiftyptPreShift text, onenqPreShift text, onentPreShift text, twonqPreShift text, twontPreShift text, fivenqPreShift text, fiventPreShift text, tennqPreShift text, tenntPreShift text, twentynqPreShift text, twentyntPreShift text, fiftynqPreShift text, fiftyntPreShift text, differencePreShift text, expectedFloat text, currentDeposit text, totalCashPreShift text, newSafePreShift text, totalSafePreShift text, newFloatPreShift text)";
            
            //TABLE FOR postShift
            
            const char *sql_stmt2 = "create table if not exists postShift (_postshiftid INTEGER PRIMARY KEY AUTOINCREMENT, dateidtwo text, onepqPostShift text, oneptPostShift text, twopqPostShift text, twoptPostShift text, fivepqPostShift text, fiveptPostShift text, tenpqPostShift text, tenptPostShift text, twentypqPostShift text, twentyptPostShift text, fiftypqPostShift text, fiftyptPostShift text, onenqPostShift text, onentPostShift text, twonqPostShift text, twontPostShift text, fivenqPostShift text, fiventPostShift text, tennqPostShift text, tenntPostShift text, twentynqPostShift text, twentyntPostShift text, fiftynqPostShift text, fiftyntPostShift text, openingFloat text, fuelReceipts text, premierCashShare text, premierAccountShare text, totalCash text, currentSafeDeposit text, totalTakings text, expectedTakings text, cashUnderOver text, newSafeDeposit text, totalSafeDeposit text, newOpeningFloat text)";
            
            
            
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            
            
            if (sqlite3_exec(database, sql_stmt1, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            
            if (sqlite3_exec(database, sql_stmt2, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                isSuccess = NO;
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
            return  isSuccess;
        }
        else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
        
    
    
    /*
    else{
        BOOL response =  [self checkColumnExists];
        NSLog(@"fsdfsdf %hhd",response);
        if(response == NO){
            sqlite3_stmt *selectStmt;
            NSString *updateSQL = [NSString stringWithFormat: @"ALTER TABLE loggingJourneyFares ADD COLUMN accountTotal TEXT"];
            const char *update_stmt = [updateSQL UTF8String];
            sqlite3_prepare_v2(database, update_stmt, -1, &selectStmt, NULL);
            
            if(sqlite3_step(selectStmt)==SQLITE_DONE)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DB altered" message:@"Success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
               
                alert=nil;
                
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"DB Updation" message:@"DB not Altered" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
                alert=nil;
            }
            // Release the compiled statement from memory
            sqlite3_finalize(selectStmt);
          
            
            
            
            
            
            
            
     
            
            NSLog(@"fsdfsdf");
            sqlite3_stmt *selectStmt;
            const char *sqlStmt = "ALTER TABLE loggingJourneyFares ADD COLUMN accountTotal TEXT";
           
           
            sqlite3_prepare_v2(database, sqlStmt,-1, &selectStmt, NULL);
            if (sqlite3_step(selectStmt) == SQLITE_DONE) {
                NSLog(@"table column added");
            }
            
           */
            
        }
      

    
    return isSuccess;
}

/*
-(BOOL)checkColumnExists
{
    
    NSLog(@"respose");
    BOOL columnExist=NO;
    sqlite3_stmt *selectStmt;
    const char *sqlStmt = "SELECT accountTotal FROM loggingJourneyFares";
    if   (sqlite3_prepare_v2(database, sqlStmt,-1, &selectStmt, NULL)==SQLITE_OK ){
        
   columnExist=YES;
    }
    return columnExist;
}


*/

//expenses
- (BOOL) saveData:(NSString *)dateChange
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


{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *alertSuccess2 = @"Data Insertion successful";
        NSString *alertFields2 = @"Data Insertion Failed";
        sqlite3_stmt *statement_expenses;
        
        NSString *insertSQL = [NSString stringWithFormat:@"insert into loggingJourneyFares (dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shiftExpected) values (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", dateChange, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shift];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement_expenses, NULL);
        
        if (sqlite3_step(statement_expenses) == SQLITE_DONE)
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertSuccess2 message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return YES;
        }
        else {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:alertFields2 message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return NO;
        }
        sqlite3_reset(statement_expenses);
        sqlite3_finalize(statement_expenses);
        
    }
    return NO;
}


//UPDATE EXPENSES



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


{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *alertSuccess2 = @"Data Updation successful";
        NSString *alertFields2 = @"Data Updation Failed";
        sqlite3_stmt *statement_expenses;
        
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE loggingJourneyFares SET dateid=\"%@\", startMileage=\"%@\", finishMileage=\"%@\", pickUpPoint=\"%@\", viaTaxi=\"%@\", dropPoint=\"%@\", tipsDiscount=\"%@\", cashPrice=\"%@\", accountTotal=\"%@\", totalSum=\"%@\", shiftExpected=\"%@\" WHERE _id=\"%@\"", dateChange, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shift, idExp];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement_expenses, NULL);
        
        if (sqlite3_step(statement_expenses) == SQLITE_DONE)
        {
            
            UIAlertView *alertupdate1 = [[UIAlertView alloc]initWithTitle:alertSuccess2 message:@"Data updated" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertupdate1 show];        }
        else {
            
            UIAlertView *alertupdate2 = [[UIAlertView alloc]initWithTitle:alertFields2 message:@"Updation failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertupdate2 show];

        }
        sqlite3_reset(statement_expenses);
        sqlite3_finalize(statement_expenses);
        
    }
    return NO;
}



/*
 *
 EXPORT SQLITE TO CSV :
 *
 */
    - (NSString *) exportImpl:(NSString *)dateChange toDateChange:(NSString *)toDate shiftChange:(int)shiftNo totalTips:(NSString *)testTips totalCash:(NSString *)testCash totalAccount:(NSString *)testAccount totalTotal:(NSString *)testTotal


{
    
    NSLog(@" test tips %@",testTips);
     NSLog(@" test cash %@",testCash);
     NSLog(@" test total %@",testTotal);
    
    
    csvPath = [NSTemporaryDirectory() stringByAppendingPathComponent: @"export.csv"];
    NSLog(@"%@" , NSTemporaryDirectory());
    NSLog(@"SHIFT NO : %d" , shiftNo);
    [self exportCsv:csvPath fromDate:dateChange toDateChange:toDate shiftVariab:shiftNo totalTips:testTips totalCash:testCash totalAccount:testAccount totalTotal:testTotal];
  //  [self grandCalculations:sumCal totalTips:testTips totalCash:testCash totalTotal:testTotal];
    // mail is graphical and must be run on UI thread
      return csvPath;
}





-(void) exportCsv:(NSString*)filename fromDate : (NSString *)dateChange toDateChange:(NSString *)toDate shiftVariab:(int)shiftNo totalTips:(NSString *)testTips totalCash:(NSString *)testCash totalAccount:(NSString *)testAccount totalTotal:(NSString *)testTotal
    {
        NSLog(@"SHIFT NO : %d" , shiftNo);

        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
       
        {
    [self createTempFile: filename];
            
            
       
            NSOutputStream* output = [[NSOutputStream alloc] initToFileAtPath: filename append: YES];
            [output open];
            
            if (![output hasSpaceAvailable]) {
                NSLog(@"No space available in %@", filename);
                // TODO: UIAlertView?
                
            }else{
                
                NSString *headerStr;
                if(shiftNo == 3){
                    
                    headerStr = @"dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shiftExpected\n";
                    
                }else if (shiftNo == 2){
                    
                    headerStr = @"dateidtwo, openingFloat, totalCash, totalTakings, expectedTakings, cashUnderOver, newSafeDeposit, totalSafeDeposit, newOpeningFloat\n";
                    
                }else if (shiftNo ==1){
                    
                   headerStr = @"dateidone, expectedFloat, totalCashPreShift, differencePreShift, currentDeposit, newSafePreShift, totalSafePreShift\n";
                }
                
            
                NSData *headerData = [headerStr dataUsingEncoding:NSUTF8StringEncoding];
                
                const void *headerBytes = [headerData bytes];
                
                int headerLength = [headerData length];
                
                uint8_t *headerBuf = (uint8_t*)headerBytes;
                
                NSInteger result = [output write: headerBuf maxLength: headerLength];
                
                if (result <= 0) {
                    
                    NSLog(@"1,exportCsv encountered error=%d from header write", result);
                
                }
                BOOL errorLogged = NO;
                
                if(shiftNo == 3){
                    
                    NSString *sqlStatement = [NSString stringWithFormat:@"select dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shiftExpected from loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\"", dateChange, toDate];
                    NSLog(@"%@",sqlStatement);
                    
                    // Setup the SQL Statement and compile it for faster access
                    sqlite3_stmt* compiledStatement;
                    const char *query_stmtV = [sqlStatement UTF8String];
                    
                    NSInteger retVals =sqlite3_prepare_v2(database, query_stmtV, -1, &compiledStatement, NULL);
                    if ( retVals== SQLITE_OK)
                    {
                        
                        NSLog(@"TEst to retvals");
                        // Loop through the results and write them to the CSV file
                        while (sqlite3_step(compiledStatement) == SQLITE_ROW) {

                            NSString *dateid = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 0)];
                            
                            NSString *startMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 1)];
                            
                            NSString *finishMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 2)];
                            
                            NSString *pickUpPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 3)];
                            
                            NSString *viaTaxi = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 4)];
                            
                            NSString *dropPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 5)];
                            
                            NSString *tipsDiscount = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 6)];
                            
                            NSString *cashPrice = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 7)];
                            
                             NSString *totalAccount = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 8)];
                            
                            NSString *totalSum = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 9)];
                            
                            NSString *shiftExpected = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 10)];
                            
                            // Read the data from the result row
                            
                            NSString* line = [[NSString alloc] initWithFormat: @"%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@\n", dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, totalAccount, totalSum, shiftExpected];
                            NSLog(@"REsponse : %@",line);
                            
                            NSData *lineData = [line dataUsingEncoding:NSUTF8StringEncoding];

                            const void *lineBytes = [lineData bytes];
                            
                            int lineLength = [lineData length];
                            
                            uint8_t *lineBuf = (uint8_t*)lineBytes;
                            
                            NSInteger lineResult = [output write: lineBuf maxLength: lineLength];
                            
                            if (!errorLogged && (lineResult <= 0)) {
                                NSLog(@"exportCsv write returned %d", lineResult);
                                errorLogged = YES;
                            }
                            
                        }
                        //TOTAL VALUES ADDED
                        
                        NSString *headerStrq = @"totalTipsPrice, totalCashPrice, totalAccountPrice, totalTotalPrice\n";
                        
                        NSData *headerDataq = [headerStrq dataUsingEncoding:NSUTF8StringEncoding];
                        
                        const void *headerBytesq = [headerDataq bytes];
                        
                        int headerLengthq = [headerDataq length];
                        
                        uint8_t *headerBufq = (uint8_t*)headerBytesq;

                        NSInteger resultq = [output write: headerBufq maxLength: headerLengthq];
                        
                        if (resultq <= 0) {
                            
                            NSLog(@"1,exportCsv encountered error=%d from header write", resultq);
                            
                        }
                        
                        
                        NSString* lineq = [[NSString alloc] initWithFormat: @"%@,%@,%@,%@\n", testTips, testCash, testAccount, testTotal];
                        NSLog(@"REsponse : %@",lineq);
                        
                        NSData *lineDataq = [lineq dataUsingEncoding:NSUTF8StringEncoding];
                        
                        const void *lineBytesq = [lineDataq bytes];
                        
                        int lineLengthq = [lineDataq length];
                        
                        uint8_t *lineBufq = (uint8_t*)lineBytesq;
                        
                        NSInteger lineResultq = [output write: lineBufq maxLength: lineLengthq];
                        
                        if (!errorLogged && (lineResultq <= 0)) {
                            NSLog(@"exportCsv write returned %d", lineResultq);
                            errorLogged = YES;
                        }
                        
                        
                        
                        // Release the compiled statement from memory
                        sqlite3_finalize(compiledStatement);
                    }
                    
                }   //------SHIFT NO 3 completed-----------------
                else if (shiftNo == 2){
                    
                    
                    NSString *sqlStatement = [NSString stringWithFormat:@"select dateidtwo, openingFloat, totalCash, totalTakings, expectedTakings, cashUnderOver, newSafeDeposit, totalSafeDeposit, newOpeningFloat from postShift where dateidtwo >=\"%@\" AND dateidtwo <=\"%@\"",dateChange, toDate ];
     
                    NSLog(@"%@",sqlStatement);
                    
                    // Setup the SQL Statement and compile it for faster access
                    sqlite3_stmt* compiledStatement;
                    const char *query_stmtV = [sqlStatement UTF8String];
                    
                    NSInteger retVals =sqlite3_prepare_v2(database, query_stmtV, -1, &compiledStatement, NULL);
                    if ( retVals== SQLITE_OK)
                    {
                        
                        NSLog(@"TEst to retvals");
                        // Loop through the results and write them to the CSV file
                        while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
                            
                            NSString *dateid = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 0)];
                            
                            NSString *startMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 1)];
                            
                            NSString *finishMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 2)];
                            
                            NSString *pickUpPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 3)];
                            
                            NSString *viaTaxi = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 4)];
                            
                            NSString *dropPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 5)];
                            
                            NSString *tipsDiscount = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 6)];
                            
                            NSString *cashPrice = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 7)];
                            
                            NSString *totalSum = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 8)];
                            
                            
                            // Read the data from the result row
                            
                            NSString* line = [[NSString alloc] initWithFormat: @"%@,%@,%@,%@,%@,%@,%@,%@%@\n", dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, totalSum];
                            NSLog(@"REsponse : %@",line);
                            
                            NSData *lineData = [line dataUsingEncoding:NSUTF8StringEncoding];
                            
                            const void *lineBytes = [lineData bytes];
                            
                            int lineLength = [lineData length];
                            
                            uint8_t *lineBuf = (uint8_t*)lineBytes;
                            
                            NSInteger lineResult = [output write: lineBuf maxLength: lineLength];
                            
                            if (!errorLogged && (lineResult <= 0)) {
                                NSLog(@"exportCsv write returned %d", lineResult);
                                errorLogged = YES;
                            }
                            
                        }
                        
                        // Release the compiled statement from memory
                        sqlite3_finalize(compiledStatement);
                    }
                    
                }   //------SHIFT NO 2 completed
                else if (shiftNo ==1){
                    
                    NSString *sqlStatement = [NSString stringWithFormat:@"select dateidone, expectedFloat, totalCashPreShift, differencePreShift, currentDeposit, newSafePreShift, totalSafePreShift from preShift where dateidone >=\"%@\" AND dateidone <=\"%@\"", dateChange, toDate ];
                    NSLog(@"%@",sqlStatement);
                    
                    // Setup the SQL Statement and compile it for faster access
                    sqlite3_stmt* compiledStatement;
                    const char *query_stmtV = [sqlStatement UTF8String];
                    
                    NSInteger retVals =sqlite3_prepare_v2(database, query_stmtV, -1, &compiledStatement, NULL);
                    if ( retVals== SQLITE_OK)
                    {
                        
                        NSLog(@"TEst to retvals");
                        // Loop through the results and write them to the CSV file
                        while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
                            
                            NSString *dateid = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 0)];
                            
                            NSString *startMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 1)];
                            
                            NSString *finishMileage = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 2)];
                            
                            NSString *pickUpPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 3)];
                            
                            NSString *viaTaxi = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 4)];
                            
                            NSString *dropPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 5)];
                            
                            NSString *tipsDiscount = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(compiledStatement, 6)];
                            
                            
                            // Read the data from the result row
                            
                            NSString* line = [[NSString alloc] initWithFormat: @"%@,%@,%@,%@,%@,%@,%@,\n", dateid, startMileage, finishMileage, pickUpPoint, viaTaxi, dropPoint, tipsDiscount];
                            NSLog(@"REsponse : %@",line);
                            
                            NSData *lineData = [line dataUsingEncoding:NSUTF8StringEncoding];
                            
                            const void *lineBytes = [lineData bytes];
                            
                            int lineLength = [lineData length];
                            
                            uint8_t *lineBuf = (uint8_t*)lineBytes;
                            
                            NSInteger lineResult = [output write: lineBuf maxLength: lineLength];
                            
                            if (!errorLogged && (lineResult <= 0)) {
                                NSLog(@"exportCsv write returned %d", lineResult);
                                errorLogged = YES;
                            }
                            
                        }
                        
                        // Release the compiled statement from memory
                        sqlite3_finalize(compiledStatement);
                    }
   
                    
                }   //------SHIFT NO 1 COMPLETED -------

            }
            [output close];
        }

    }


-(void)createTempFile:(NSString*)filename {
    
    NSFileManager* fileSystem = [NSFileManager defaultManager];
    
    [fileSystem removeItemAtPath: filename error: nil];
    
   
    
    
    NSMutableDictionary* attributes = [NSMutableDictionary dictionary];
    
    NSNumber* permission = [NSNumber numberWithLong: 0640];
    
    [attributes setObject: permission forKey: NSFilePosixPermissions];
    
    
    
    if (![fileSystem createFileAtPath:filename contents: nil attributes: attributes]) {
        
        NSLog(@"Unable to create temp file for exporting CSV.");
        
        // TODO: UIAlertView?
        
    }
    else {
        
        
    }
    
}









/*
 *
 PRESHIFT VIEW DETAIL:
 *
 */
- (NSMutableArray *)findByPreShiftDetails:(NSString *)dateChange toDateChange:(NSString *)toDate
{
    self.reminders	= nil;
    self.reminders = [[NSMutableArray alloc] init];
    
    
    
    // NSMutableArray *resultArray;
    const char *dbpath = [databasePath UTF8String];
    reportView *reportRemainder;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        sqlite3_stmt *statementViewPage;
        
        
        NSString *querySQL = [NSString stringWithFormat:@"select dateidone, expectedFloat, totalCashPreShift, differencePreShift, currentDeposit, newSafePreShift, totalSafePreShift from preShift where dateidone >=\"%@\" AND dateidone <=\"%@\"", dateChange, toDate ];
        
        NSLog(@"%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        
        
        NSInteger retVals =sqlite3_prepare_v2(database, query_stmt, -1, &statementViewPage, NULL);
        NSString *valuePreShift = @"1";
        
        if ( retVals== SQLITE_OK)
        {
            
            //resultArray= [[NSMutableArray alloc]init];
            while (sqlite3_step(statementViewPage) == SQLITE_ROW)
            {
                
                reportRemainder = [[reportView alloc] init];
                reportRemainder.shiftFinder=valuePreShift;
                NSLog(@"entered row");
                NSString *datePickerOne = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statementViewPage, 0)];
                //[resultArray addObject:cashPrice];
                reportRemainder.rdatePickerOne = datePickerOne;
                
                NSString *expectedFloat = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 1)];
                //[resultArray addObject:pickUpPoint];
                reportRemainder.rexpectedFloat = expectedFloat;
                
                NSString *totalCashPreShift = [[NSString alloc] initWithUTF8String:(const char *)
                                               sqlite3_column_text(statementViewPage, 2)];
                //[resultArray addObject:viaTaxi];
                reportRemainder.rtotalCash = totalCashPreShift;
                
                NSString *differencePreShift = [[NSString alloc] initWithUTF8String:(const char *)
                                                sqlite3_column_text(statementViewPage, 3)];
                //[resultArray addObject:dropPoint];
                reportRemainder.rdifference = differencePreShift;
                
                NSString *currentDeposit = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 4)];
                //[resultArray addObject:tipsDiscount];
                reportRemainder.rcurrentDeposit = currentDeposit;
                NSString *newSafePreShift = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statementViewPage, 5)];
                //[resultArray addObject:cashPrice];
                reportRemainder.rpreNewSafe = newSafePreShift;
                NSString *totalSafePreShift = [[NSString alloc] initWithUTF8String:(const char *)
                                               sqlite3_column_text(statementViewPage, 6)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.rtotalSafe = totalSafePreShift;
                
                [self.reminders addObject:reportRemainder];
                
            }
            sqlite3_finalize(statementViewPage);
        }else{
            NSLog(@"not found");
            NSLog(@"Error in Retreieve PRESHIFT: '%s'",sqlite3_errmsg(database));
            //return nil;
        }
        //  sqlite3_reset(statementViewPage);
        
        statementViewPage  =nil;
    }
    return reminders;
}

/*
 *
 POSTSHIFT VIEW DETAIL:
 *
 */

- (NSMutableArray *)findByPostShiftDetails:(NSString *)dateChange toDateChange:(NSString *)toDate
{
    self.reminders	= nil;
    self.reminders = [[NSMutableArray alloc] init];
    
    
    
    // NSMutableArray *resultArray;
    const char *dbpath = [databasePath UTF8String];
    reportView *reportRemainder;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        sqlite3_stmt *statementViewPage;
        
        NSString *querySQL = [NSString stringWithFormat:@"select dateidtwo, openingFloat, totalCash, totalTakings, expectedTakings, cashUnderOver, newSafeDeposit, totalSafeDeposit, newOpeningFloat from postShift where dateidtwo >=\"%@\" AND dateidtwo <=\"%@\"",dateChange, toDate ];
        
        NSLog(@"%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        NSString *valuePostShift = @"2";
        
        NSInteger retVals =sqlite3_prepare_v2(database, query_stmt, -1, &statementViewPage, NULL);
        
        if ( retVals== SQLITE_OK)
        {
            
            //resultArray= [[NSMutableArray alloc]init];
            while (sqlite3_step(statementViewPage) == SQLITE_ROW)
            {
                
                reportRemainder = [[reportView alloc] init];
                reportRemainder.shiftFinder=valuePostShift;
                NSLog(@"entered row");
                NSString *datePickerTwo = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statementViewPage, 0)];
                //[resultArray addObject:cashPrice];
                reportRemainder.postRDate = datePickerTwo;
                
                NSString *openingFloatSecond = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 1)];
                //[resultArray addObject:pickUpPoint];
                reportRemainder.postROpeningFloat = openingFloatSecond;
                
                NSString *totalCashSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statementViewPage, 2)];
                //[resultArray addObject:viaTaxi];
                reportRemainder.postRTotalCash = totalCashSecond;
                
                NSString *totalTakings = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statementViewPage, 3)];
                //[resultArray addObject:dropPoint];
                reportRemainder.postRTotalTaking = totalTakings;
                NSString *expectedTakings = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 4)];
                //[resultArray addObject:tipsDiscount];
                reportRemainder.postRExpectedTaking = expectedTakings;
                
                NSString *cashUnderOver = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statementViewPage, 5)];
                //[resultArray addObject:cashPrice];
                reportRemainder.postRUnderOver = cashUnderOver;
                
                NSString *newSafeSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statementViewPage, 6)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.postRNewSafe = newSafeSecond;
                
                NSString *totalSafeSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statementViewPage, 7)];
                //[resultArray addObject:cashPrice];
                reportRemainder.postRTotalSafe = totalSafeSecond;
                
                NSString *newOpeningSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                              sqlite3_column_text(statementViewPage, 8)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.postRNewFloat = newOpeningSecond;
                
                [self.reminders addObject:reportRemainder];
                
            }
            sqlite3_finalize(statementViewPage);
        }else{
            NSLog(@"not found");
            NSLog(@"Error in Retreieve EXPENSES: '%s'",sqlite3_errmsg(database));
            //return nil;
        }
        //  sqlite3_reset(statementViewPage);
        
        statementViewPage  =nil;
    }
    return reminders;
}

/*
 *
 EXPENSES VIEW DETAIL:
 *
 */
- (NSMutableArray *)findByDateChange:(NSString *)dateChange toDateChange:(NSString *)toDate
{
    self.reminders	= nil;
    self.reminders = [[NSMutableArray alloc] init];
    
    
    
    // NSMutableArray *resultArray;
    const char *dbpath = [databasePath UTF8String];
    reportView *reportRemainder;
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        sqlite3_stmt *statementViewPage;
        
         NSString *sumTips = [NSString stringWithFormat:@"(SELECT SUM(tipsDiscount) FROM loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\")",dateChange, toDate ];
        
      
        
        NSString *sumCash = [NSString stringWithFormat:@"(SELECT SUM(cashPrice) FROM loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\")",dateChange, toDate ];
        
         NSString *sumAccount = [NSString stringWithFormat:@"(SELECT SUM(accountTotal) FROM loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\")",dateChange, toDate ];
        
        
        NSString *sumTotal = [NSString stringWithFormat:@"(SELECT SUM(totalSum) FROM loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\")",dateChange, toDate ];
        
        
        NSString *querySQL = [NSString stringWithFormat:@"select dateid, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, accountTotal, totalSum, shiftExpected, _id, startMileage, finishMileage,  %@ as sumTips, %@ as sumCash, %@ as sumAccount, %@ as sumtotal from loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\"",sumTips,sumCash,sumAccount,sumTotal, dateChange, toDate ];
        
        NSLog(@"%@",querySQL);
        const char *query_stmt = [querySQL UTF8String];
        NSString *valueExpenses = @"3";
        
        NSInteger retVals =sqlite3_prepare_v2(database, query_stmt, -1, &statementViewPage, NULL);
        
        
        if ( retVals== SQLITE_OK)
        {
         /*
            
            NSString *querySQL = [NSString stringWithFormat:@"select dateid, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, totalSum, shiftExpected, _id,"sumTips" as discount,"sumCash" as cash,"sumTotal" as total from loggingJourneyFares where dateid >=\"%@\" AND dateid <=\"%@\"",dateChange, toDate ];
           */
            
            
            
            //resultArray= [[NSMutableArray alloc]init];
            while (sqlite3_step(statementViewPage) == SQLITE_ROW)
            {
                
                reportRemainder = [[reportView alloc] init];
                reportRemainder.shiftFinder=valueExpenses;
                NSLog(@"entered row");
                NSString *dateChange = [[NSString alloc] initWithUTF8String:(const char *)
                                        sqlite3_column_text(statementViewPage, 0)];
                //[resultArray addObject:cashPrice];
                reportRemainder.dateChange = dateChange;
                NSString *pickUpPoint = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 1)];
                //[resultArray addObject:pickUpPoint];
                reportRemainder.pickUpPoint = pickUpPoint;
                
                NSString *viaTaxi = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statementViewPage, 2)];
                //[resultArray addObject:viaTaxi];
                reportRemainder.viaTaxi = viaTaxi;
                
                NSString *dropPoint = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statementViewPage, 3)];
                //[resultArray addObject:dropPoint];
                reportRemainder.dropPoint = dropPoint;
                NSString *tipsDiscount = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statementViewPage, 4)];
                //[resultArray addObject:tipsDiscount];
                reportRemainder.tipsDiscount = tipsDiscount;
                NSString *cashPrice = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statementViewPage, 5)];
                //[resultArray addObject:cashPrice];
                reportRemainder.cashPrice = cashPrice;
                
                NSString *accountTotal = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statementViewPage, 6)];
                //[resultArray addObject:cashPrice];
                reportRemainder.accountPrice = accountTotal;

                
                NSString *totalSum = [[NSString alloc] initWithUTF8String:(const char *)
                                      sqlite3_column_text(statementViewPage, 7)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.totalSum = totalSum;
                
                NSString *shift = [[NSString alloc] initWithUTF8String:(const char *)
                                   sqlite3_column_text(statementViewPage, 8)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.rshift = shift;
                
                NSString *_id = [[NSString alloc] initWithUTF8String:(const char *)
                                 sqlite3_column_text(statementViewPage, 9)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.uniqueExpenseId = _id;
                
                NSString *startMileage = [[NSString alloc] initWithUTF8String:(const char *)
                                 sqlite3_column_text(statementViewPage, 10)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.startNote = startMileage;
                
                NSString *finishMileage = [[NSString alloc] initWithUTF8String:(const char *)
                                 sqlite3_column_text(statementViewPage, 11)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.finishNote = finishMileage;
                
                
      
                NSString *sumOfTips = [[NSString alloc] initWithUTF8String:(const char *)
                                   sqlite3_column_text(statementViewPage, 12)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.sumTipsDiscount = sumOfTips;
                
                NSString *sumOfCash = [[NSString alloc] initWithUTF8String:(const char *)
                                   sqlite3_column_text(statementViewPage, 13)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.sumCashPrice = sumOfCash;
                
                NSString *sumOfAccount = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statementViewPage, 14)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.sumAccount = sumOfAccount;
                
                
                NSString *sumOfTotal = [[NSString alloc] initWithUTF8String:(const char *)
                                   sqlite3_column_text(statementViewPage, 15)];
                
                // [resultArray addObject:totalSum];
                reportRemainder.sumTotal = sumOfTotal;
                
               
          
                
                
                
                
                [self.reminders addObject:reportRemainder];

                
                
                
                
                
                
            }
            sqlite3_finalize(statementViewPage);
        }else{
            NSLog(@"not found");
            NSLog(@"Error in Retreieve EXPENSES: '%s'",sqlite3_errmsg(database));
            //return nil;
        }
        //  sqlite3_reset(statementViewPage);
        
        statementViewPage  =nil;
    }
    return reminders;
}

/** Delete Expenses by row **/
/*
 
 -(void)deleteExpensesByRow:(NSString *) mID
 
 {
 // int num = [mID intValue];
 NSLog(@"delete row no : %@",mID);
 const char *dbpath = [databasePath UTF8String];
 if (sqlite3_open(dbpath, &database) == SQLITE_OK)
 {
 
 NSString *sql = [NSString stringWithFormat: @"delete from loggingJourneyFares where _id =%@", mID];
 NSLog(@"query: %@",sql);
 const char *del_stmt = [sql UTF8String];
 sqlite3_stmt *deleteStmt;
 sqlite3_prepare_v2(database, del_stmt, -1, & deleteStmt, NULL);
 if (sqlite3_step(deleteStmt) == SQLITE_DONE)
 {
 NSLog(@"sqlite done : %@",mID);
 } else {
 
 }
 sqlite3_finalize(deleteStmt);
 sqlite3_close(database);
 
 
 }
 
 
 }
 
 */


/*==================================================================
 METHOD FOR CHECKING WHETHER RECORD EXISTS OR NOT IN DATABASE
 ==================================================================*/

-(BOOL)recordExistOrNot:(NSString *)query{
    BOOL recordExist=NO;
    
    const char *dbpath_check = [databasePath UTF8String];
    if(sqlite3_open(dbpath_check, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *statement_validate;
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement_validate, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement_validate)==SQLITE_ROW)
            {
                recordExist=YES;
                NSLog(@"record exist");
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
                NSLog(@"recordis not exist");
            }
            sqlite3_reset(statement_validate);
            sqlite3_finalize(statement_validate);
            // sqlite3_close(database);
            
        }
    }
    return recordExist;
}


//preshift

-(BOOL)

savePreShift:(NSString *)datePickerOne
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
newFloat:(NSString *)newFloat

{
    const char *dbpath_preShift = [databasePath UTF8String];
    if (sqlite3_open(dbpath_preShift, &database) == SQLITE_OK)
    {
        
        NSString *alertFields;
        NSString *alertSuccess;
        
        sqlite3_stmt *statement_preShift = nil;
        
        NSString *query  = [NSString stringWithFormat:@"select * from preShift where dateidone = \"%@\"", datePickerOne ];
        NSLog(@"query : %@",query);
        
        BOOL recordExist =[self recordExistOrNot:query];
        
        if (!recordExist) {
            
            // Insert your data
            NSString *insertSQL_preShift = [NSString stringWithFormat:@"insert into preShift (dateidone, onepqPreShift, oneptPreShift, twopqPreShift, twoptPreShift, fivepqPreShift, fiveptPreShift, tenpqPreShift, tenptPreShift, twentypqPreShift, twentyptPreShift, fiftypqPreShift, fiftyptPreShift, onenqPreShift, onentPreShift, twonqPreShift, twontPreShift, fivenqPreShift, fiventPreShift, tennqPreShift, tenntPreShift, twentynqPreShift, twentyntPreShift, fiftynqPreShift, fiftyntPreShift, differencePreShift, expectedFloat, currentDeposit, totalCashPreShift, newSafePreShift, totalSafePreShift, newFloatPreShift) values (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", datePickerOne, onePence, oneTotalPence, twoPence, twoTotalPence, fivePence, fiveTotalPence, tenPence, tenTotalPence, twentyPence, twentyTotalPence, fiftyPence, fiftyTotalPence, oneNote, oneTotalNote, twoNote, twoTotalNote, fiveNote, fiveTotalNote, tenNote, tenTotalNote, twentyNote, twentyTotalNote, fiftyNote, fiftyTotalNote, difference, expectedFloat, currentDeposit, totalCash, newSafe, totalSafe, newFloat];
            
            const char *insert_stmt = [insertSQL_preShift UTF8String];
            sqlite3_prepare_v2(database, insert_stmt,-1, &statement_preShift, NULL);
            
            NSLog(@"Insertquery : %@",insertSQL_preShift);
            
            
            if (sqlite3_step(statement_preShift) == SQLITE_DONE)
            {
                //INSERTED SUCCESSFULLY
                UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:alertSuccess message:@"Saved Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                return YES;
                
            }
            else{
                NSLog(@"Error in insertion : '%s'",sqlite3_errmsg(database));
                //NOT INSERTED
                UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:alertFields message:@"Not Inserted" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                return NO;
            }
            sqlite3_reset(statement_preShift);
            sqlite3_finalize(statement_preShift);
            
        }
        else{
            
            
            //UPDATE QUERY
            NSLog(@"entered update");
            
            sqlite3_stmt *updateStatement;
            const char *dbpath_preShift = [databasePath UTF8String];
            if (sqlite3_open(dbpath_preShift, &database) == SQLITE_OK)
            {
                NSString *updateSQL = [NSString stringWithFormat:@"UPDATE preShift SET onepqPreShift=\"%@\", oneptPreShift=\"%@\", twopqPreShift=\"%@\", twoptPreShift=\"%@\", fivepqPreShift=\"%@\", fiveptPreShift=\"%@\", tenpqPreShift=\"%@\", tenptPreShift=\"%@\", twentypqPreShift=\"%@\", twentyptPreShift=\"%@\", fiftypqPreShift=\"%@\", fiftyptPreShift=\"%@\", onenqPreShift=\"%@\", onentPreShift=\"%@\", twonqPreShift=\"%@\", twontPreShift=\"%@\", fivenqPreShift=\"%@\", fiventPreShift=\"%@\", tennqPreShift=\"%@\", tenntPreShift=\"%@\", twentynqPreShift=\"%@\", twentyntPreShift=\"%@\", fiftynqPreShift=\"%@\", fiftyntPreShift=\"%@\", differencePreShift=\"%@\", expectedFloat=\"%@\", currentDeposit=\"%@\", totalCashPreShift=\"%@\", newSafePreShift=\"%@\", totalSafePreShift=\"%@\", newFloatPreShift=\"%@\" WHERE dateidone=\"%@\" ", onePence, oneTotalPence, twoPence, twoTotalPence, fivePence, fiveTotalPence, tenPence, tenTotalPence, twentyPence, twentyTotalPence, fiftyPence, fiftyTotalPence, oneNote, oneTotalNote, twoNote, twoTotalNote, fiveNote, fiveTotalNote, tenNote, tenTotalNote, twentyNote, twentyTotalNote, fiftyNote, fiftyTotalNote, difference, expectedFloat, currentDeposit, totalCash, newSafe, totalSafe, newFloat, datePickerOne];
                
                
                
                const char *update_stmt = [updateSQL UTF8String];
                sqlite3_prepare_v2(database, update_stmt,-1, &updateStatement, NULL);
                
                
                
                
                if (sqlite3_step(updateStatement) == SQLITE_DONE)
                {
                    
                    UIAlertView *alertupdate1 = [[UIAlertView alloc]initWithTitle:alertSuccess message:@"Data updated" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertupdate1 show];
                } else {
                    UIAlertView *alertupdate2 = [[UIAlertView alloc]initWithTitle:alertFields message:@"Updation failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertupdate2 show];
                }
                sqlite3_finalize(updateStatement);
                
            }
            
            
            return NO;
        }
        
        
        //sqlite3_close(database);
    }
    
    return NO;
    
}




//CURRENT DEPOSIT FROM POSTSHIFT TO PRESHIFT

-(NSString *) retrieve;

{
    NSString *depositString;
    NSString *depositQuery  = [NSString stringWithFormat:@"select totalSafeDeposit from postShift WHERE _postshiftid = (select MAX(_postshiftid) from  postShift)"] ;
    
    const char *dbpath_retrieve = [databasePath UTF8String];
    if(sqlite3_open(dbpath_retrieve, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *satatement_retrieve;
        if (sqlite3_prepare_v2(database, [depositQuery UTF8String], -1, &satatement_retrieve, nil)==SQLITE_OK)
        {
            if (sqlite3_step(satatement_retrieve)==SQLITE_ROW)
            {
                
                char* valsReturn = (char*) sqlite3_column_text(satatement_retrieve, 0);
                if (valsReturn != NULL )  {
                    depositString = [NSString stringWithUTF8String:valsReturn];
                    NSLog(@"yes : %@" ,depositString);
                }
            }
            else
            {
                NSLog(@"Error in Retrieve : '%s'",sqlite3_errmsg(database));
            }
            sqlite3_reset(satatement_retrieve);
            sqlite3_finalize(satatement_retrieve);
            
            
        }
        // sqlite3_close(database);
    }
    
    return depositString;
}

//OPENING FLOAT FROM POSTSHIFT TO preExpectedOpeningFloat

-(NSString *) preExpectedOpeningFloat;

{
    NSString *postOpening;
    NSString *postOpeningFloatQuery  = [NSString stringWithFormat:@"select openingFloat from postShift WHERE  _postshiftid = (select MAX(_postshiftid) from  postShift)"];
    
    const char *dbpath_retrieve = [databasePath UTF8String];
    if(sqlite3_open(dbpath_retrieve, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *satatement_retrieve;
        if (sqlite3_prepare_v2(database, [postOpeningFloatQuery UTF8String], -1, &satatement_retrieve, nil)==SQLITE_OK)
        {
            if (sqlite3_step(satatement_retrieve)==SQLITE_ROW)
            {
                char* valsReturn = (char*) sqlite3_column_text(satatement_retrieve, 0);
                if (valsReturn != NULL )  {
                    postOpening = [NSString stringWithUTF8String:valsReturn];
                    NSLog(@"yes : %@" ,postOpening);
                }
                
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
                NSLog(@"No");
            }
            sqlite3_reset(satatement_retrieve);
            sqlite3_finalize(satatement_retrieve);
            
            
        }
        // sqlite3_close(database);
    }
    
    return postOpening;
}




//Retrieve Preshift

- (NSArray *)viewDetails:(NSString *)datePickerOne
{
    const char *dbpath_check = [databasePath UTF8String];
    NSMutableArray *resultArray1;
    if (sqlite3_open(dbpath_check, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *statement_preShiftRetrieve = nil;
        NSString *querySQL1 = [NSString stringWithFormat:@"select onepqPreShift, oneptPreShift, twopqPreShift, twoptPreShift, fivepqPreShift, fiveptPreShift, tenpqPreShift, tenptPreShift, twentypqPreShift, twentyptPreShift, fiftypqPreShift, fiftyptPreShift, onenqPreShift, onentPreShift, twonqPreShift, twontPreShift, fivenqPreShift, fiventPreShift, tennqPreShift, tenntPreShift, twentynqPreShift, twentyntPreShift, fiftynqPreShift, fiftyntPreShift, differencePreShift, expectedFloat, currentDeposit, totalCashPreShift, newSafePreShift, totalSafePreShift, newFloatPreShift from preShift where dateidone =\"%@\"",datePickerOne];
        
        
        const char *retreiveStmt = [querySQL1 UTF8String];
        NSInteger retVal = sqlite3_prepare_v2(database, retreiveStmt,-1, &statement_preShiftRetrieve, NULL);
        
        // NSLog(@"RETRIEVE QUERY : %@",querySQL1);
        
        
        if(retVal == SQLITE_OK)
        {
            resultArray1 = [[NSMutableArray alloc]init];
            
            if (sqlite3_step(statement_preShiftRetrieve) == SQLITE_ROW)
            {
                NSString *onePence = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 0)];
                [resultArray1 addObject:onePence];
                
                NSString *oneTotalPence = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 1)];
                [resultArray1 addObject:oneTotalPence];
                
                NSString *twoPence = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 2)];
                [resultArray1 addObject:twoPence];
                
                NSString *twoTotalPence = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statement_preShiftRetrieve, 3)];
                [resultArray1 addObject:twoTotalPence];
                
                NSString *fivePence = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement_preShiftRetrieve, 4)];
                [resultArray1 addObject:fivePence];
                
                NSString *fiveTotalPence = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 5)];
                [resultArray1 addObject:fiveTotalPence];
                NSString *tenPence = [[NSString alloc] initWithUTF8String:(const char *)
                                      sqlite3_column_text(statement_preShiftRetrieve, 6)];
                [resultArray1 addObject:tenPence];
                NSString *tenTotalPence = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statement_preShiftRetrieve, 7)];
                [resultArray1 addObject:tenTotalPence];
                NSString *twentyPence = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 8)];
                [resultArray1 addObject:twentyPence];
                NSString *twentyTotalPence = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 9)];
                [resultArray1 addObject:twentyTotalPence];
                NSString *fiftyPence = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 10)];
                [resultArray1 addObject:fiftyPence];
                NSString *fiftyTotalPence = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statement_preShiftRetrieve, 11)];
                [resultArray1 addObject:fiftyTotalPence];
                NSString *oneNote = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement_preShiftRetrieve, 12)];
                [resultArray1 addObject:oneNote];
                NSString *oneTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 13)];
                [resultArray1 addObject:oneTotalNote];
                NSString *twoNote = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement_preShiftRetrieve, 14)];
                [resultArray1 addObject:twoNote];
                NSString *twoTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statement_preShiftRetrieve, 15)];
                [resultArray1 addObject:twoTotalNote];
                NSString *fiveNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 16)];
                [resultArray1 addObject:fiveNote];
                NSString *fiveTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 17)];
                [resultArray1 addObject:fiveTotalNote];
                NSString *tenNote = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 18)];
                [resultArray1 addObject:tenNote];
                NSString *tenTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statement_preShiftRetrieve, 19)];
                [resultArray1 addObject:tenTotalNote];
                NSString *twentyNote = [[NSString alloc] initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement_preShiftRetrieve, 20)];
                [resultArray1 addObject:twentyNote];
                NSString *twentyTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 21)];
                [resultArray1 addObject:twentyTotalNote];
                NSString *fiftyNote = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement_preShiftRetrieve, 22)];
                [resultArray1 addObject:fiftyNote];
                NSString *fiftyTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement_preShiftRetrieve, 23)];
                [resultArray1 addObject:fiftyTotalNote];
                NSString *difference = [[NSString alloc] initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement_preShiftRetrieve, 24)];
                [resultArray1 addObject:difference];
                NSString *expectedFloat = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statement_preShiftRetrieve, 25)];
                [resultArray1 addObject:expectedFloat];
                NSString *currentDeposit = [[NSString alloc] initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement_preShiftRetrieve, 26)];
                
                [resultArray1 addObject:currentDeposit];
                NSString *totalCash = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_preShiftRetrieve, 27)];
                [resultArray1 addObject:totalCash];
                NSString *newSafe = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement_preShiftRetrieve, 28)];
                [resultArray1 addObject:newSafe];
                NSString *totalSafe = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement_preShiftRetrieve, 29)];
                [resultArray1 addObject:totalSafe];
                NSString *newFloat = [[NSString alloc] initWithUTF8String:(const char *)
                                      sqlite3_column_text(statement_preShiftRetrieve, 30)];
                [resultArray1 addObject:newFloat];
                
                //return resultArray1;
            }
            else {
                NSLog(@"not found");
                NSLog(@"Error in Retrieve : '%s'",sqlite3_errmsg(database));
                return nil;
            }
            
        }
        else {
            NSLog(@"not found");
            NSLog(@"Error in Retreieve : '%s'",sqlite3_errmsg(database));
            return nil;
        }
        sqlite3_reset(statement_preShiftRetrieve);
        sqlite3_finalize(statement_preShiftRetrieve);
        statement_preShiftRetrieve = nil;
    }
    
    return resultArray1;
}

//postshift

-(BOOL) savePostShift:(NSString *)datePickerTwo
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



{
    
    const char *dbpath_postShift = [databasePath UTF8String];
    if (sqlite3_open(dbpath_postShift, &database) == SQLITE_OK)
    {
        
        NSString *alertFields;
        NSString *alertSuccess;
        sqlite3_stmt *statement_postShift = nil;
        
        NSString *query  = [NSString stringWithFormat:@"select * from postShift where dateidtwo = \"%@\"", datePickerTwo ];
        NSLog(@"query : %@",query);
        
        BOOL recordExist =[self recordExistOrNot:query];
        
        if (!recordExist){
            
            NSString *insertSQL_postShift = [NSString stringWithFormat:@"insert into postShift (dateidtwo, onepqPostShift, oneptPostShift, twopqPostShift, twoptPostShift, fivepqPostShift, fiveptPostShift, tenpqPostShift, tenptPostShift, twentypqPostShift, twentyptPostShift, fiftypqPostShift, fiftyptPostShift, onenqPostShift, onentPostShift, twonqPostShift, twontPostShift, fivenqPostShift, fiventPostShift, tennqPostShift, tenntPostShift, twentynqPostShift, twentyntPostShift, fiftynqPostShift, fiftyntPostShift, openingFloat, fuelReceipts, premierCashShare, premierAccountShare, totalCash, currentSafeDeposit, totalTakings, expectedTakings, cashUnderOver, newSafeDeposit, totalSafeDeposit, newOpeningFloat) values (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", datePickerTwo, onePenceSecond, oneTotalPenceSecond, twoPenceSecond, twoTotalPenceSecond, fivePenceSecond, fiveTotalPenceSecond, tenPenceSecond, tenTotalPenceSecond, twentyPenceSecond, twentyTotalPenceSecond, fiftyPenceSecond, fiftyTotalPenceSecond, oneNoteSecond, oneTotalNoteSecond, twoNoteSecond, twoTotalNoteSecond, fiveNoteSecond, fiveTotalNoteSecond, tenNoteSecond, tenTotalNoteSecond, twentyNoteSecond, twentyTotalNoteSecond, fiftyNoteSecond, fiftyTotalNoteSecond, openingFloatSecond, fuelReceipts, premierCashShare, premierAccountShare, totalCashSecond, currentDepositSecond, totalTakings, expectedTakings, cashUnderOver, newSafeSecond, totalSafeSecond, newOpeningSecond];
            
            
            
            
            const char *insert_stmt = [insertSQL_postShift UTF8String];
            sqlite3_prepare_v2(database, insert_stmt,-1, &statement_postShift, NULL);
            NSLog(@"Insertquery : %@",insertSQL_postShift);
            
            
            
            if (sqlite3_step(statement_postShift) == SQLITE_DONE)
            {
                //INSERTED SUCCESSFULLY
                UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:alertSuccess message:@"Saved Successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                return YES;
                
            }
            else{
                //NOT INSERTED
                UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:alertFields message:@"Not Inserted" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                return NO;
            }
            sqlite3_reset(statement_postShift);
            
        }
        else{
            //UPDATE QUERY
            NSLog(@"entered update");
            
            sqlite3_stmt *updatePostStatement;
            const char *dbpath_postShift = [databasePath UTF8String];
            if (sqlite3_open(dbpath_postShift, &database) == SQLITE_OK)
            {
                NSString *updatePostSQL = [NSString stringWithFormat: @"UPDATE postShift SET onepqPostShift=\"%@\", oneptPostShift=\"%@\", twopqPostShift=\"%@\", twoptPostShift=\"%@\", fivepqPostShift=\"%@\", fiveptPostShift=\"%@\", tenpqPostShift=\"%@\", tenptPostShift=\"%@\", twentypqPostShift=\"%@\", twentyptPostShift=\"%@\", fiftypqPostShift=\"%@\", fiftyptPostShift=\"%@\", onenqPostShift=\"%@\", onentPostShift=\"%@\", twonqPostShift=\"%@\", twontPostShift=\"%@\", fivenqPostShift=\"%@\", fiventPostShift=\"%@\", tennqPostShift=\"%@\", tenntPostShift=\"%@\", twentynqPostShift=\"%@\", twentyntPostShift=\"%@\", fiftynqPostShift=\"%@\", fiftyntPostShift=\"%@\", openingFloat=\"%@\", fuelReceipts=\"%@\", premierCashShare=\"%@\", premierAccountShare=\"%@\", totalCash=\"%@\", currentSafeDeposit=\"%@\", totalTakings=\"%@\", expectedTakings=\"%@\", cashUnderOver=\"%@\", newSafeDeposit=\"%@\", totalSafeDeposit=\"%@\", newOpeningFloat=\"%@\" WHERE dateidtwo=\"%@\" ", onePenceSecond, oneTotalPenceSecond, twoPenceSecond, twoTotalPenceSecond, fivePenceSecond, fiveTotalPenceSecond, tenPenceSecond, tenTotalPenceSecond, twentyPenceSecond, twentyTotalPenceSecond, fiftyPenceSecond, fiftyTotalPenceSecond, oneNoteSecond, oneTotalNoteSecond, twoNoteSecond, twoTotalNoteSecond, fiveNoteSecond, fiveTotalNoteSecond, tenNoteSecond, tenTotalNoteSecond, twentyNoteSecond, twentyTotalNoteSecond, fiftyNoteSecond, fiftyTotalNoteSecond, openingFloatSecond, fuelReceipts, premierCashShare, premierAccountShare, totalCashSecond, currentDepositSecond, totalTakings, expectedTakings, cashUnderOver, newSafeSecond, totalSafeSecond, newOpeningSecond, datePickerTwo];
                
                
                
                
                
                
                const char *update_stmt = [updatePostSQL UTF8String];
                sqlite3_prepare_v2(database, update_stmt,-1, &updatePostStatement, NULL);
                
                
                
                
                if (sqlite3_step(updatePostStatement) == SQLITE_DONE)
                {
                    
                    UIAlertView *alertupdate3 = [[UIAlertView alloc]initWithTitle:alertSuccess message:@"Data updated" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertupdate3 show];
                } else {
                    UIAlertView *alertupdate4 = [[UIAlertView alloc]initWithTitle:alertFields message:@"Updation failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alertupdate4 show];
                }
                sqlite3_finalize(updatePostStatement);
                
            }
            return NO;
        }
        sqlite3_reset(statement_postShift);
        sqlite3_finalize(statement_postShift);
        
        // sqlite3_close(database);
    }
    
    return NO;
}

//OPENING FLOAT FROM PRESHIFT TOTAL CASH

-(NSString *) cashFromPreToPostOpeningFloat;

{
    NSString *floatFromPre;
    NSString *floatFromPreTotalQuery  = [NSString stringWithFormat:@"select totalCashPreShift from preShift WHERE _preshiftid = (select MAX(_preshiftid) from  preShift)"] ;
    
    const char *dbpath_retrieve = [databasePath UTF8String];
    if(sqlite3_open(dbpath_retrieve, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *satatement_retrieve;
        if (sqlite3_prepare_v2(database, [floatFromPreTotalQuery UTF8String], -1, &satatement_retrieve, nil)==SQLITE_OK)
        {
            if (sqlite3_step(satatement_retrieve)==SQLITE_ROW)
            {
                char* valsReturn = (char*) sqlite3_column_text(satatement_retrieve, 0);
                if (valsReturn != NULL )  {
                    floatFromPre = [NSString stringWithUTF8String:valsReturn];
                    NSLog(@"yes : %@" ,floatFromPre);
                }
                
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
                NSLog(@"No");
            }
            sqlite3_reset(satatement_retrieve);
            sqlite3_finalize(satatement_retrieve);
            
            
        }
        // sqlite3_close(database);
    }
    
    return floatFromPre;
}



//EXPECTED TAKINGS FROM EXPENSES GRAND TOTAL

-(NSString *) expectedTakingsFromTotalExpenses:(NSString *)datePickerFromPost;

{
    
    NSString *grandTotalResponse;
    NSString *grandTotalFromExp  = [NSString stringWithFormat:@"select sum(totalSum) as grandTotal from loggingJourneyFares GROUP BY dateid HAVING dateid = \"%@\"", datePickerFromPost ] ;
    
    const char *dbpath_retrieve = [databasePath UTF8String];
    if(sqlite3_open(dbpath_retrieve, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *satatement_retrieve;
        if (sqlite3_prepare_v2(database, [grandTotalFromExp UTF8String], -1, &satatement_retrieve, nil)==SQLITE_OK)
        {
            if (sqlite3_step(satatement_retrieve)==SQLITE_ROW)
            {
                char* valsReturn = (char*) sqlite3_column_text(satatement_retrieve, 0);
                if (valsReturn != NULL )  {
                    grandTotalResponse = [NSString stringWithUTF8String:valsReturn];
                    NSLog(@"yes : %@" ,grandTotalResponse);
                }
                
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
                NSLog(@"No");
            }
            sqlite3_reset(satatement_retrieve);
            sqlite3_finalize(satatement_retrieve);
            
            
        }
        // sqlite3_close(database);
    }
    
    return grandTotalResponse;
}





//POST SHIFT CURRENT DEPOSIT FROM POST SHIFT TOTAL SAFE DEPOSIT

-(NSString *) currentDepositFromTotalCashPost;

{
    NSString *currentDepositTotal;
    NSString *currentDepositFromTotal  = [NSString stringWithFormat:@"select totalSafeDeposit from postShift WHERE _postshiftid = (select MAX(_postshiftid) from  postShift)"] ;
    
    const char *dbpath_retrieve = [databasePath UTF8String];
    if(sqlite3_open(dbpath_retrieve, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *satatement_retrieve;
        if (sqlite3_prepare_v2(database, [currentDepositFromTotal UTF8String], -1, &satatement_retrieve, nil)==SQLITE_OK)
        {
            if (sqlite3_step(satatement_retrieve)==SQLITE_ROW)
            {
                char* valsReturn = (char*) sqlite3_column_text(satatement_retrieve, 0);
                if (valsReturn != NULL )  {
                    currentDepositTotal = [NSString stringWithUTF8String:valsReturn];
                    NSLog(@"yes : %@" ,currentDepositTotal);
                }
                
            }
            else
            {
                
                NSLog(@"No");
            }
            sqlite3_reset(satatement_retrieve);
            sqlite3_finalize(satatement_retrieve);
            
            
        }
        // sqlite3_close(database);
    }
    
    return currentDepositTotal;
}





//postshift retrieve

-(NSArray *) viewDetailsPostShift:(NSString *)datePickerTwo
{
    NSMutableArray *resultArray2 ;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        
        sqlite3_stmt *statement_postShiftRetrieve;
        NSString *querySQL2 = [NSString stringWithFormat:@"select onepqPostShift, oneptPostShift, twopqPostShift, twoptPostShift, fivepqPostShift, fiveptPostShift, tenpqPostShift, tenptPostShift, twentypqPostShift, twentyptPostShift, fiftypqPostShift, fiftyptPostShift, onenqPostShift, onentPostShift, twonqPostShift, twontPostShift, fivenqPostShift, fiventPostShift, tennqPostShift, tenntPostShift, twentynqPostShift, twentyntPostShift, fiftynqPostShift, fiftyntPostShift, openingFloat, fuelReceipts, premierCashShare, premierAccountShare, totalCash, currentSafeDeposit,totalTakings, expectedTakings, cashUnderOver, newSafeDeposit, totalSafeDeposit, newOpeningFloat from postShift where dateidtwo =\"%@\"",datePickerTwo];
        const char *query_stmt = [querySQL2 UTF8String];
        
        
        NSInteger retValues = sqlite3_prepare_v2(database, query_stmt, -1, &statement_postShiftRetrieve, NULL);
        
        // NSLog(@"RETRIEVE QUERY : %@",querySQL1);
        
        
        if(retValues == SQLITE_OK)
        {
            
            resultArray2 = [[NSMutableArray alloc]init];
            
            if (sqlite3_step(statement_postShiftRetrieve) == SQLITE_ROW)
            {
                NSString *onePenceSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 0)];
                [resultArray2 addObject:onePenceSecond];
                NSString *oneTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 1)];
                [resultArray2 addObject:oneTotalPenceSecond];
                NSString *twoPenceSecond = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 2)];
                [resultArray2 addObject:twoPenceSecond];
                NSString *twoTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                                 sqlite3_column_text(statement_postShiftRetrieve, 3)];
                [resultArray2 addObject:twoTotalPenceSecond];
                NSString *fivePenceSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statement_postShiftRetrieve, 4)];
                [resultArray2 addObject:fivePenceSecond];
                NSString *fiveTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 5)];
                [resultArray2 addObject:fiveTotalPenceSecond];
                NSString *tenPenceSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement_postShiftRetrieve, 6)];
                [resultArray2 addObject:tenPenceSecond];
                NSString *tenTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                                 sqlite3_column_text(statement_postShiftRetrieve, 7)];
                [resultArray2 addObject:tenTotalPenceSecond];
                NSString *twentyPenceSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 8)];
                [resultArray2 addObject:twentyPenceSecond];
                NSString *twentyTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 9)];
                [resultArray2 addObject:twentyTotalPenceSecond];
                NSString *fiftyPenceSecond = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 10)];
                [resultArray2 addObject:fiftyPenceSecond];
                NSString *fiftyTotalPenceSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                                   sqlite3_column_text(statement_postShiftRetrieve, 11)];
                [resultArray2 addObject:fiftyTotalPenceSecond];
                NSString *oneNote = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement_postShiftRetrieve, 12)];
                [resultArray2 addObject:oneNote];
                NSString *oneTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 13)];
                [resultArray2 addObject:oneTotalNote];
                NSString *twoNote = [[NSString alloc] initWithUTF8String:(const char *)
                                     sqlite3_column_text(statement_postShiftRetrieve, 14)];
                [resultArray2 addObject:twoNote];
                NSString *twoTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statement_postShiftRetrieve, 15)];
                [resultArray2 addObject:twoTotalNote];
                NSString *fiveNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 16)];
                [resultArray2 addObject:fiveNote];
                NSString *fiveTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 17)];
                [resultArray2 addObject:fiveTotalNote];
                NSString *tenNote = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 18)];
                [resultArray2 addObject:tenNote];
                NSString *tenTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statement_postShiftRetrieve, 19)];
                [resultArray2 addObject:tenTotalNote];
                NSString *twentyNote = [[NSString alloc] initWithUTF8String:(const char *)
                                        sqlite3_column_text(statement_postShiftRetrieve, 20)];
                [resultArray2 addObject:twentyNote];
                NSString *twentyTotalNote = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 21)];
                [resultArray2 addObject:twentyTotalNote];
                NSString *fiftyNote = [[NSString alloc] initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement_postShiftRetrieve, 22)];
                [resultArray2 addObject:fiftyNote];
                NSString *fiftyTotalNote = [[NSString alloc] initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement_postShiftRetrieve, 23)];
                [resultArray2 addObject:fiftyTotalNote];
                NSString *openingFloatSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                                sqlite3_column_text(statement_postShiftRetrieve, 24)];
                [resultArray2 addObject:openingFloatSecond];
                NSString *fuelReceipts = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 25)];
                [resultArray2 addObject:fuelReceipts];
                NSString *premierCashShare = [[NSString alloc] initWithUTF8String:(const char *)
                                              sqlite3_column_text(statement_postShiftRetrieve, 26)];
                [resultArray2 addObject:premierCashShare];
                NSString *premierAccountShare = [[NSString alloc] initWithUTF8String:(const char *)
                                                 sqlite3_column_text(statement_postShiftRetrieve, 27)];
                [resultArray2 addObject:premierAccountShare];
                NSString *totalCashShare = [[NSString alloc] initWithUTF8String:(const char *)
                                            sqlite3_column_text(statement_postShiftRetrieve, 28)];
                [resultArray2 addObject:totalCashShare];
                
                NSString *currentDepositSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 29)];
                [resultArray2 addObject:currentDepositSecond];
                NSString *totalTakings = [[NSString alloc] initWithUTF8String:(const char *)
                                          sqlite3_column_text(statement_postShiftRetrieve, 30)];
                [resultArray2 addObject:totalTakings];
                NSString *expectedTakings = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statement_postShiftRetrieve, 31)];
                [resultArray2 addObject:expectedTakings];
                NSString *cashUnderOver = [[NSString alloc] initWithUTF8String:(const char *)
                                           sqlite3_column_text(statement_postShiftRetrieve, 32)];
                [resultArray2 addObject:cashUnderOver];
                
                NSString *newSafeSecond = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement_postShiftRetrieve, 33)];
                [resultArray2 addObject:newSafeSecond];
                NSString *totalSafeSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                             sqlite3_column_text(statement_postShiftRetrieve, 34)];
                [resultArray2 addObject:totalSafeSecond];
                NSString *newOpeningSecond = [[NSString alloc] initWithUTF8String:(const char *)
                                              sqlite3_column_text(statement_postShiftRetrieve, 35)];
                [resultArray2 addObject:newOpeningSecond];
                
            }
            else {
                NSLog(@"not found");
                NSLog(@"Error in Retrieve POST: '%s'",sqlite3_errmsg(database));
                return nil;
            }
            
        }
        else {
            NSLog(@"not found");
            NSLog(@"Error in Retreieve POST: '%s'",sqlite3_errmsg(database));
            return nil;
        }
        sqlite3_reset(statement_postShiftRetrieve);
        sqlite3_finalize(statement_postShiftRetrieve);
        statement_postShiftRetrieve = nil;
    }
    
    return resultArray2;
}










@end
