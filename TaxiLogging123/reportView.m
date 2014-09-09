//
//  reportView.m
//  TaxiLogging
//
//  Created by PPTS on 25/06/14.
//  Copyright (c) 2014 ppts. All rights reserved.
//

#import "reportView.h"

@implementation reportView



@synthesize dateChange, pickUpPoint, viaTaxi, dropPoint, tipsDiscount, cashPrice, totalSum, rshift, accountPrice, shiftFinder, uniqueExpenseId, startNote, finishNote, rdatePickerOne, rexpectedFloat, rtotalCash, rdifference, rcurrentDeposit, rpreNewSafe, rtotalSafe, postRDate, postROpeningFloat, postRTotalCash, postRTotalTaking, postRExpectedTaking, postRUnderOver, postRNewSafe, postRTotalSafe, postRNewFloat, sumCashPrice, sumTipsDiscount, sumAccount, sumTotal, dataStore;

-(void)dealloc
{
    self.dateChange = nil;
    self.pickUpPoint = nil;
    self.viaTaxi = nil;
    self.dropPoint = nil;
    self.tipsDiscount = nil;
    self.cashPrice = nil;
   
    self.totalSum = nil;
    self.rshift = nil;
     self.accountPrice = nil;
    self.shiftFinder = nil;
    self.uniqueExpenseId = nil;
    self.startNote = nil;
    self.finishNote = nil;
    self.rdatePickerOne = nil;
    self.rexpectedFloat = nil;
    self.rtotalCash = nil;
    self.rdifference = nil;
    self.rcurrentDeposit = nil;
    self.rpreNewSafe = nil;
    self.rtotalSafe = nil;
    
    self.postRDate = nil;
    self.postROpeningFloat = nil;
    self.postRTotalCash = nil;
    self.postRTotalTaking = nil;
    self.postRExpectedTaking = nil;
    self.postRUnderOver = nil;
    self.postRNewSafe = nil;
    self.postRTotalSafe = nil;
    self.postRNewFloat = nil;
    self.sumCashPrice = nil;
    self.sumTipsDiscount = nil;
     self.sumAccount = nil;
    self.sumTotal = nil;
    self.dataStore = nil;
  
}

@end



