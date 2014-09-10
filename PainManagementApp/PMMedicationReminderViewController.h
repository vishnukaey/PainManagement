//
//  PMMedicationReminderViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMMedicationReminderViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UILabel *medicationName;
@property (weak, nonatomic) IBOutlet UITableView *medicationTableView;
    @property (assign, nonatomic) PMMedicationModal *medication;
    @property (assign, nonatomic) NSArray *selectedMedications;
@end

