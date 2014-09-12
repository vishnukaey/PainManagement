//
//  PMScheduleNewOsteoReminderViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMScheduleNewOsteoReminderViewController.h"

@interface PMScheduleNewOsteoReminderViewController ()

@end

@implementation PMScheduleNewOsteoReminderViewController

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
    [self.datePicker addTarget:self action:@selector(dateChanged:)
              forControlEvents:UIControlEventValueChanged];
}

-(void) dateChanged:(id) sender{
    NSDate *date =self.datePicker.date;
    self.dateLabel.text = [self getTimeStringFromDate:date];
}

-(NSString *)getTimeStringFromDate :(NSDate *)date1 {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss a"];
    NSString *timeString = [dateFormatter stringFromDate:date1];
    return timeString;
}


- (IBAction)doneAddingReminder:(id)sender {
    self.osteoMedication.nextReminder = self.dateLabel.text;
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
