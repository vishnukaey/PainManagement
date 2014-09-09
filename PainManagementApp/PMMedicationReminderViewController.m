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

@interface PMMedicationReminderViewController (){
    NSArray *reminderParamaters;
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
        cell.detailTextLabel.text=self.medication.medicationForm;
    else if (indexPath.row == 1 && self.medication.reminderReccurence.length !=0)
        cell.detailTextLabel.text=self.medication.reminderReccurence;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
    [ self performSegueWithIdentifier:@"frequency" sender:self];
    }
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
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
