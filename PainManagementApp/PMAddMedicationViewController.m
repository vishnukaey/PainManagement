//
//  PMAddMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

/* 
 This ViewController Lists all the medicines available. User can select his/her Medication so as to add reminders for it
 */


#import "PMAddMedicationViewController.h"
#import "PMConfirmMedicationViewController.h"
#import "PMMedicationReminderViewController.h"
#import "CloudStorage.h"

@interface PMAddMedicationViewController ()<PMConfirmMedicationViewControllerDelegate>{
    NSArray *medicationList;
    NSMutableDictionary *medicationItem;
    PMMedicationModal *medication;
}

@end

@implementation PMAddMedicationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    medicationList = [[NSArray alloc] init];
    [super viewDidLoad];
    CloudStorage *cloud = [[CloudStorage alloc] init];
    [cloud getRequest:@"" requestSucceeded:^(NSArray *array) {
        medicationList = array;
        NSLog(@"%@",medicationList);
        [self.medicationTableView reloadData];
    } requestFailed:^(NSError *error) {
        NSLog(@"Error");
    }     ];
    medication = [[PMMedicationModal alloc] init];
}

- (IBAction)confirmMedication:(id)sender {
    if(medicationItem){
        medication.medicationName = [medicationItem valueForKey:@"name"];
        NSURL *url = [NSURL URLWithString:[medicationItem valueForKey:@"imageUrl"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        medication.medicationImage = [[UIImage alloc] initWithData:data];
        medication.medicationForm= [medicationItem valueForKey:@"form"];
        [self performSegueWithIdentifier:@"confirm" sender:self];
    }
}

#pragma -mark delegate method of ConfirmView

-(void) pushToReminderViewController{
    [self performSegueWithIdentifier:@"reminder" sender:self];
}


#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return medicationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"name"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    Show accessorytype Checkmark to all the cell selected and remove it from the other cells
    for ( int i= 0 ; i < medicationList.count; i ++ ){
      UITableViewCell * cell2 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell2.accessoryType= UITableViewCellAccessoryNone;
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    medicationItem = [medicationList objectAtIndex:indexPath.row];
}


#pragma -mark Segue Methods
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"confirm"]){
        PMConfirmMedicationViewController *confirm = [segue destinationViewController];
        confirm.delegate = self;
        confirm.medication = medication;
    }
    
    if([segue.identifier isEqualToString:@"reminder"]){
        PMMedicationReminderViewController *reminder = [segue destinationViewController];
        reminder.medication = medication;
        NSLog(@"%@",reminder.medication);
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
