//
//  PMAddMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMAddMedicationViewController.h"
#import "PMConfirmMedicationViewController.h"
#import "PMMedicationReminderViewController.h"

@interface PMAddMedicationViewController ()<PMConfirmMedicationViewControllerDelegate>{
    NSArray *medicationList;
    NSMutableDictionary *medication;
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
    [super viewDidLoad];
    medicationList = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"medication" ofType:@"plist"]];
}

#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return medicationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"medicationName"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    for ( int i= 0 ; i < medicationList.count; i ++ ){
      UITableViewCell * cell2 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell2.accessoryType= UITableViewCellAccessoryNone;
    }
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    medication = [medicationList objectAtIndex:indexPath.row];
}

- (IBAction)confirmMedication:(id)sender {
    if(medication)
    [self performSegueWithIdentifier:@"confirm" sender:self];
}


-(void) pushToReminderViewController{
    [self performSegueWithIdentifier:@"reminder" sender:self];
}


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
    // Dispose of any resources that can be recreated.
}
@end
