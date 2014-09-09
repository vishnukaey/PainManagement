//
//  PMReminderPickerViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMReminderPickerViewController.h"


@interface PMReminderPickerViewController (){
    NSMutableArray *pickerViewData;
    int componentInverse;
    UILabel *activeLabel;
    NSDate *date;
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
    [self createDataSourceForPickerView];
    [self toggleInputView:NO];
    [self.datePicker addTarget:self action:@selector(dateChanged:)
     forControlEvents:UIControlEventValueChanged];
}



-(void) createDataSourceForPickerView{
    pickerViewData = [[NSMutableArray alloc] init];
    date =[[NSDate alloc] init];
}

#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.medication.reminderFrequency intValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reminder";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(indexPath.row == 0)
        activeLabel = cell.textLabel;
    return cell;
}

- (IBAction)hideInputView:(id)sender {
    [self toggleInputView:NO];
}


-(void) toggleInputView:(bool)shouldshow{
    int offset;
    if(shouldshow)
        offset=self.pickerContainerView.frame.size.height;
    else
        offset=-self.pickerContainerView.frame.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.25];
    CGRect menuListFrame = self.pickerContainerView.frame;
    menuListFrame.origin.y -= offset;
    self.pickerContainerView.frame = menuListFrame;
    [UIView commitAnimations];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.pickerContainerView.frame.origin.y == 568.0)
    [self toggleInputView:YES];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    activeLabel = cell.textLabel;
}


- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if([self.medication.reminderReccurence isEqualToString:@"Daily"]){
            return componentInverse = 0;
    }
    else if([self.medication.reminderReccurence isEqualToString:@"Weekly"])
        return componentInverse = 1;
    else if([self.medication.reminderReccurence isEqualToString:@"Monthly"])
        return componentInverse = 2;
    else
        return 0;
}

- (void) dateChanged:(id)sender{
    date = self.datePicker.date;
    [self changeActiveLabelValue];
}

-(void) changeActiveLabelValue{
     if(date != NULL)
    activeLabel.text = [self getTimeStringFromDate:date];
}


-(NSString *)getTimeStringFromDate :(NSDate *)date1 {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *timeString = [dateFormatter stringFromDate:date1];
    return timeString;
}


- (IBAction)Done:(id)sender {
    self.medication.reminderTimings = [[NSMutableArray alloc] init];
    for ( int i= 0 ; i < [self.medication.reminderFrequency intValue]; i ++ ){
        UITableViewCell * cell = [self.reminderView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [self.medication.reminderTimings addObject:cell.textLabel.text];
    }
    NSLog(@"%@",self.medication);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
