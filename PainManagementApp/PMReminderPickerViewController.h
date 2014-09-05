//
//  PMReminderPickerViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Reminderdelegate <NSObject>
-(void) popViewController;
@end

@interface PMReminderPickerViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
    @property (assign, nonatomic)  PMMedicationModal *medication;
    @property (weak, nonatomic) IBOutlet UIPickerView *frequencyPicker;
    @property (weak, nonatomic) IBOutlet UITableView *reminderView;
    @property (weak, nonatomic) IBOutlet UIView *pickerContainerView;
    @property (weak,nonatomic) id <Reminderdelegate> delegate;
@end

