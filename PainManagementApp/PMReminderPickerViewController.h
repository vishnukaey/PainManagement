//
//  PMReminderPickerViewController.h
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMReminderPickerViewController : UIViewController
@property (assign,nonatomic)  NSMutableDictionary *medication;
@property (weak, nonatomic) IBOutlet UIPickerView *frequencyPicker;
@property (weak, nonatomic) IBOutlet UITableView *reminderView;
@property (weak, nonatomic) IBOutlet UIView *pickerContainerView;
@end

