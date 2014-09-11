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
#import "PMMedicationReminderViewController.h"
#import "PMDataHandler.h"
#import "ConfirmView.h"

@interface PMAddMedicationViewController ()<ConfirmMedicationViewDelegate>{
    NSArray *medicationList;
    NSMutableArray *selectedMedications;
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
    medicationList = [[NSArray alloc] init];
    
    [self getAllMedications];
}



- (IBAction)confirmMedication:(id)sender {
    selectedMedications = [[NSMutableArray alloc] init];
    [self addSelectedmedications];
    if(selectedMedications.count != 0)
        [self addAConfirmationViewForMedication];
    else
        [Utilities showAlert:@"Select atleast One medication" withTitle:@"No Selection"];
}


-(void) addAConfirmationViewForMedication{
    ConfirmView *ConfirmMedicationView = [[ConfirmView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:CONFIRM_VIEW owner:self options:nil];
    ConfirmMedicationView = [views objectAtIndex:0];
    PMMedicationModal *med = [[PMMedicationModal alloc] init];
    med = [selectedMedications objectAtIndex:0];
    ConfirmMedicationView.medicationName.text = med.medicationName;
    ConfirmMedicationView.medicationForm.text = med.medicationForm;
    ConfirmMedicationView.imagesArray = med.medicationImages;
    ConfirmMedicationView.delegate = self;
    [self.view addSubview:ConfirmMedicationView];
}


-(void) getAllMedications{
    PMDataHandler *cloud = [[PMDataHandler alloc] init];
    [cloud getRequest:@"" requestSucceeded:^(NSArray *array) {
        medicationList = array;
        NSLog(@"%@",medicationList);
        [self.medicationTableView reloadData];
    }
        requestFailed:^(NSError *error) {
            NSLog(@"Error");
        }];
}



- (void) addSelectedmedications{
    for ( int index= 0 ; index < medicationList.count; index ++ ){
        UITableViewCell * cell2 = [self.medicationTableView cellForRowAtIndexPath:
                                   [NSIndexPath indexPathForRow:index inSection:0]];
        if(cell2.accessoryType == UITableViewCellAccessoryCheckmark){
            PMMedicationModal *medication = [[PMMedicationModal alloc] init];
            medication.medicationName =[[medicationList objectAtIndex:index ] valueForKey:@"name"];
            NSURL *url = [NSURL URLWithString:[[medicationList objectAtIndex:index ] valueForKey:@"imageUrl"]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            medication.medicationImages = [[NSMutableArray alloc] init];
            [medication.medicationImages addObject:[[UIImage alloc] initWithData:data]];
            [medication.medicationImages addObject:[UIImage imageNamed:@"ball-orange.png"]];
            medication.medicationForm= [[medicationList objectAtIndex:index ] valueForKey:@"form"];
            [selectedMedications addObject:medication];
        }
    }
}



#pragma -mark delegate method of ConfirmView

-(void) pushToReminderViewController{
    [self performSegueWithIdentifier:SET_REMINDER sender:self];
}


#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return medicationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddNewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.hidden =YES;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.detailTextLabel.hidden=YES;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.detailTextLabel.hidden=NO;
    }
}



#pragma -mark Segue Methods
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:SET_REMINDER]){
        PMMedicationReminderViewController *reminder = [segue destinationViewController];
        reminder.medication = [selectedMedications objectAtIndex:0];
        reminder.selectedMedications = selectedMedications;
        NSLog(@"%@",reminder.medication);
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
