//
//  PMMedicationReminderViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    reminderParamaters = [[NSArray alloc] initWithObjects:@"Form",@"Frequency",@"Day of the week", @"Reminder Time", nil];
    self.medicationName.text = [self.medication valueForKey:@"medicationName"];
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
        cell.detailTextLabel.text=[self.medication valueForKey:@"medicationForm"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
    [ self performSegueWithIdentifier:@"frequency" sender:self];
    }
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
