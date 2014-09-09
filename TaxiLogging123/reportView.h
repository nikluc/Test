//
//  reportView.h
//  TaxiLogging
//
//  Created by PPTS on 25/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface reportView : NSObject
//Expenses
@property (nonatomic, copy) NSString *dateChange;
@property (nonatomic, copy) NSString *pickUpPoint;
@property (nonatomic, copy) NSString *viaTaxi;
@property (nonatomic, copy) NSString *dropPoint;
@property (nonatomic, copy) NSString *tipsDiscount;
@property (nonatomic, copy) NSString *cashPrice;

@property (nonatomic, copy) NSString *totalSum;
@property (nonatomic, copy) NSString *rshift;
@property (nonatomic, copy) NSString *accountPrice;
@property (nonatomic, copy) NSString *shiftFinder;
@property (nonatomic, copy) NSString *uniqueExpenseId;
@property (nonatomic, copy) NSString *startNote;
@property (nonatomic, copy) NSString *finishNote;
@property (nonatomic, copy) NSString *sumTipsDiscount;
@property (nonatomic, copy) NSString *sumCashPrice;
@property (nonatomic, copy) NSString *sumAccount;
@property (nonatomic, copy) NSString *sumTotal;



//PreShift
@property (nonatomic, copy) NSString *rdatePickerOne;
@property (nonatomic, copy) NSString *rexpectedFloat;
@property (nonatomic, copy) NSString *rtotalCash;
@property (nonatomic, copy) NSString *rdifference;
@property (nonatomic, copy) NSString *rcurrentDeposit;
@property (nonatomic, copy) NSString *rpreNewSafe;
@property (nonatomic, copy) NSString *rtotalSafe;

//postshift
@property (nonatomic, copy) NSString *postRDate;
@property (nonatomic, copy) NSString *postROpeningFloat;
@property (nonatomic, copy) NSString *postRTotalCash;
@property (nonatomic, copy) NSString *postRTotalTaking;
@property (nonatomic, copy) NSString *postRExpectedTaking;
@property (nonatomic, copy) NSString *postRUnderOver;
@property (nonatomic, copy) NSString *postRNewSafe;
@property (nonatomic, copy) NSString *postRTotalSafe;
@property (nonatomic, copy) NSString *postRNewFloat;


//extras

@property (nonatomic, copy) NSString *dataStore;

@end
