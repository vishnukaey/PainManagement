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
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.medicationTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    reminderParamaters = [[NSArray alloc] initWithObjects:@"Form",@"Frequency",@"Day of the week", @"Reminder Time", nil];
    self.medicationName.text = self.medication.medicationName;
    toSelect =[[NSString alloc]init];
}

#pragma -mark TableView Delagate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return reminderParamaters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reminder";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[reminderParamaters objectAtIndex:indexPath.row];
    if(indexPath.row == 0)
        cell.detailTextLabel.text = self.medication.medicationForm;
    else if (indexPath.row == 1 && self.medication.reminderReccurence.length !=0)
        cell.detailTextLabel.text=self.medication.reminderReccurence;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
    [ self performSegueWithIdentifier:@"frequency" sender:self];
    }
    else if(indexPath.row == 0){
        [self performSegueWithIdentifier:@"form" sender:self];
        toSelect = @"Form";
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Daily"]){
        [self performSegueWithIdentifier:@"time" sender:self];
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Weekly"]){
        [self performSegueWithIdentifier:@"form" sender:self];
        toSelect = @"Day";
    }
    else if(indexPath.row == 2 && [self.medication.reminderReccurence isEqualToString:@"Monthly"]){
        [self performSegueWithIdentifier:@"form" sender:self];
        toSelect = @"Week";
    }
    else
        [self performSegueWithIdentifier:@"time" sender:self];
}

- (IBAction)nextButtonTapped:(id)sender {
    [self performSegueWithIdentifier:@"Osteoporosis" sender:self];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"frequency"]){
        PMFrequencyViewController *frequency=[segue destinationViewController];
        frequency.medication = self.medication
        ;
    }
    else if([segue.identifier isEqualToString:@"time"]){
        PMReminderPickerViewController *pickTime = [segue destinationViewController];
        pickTime.medication=self.medication;
    }
     else if([segue.identifier isEqualToString:@"form"]){
         PMGetDayViewController *getDay= [segue destinationViewController];
         getDay.medication =self.medication;
         getDay.toSelect = toSelect;
     }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
