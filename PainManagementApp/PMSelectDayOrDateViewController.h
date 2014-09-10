//
//  PMSelectDayOrDateViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMSelectDayOrDateViewController : UITableViewController
@property (assign,  nonatomic) NSString *toSelect;
@property (assign,nonatomic) NSString *numberOfselectionsNeeded;
@property (assign, nonatomic) PMMedicationModal *medication;
@end
