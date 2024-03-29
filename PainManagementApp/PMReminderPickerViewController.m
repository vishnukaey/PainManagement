//
//  PMReminderPickerViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMReminderPickerViewController.h"


@interface PMReminderPickerViewController (){
    UIDatePicker *datePicker;
}

@end

@implementation PMReminderPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode= UIDatePickerModeTime;
    [datePicker addTarget:self action:@selector(dateChanged:)
     forControlEvents:UIControlEventValueChanged];
    self.reminderTimeTextField.inputView = datePicker;
    [self.reminderTimeTextField becomeFirstResponder];
}


- (void) dateChanged:(id)sender{
    NSDate  *date = datePicker.date;
    if(date != NULL)
        self.reminderTimeTextField.text =[self getTimeStringFromDate:date];
}

-(NSString *)getTimeStringFromDate :(NSDate *)date1 {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *timeString = [dateFormatter stringFromDate:date1];
    return timeString;
}


- (IBAction)Done:(id)sender {
    if(self.reminderTimeTextField.text .length !=0){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"hh:mm a"];
        NSDate *date = [dateFormat dateFromString:self.reminderTimeTextField.text];
        if([date isKindOfClass:[NSDate class]]) {
            self.medication.reminderTimings = self.reminderTimeTextField.text;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        [Utilities showAlert:@"Please select a time" withTitle:@"No selection"];
    }
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
        return NO;
    return [super canPerformAction:action withSender:sender];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
