//
//  PMMedicationReminderViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

/* Shows the summary of the medication selected, the form of medication and reminders set. User can click on any cell to change it
 */

#import "PMMedicationReminderViewController.h"
#import "PMFrequencyViewController.h"
#import "PMReminderPickerViewController.h"
#import "PMGetDayViewController.h"
#import "PMSelectDayOrDateViewController.h"

@interface PMMedicationReminderViewController (){
    NSArray *reminderParamaters;
    NSString *toSelect;
}
@end

@implementation PMMedicationReminderViewController

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
    self.medicationName.text = self.medication.medicationName;
    reminderParamaters = [[NSArray alloc] initWithObjects:
                          @"Form",@"Frequency",@"Day of the week", @"Reminder Time", nil];
    toSelect =[[NSString alloc]init];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.medicationTableView reloadData];
}



- (IBAction)nextButtonTapped:(id)sender {
    [self performSegueWithIdentifier:SELECT_OSTEO_MEDICATION sender:self];
}


#pragma -mark TableView Delagate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return reminderParamaters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReminderCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[reminderParamaters objectAtIndex:indexPath.row];
    switch(indexPath.row){
        case 0:{
            cell.detailTextLabel.text = self.medication.medicationForm;
            break;
            
        }case 1:{
            if(self.medication.reminderReccurence.length !=0){
                NSString *string = [NSString stringWithFormat:@"%@ x %@"
                                    ,self.medication.reminderFrequency,
                                    self.medication.reminderReccurence];
                cell.detailTextLabel.text = string;
            }
            break;
            
        }case 2:{
            if([self.medication.reminderReccurence isEqualToString:@"Daily"])
                cell.textLabel.text= @"Time of the Day";
            else if([self.medication.reminderReccurence isEqualToString:@"Weekly"])
                cell.textLabel.text= @"Days of the Week";
            else if([self.medication.reminderReccurence isEqualToString:@"Monthly"])
                cell.textLabel.text= @"Days of the month";
            
            if(self.medication.days.count !=0){
                NSMutableString *string= [[NSMutableString alloc]init];;
                for(int i= 0 ; i< self.medication.days.count ; i++)
                    [string appendFormat :@"%@,",[self.medication.days objectAtIndex:i]];
                cell.detailTextLabel.text = string;
            }
            else if(self.medication.reminderTimings.count !=0 && [self.medication.reminderReccurence isEqualToString:@"Daily"]){
                NSMutableString *string= [[NSMutableString alloc]init];;
                for(int i= 0 ; i< self.medication.reminderTimings.count ; i++)
                    [string appendFormat :@"%@,",[self.medication.reminderTimings objectAtIndex:i]];
                cell.detailTextLabel.text = string;
            }
            break;
            
        }case 3:{
            if(self.medication.reminderTimings.count !=0){
                NSMutableString *string= [[NSMutableString alloc]init];
            for(int i= 0 ; i< self.medication.reminderTimings.count ; i++)
                [string appendFormat :@"%@,",[self.medication.reminderTimings objectAtIndex:i]];
            cell.detailTextLabel.text = string;
            }
        }
    }

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
    [ self performSegueWithIdentifier:SET_REMINDER_FREQUENCY sender:self];
    }
    else if(indexPath.row == 0){
        toSelect = @"Form";
        [self performSegueWithIdentifier:SET_MEDICATION_FORM sender:self];
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Daily"]){
        [self performSegueWithIdentifier:SET_REMINDER_TIMINGS sender:self];
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Weekly"]){
        toSelect = @"Day";
        [self performSegueWithIdentifier:SELECT_DAYS sender:self];
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Monthly"]){
        toSelect = @"Week";
        [self performSegueWithIdentifier:SELECT_DAYS sender:self];
    }
    else
        [self performSegueWithIdentifier:SET_REMINDER_TIMINGS sender:self];
}



#pragma -mark Segue Methods

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:SET_REMINDER_FREQUENCY]){
        PMFrequencyViewController *frequency=[segue destinationViewController];
        frequency.medication = self.medication;
    }
    else if([segue.identifier isEqualToString:SET_REMINDER_TIMINGS]){
        PMReminderPickerViewController *pickTime = [segue destinationViewController];
        pickTime.medication=self.medication;
    }
     else if([segue.identifier isEqualToString:SET_MEDICATION_FORM]){
         PMGetDayViewController *getDay= [segue destinationViewController];
         getDay.medication =self.medication;
     }
     else if([segue.identifier isEqualToString:SELECT_DAYS]){
         PMSelectDayOrDateViewController *getDay= [segue destinationViewController];
         getDay.toSelect = toSelect;
         getDay.numberOfselectionsNeeded = self.medication.reminderFrequency;
         getDay.medication = self.medication;
     }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
