//
//  PMReminderPickerViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PMReminderPickerViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UITextField *reminderTimeTextField;
    @property (assign, nonatomic)  PMMedicationModal *medication;
@end

