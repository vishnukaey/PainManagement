//
//  PMOsteoMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 05/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMOsteoMedicationViewController.h"
#import "PMOsteoporosisReminderViewController.h"

@interface PMOsteoMedicationViewController (){
    NSArray *medicationList;
    NSMutableDictionary *osteoMedication;
    int selectedMedicationIndex;
    PMOsteoMedication *OsteomedicationModal;
}
@end

@implementation PMOsteoMedicationViewController

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
    medicationList = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"medication" ofType:@"plist"]];
    osteoMedication =[[NSMutableDictionary alloc] init];
    OsteomedicationModal= [[PMOsteoMedication alloc] init];
}


#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return medicationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OsteoCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"medicationName"];
    cell.detailTextLabel.text = @"Details about the medicaiton goes here";
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    for ( int i= 0 ; i < medicationList.count; i ++ ){
        UITableViewCell * cell2 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell2.accessoryType= UITableViewCellAccessoryNone;
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    selectedMedicationIndex = (int) indexPath.row;
}


- (IBAction)pushToScheduleViewController:(id)sender {
    OsteomedicationModal.medicationName = [[medicationList objectAtIndex:selectedMedicationIndex] valueForKey:@"medicationName"];
    [self performSegueWithIdentifier:SCHEDULE_REMINDER sender:self];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:SCHEDULE_REMINDER]){
        PMOsteoporosisReminderViewController *reminder = [segue destinationViewController];
        reminder.medication = self.medication;
        reminder.osteoMedication = OsteomedicationModal;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
