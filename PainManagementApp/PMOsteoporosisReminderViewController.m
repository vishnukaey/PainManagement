//
//  PMOsteoporosisReminderViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMOsteoporosisReminderViewController.h"
#import "PMScheduleNewOsteoReminderViewController.h"

@interface PMOsteoporosisReminderViewController (){
    NSArray *reminderParameters;
}

@end

@implementation PMOsteoporosisReminderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    self.medicationNameLabel.text = [self.osteoMedication valueForKey:@"medicationName"];
    reminderParameters = [[NSArray alloc] initWithObjects:@"Last Received", @"Next Scheduled", nil];
    [super viewDidLoad];
}


-(void) saveMyMedications{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults boolForKey:@"logInStatus"])
        [Utilities showAlert:@"Save Data" withTitle:@"Success"];
    else
        [self performSegueWithIdentifier:LOGIN_SIGNUP sender:self];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (IBAction)saveMedications:(id)sender {
    [self saveMyMedications];
}



#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return reminderParameters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:osteoReminderCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[reminderParameters objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        NSString *reminder =[[NSString alloc] init];
        if(self.osteoMedication.lastReminder)
            reminder = self.osteoMedication.lastReminder;
        if(reminder.length!=0)
            cell.detailTextLabel.text =reminder;
    }
    else if(indexPath.row == 1){
        NSString *reminder =[[NSString alloc] init];
        if(self.osteoMedication.nextReminder)
            reminder = self.osteoMedication.nextReminder;
        if(reminder.length!=0)
            cell.detailTextLabel.text =reminder;
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
        [self performSegueWithIdentifier:ADD_OSTEO_REMINDER sender:self];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:ADD_OSTEO_REMINDER]){
        PMScheduleNewOsteoReminderViewController *scheduleReminder = [segue destinationViewController];
        scheduleReminder.osteoMedication  = self.osteoMedication;
    }
    else if ([segue.identifier isEqualToString:LOGIN_SIGNUP]){
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
