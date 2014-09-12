//
//  PMScheduleNewOsteoReminderViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMScheduleNewOsteoReminderViewController : UIViewController
    @property (assign,nonatomic) PMOsteoMedication *osteoMedication;
    @property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
    @property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end
