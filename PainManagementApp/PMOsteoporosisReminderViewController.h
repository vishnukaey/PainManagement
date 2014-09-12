//
//  PMOsteoporosisReminderViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMOsteoporosisReminderViewController : UIViewController
    @property (weak, nonatomic) PMMedicationModal *medication;
    @property (weak, nonatomic) IBOutlet UILabel *medicationNameLabel;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (assign,nonatomic) PMOsteoMedication *osteoMedication;
@end
