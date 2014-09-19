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
#import "PMCouponedMedicationCell.h"

@interface PMAddMedicationViewController ()<ConfirmMedicationViewDelegate,setRemindersDelegate >{
    NSArray *medicationList;
    NSMutableArray *selectedMedications;
    PMMedicationModal *confirmedMedication;
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
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"logInStatus"])
        [self performSegueWithIdentifier:@"PMStep1MedicationViewController" sender:self];
}



- (IBAction)confirmMedication:(id)sender {
    selectedMedications = [[NSMutableArray alloc] init];
    [self addSelectedmedications];
    if(selectedMedications.count != 0)
        [self addAConfirmationViewForMedicationAtIndex:0];
    else
        [Utilities showAlert:@"Select atleast One medication" withTitle:@"No Selection"];
}

-(void) addAConfirmationViewForMedicationAtIndex:(int)index{
    self.navigationItem.rightBarButtonItem.enabled=NO;
    confirmedMedication = [selectedMedications objectAtIndex:index];
    ConfirmView *confirmMedicationView = [ConfirmView initFromNib];
    confirmMedicationView.delegate = self;
    [self addConfirmViewWithAnimation:confirmMedicationView];
    [self performAutoLayoutForView:confirmMedicationView];
    confirmMedicationView.medicationName.text = confirmedMedication.medicationName;
    confirmMedicationView.medicationForm.text = confirmedMedication.medicationForm;
    confirmMedicationView.imagesArray = confirmedMedication.medicationImages;
    [confirmMedicationView.collectionView reloadData];
}

-(void) addConfirmViewWithAnimation:(ConfirmView *)confirmView{
    [self.view addSubview:confirmView];
    
    
}


-(void) removeConfirmViewWithAnimation:(ConfirmView *)confirmView{
    [self.view addSubview:confirmView];
    
}

-(void) performAutoLayoutForView:(ConfirmView*) confirmMedicationView{
    [confirmMedicationView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:confirmMedicationView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    
    // Height constraint, half of parent view height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:confirmMedicationView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1
                                                           constant:0]];
    
    // Center horizontally
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:confirmMedicationView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // Center vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:confirmMedicationView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
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
    for ( int section= 0 ; section < medicationList.count; section ++ ){
        for ( int row= 0 ; row < medicationList.count; row ++ ){
            UITableViewCell * cell2 = [self.medicationTableView cellForRowAtIndexPath:
                                   [NSIndexPath indexPathForRow:row inSection:section]];
            if(cell2.accessoryType == UITableViewCellAccessoryCheckmark){
                PMMedicationModal *medication = [[PMMedicationModal alloc] init];
                medication.medicationName =[[medicationList objectAtIndex:row ] valueForKey:@"name"];
                medication.medicationImages = [[NSMutableArray alloc] init];
                NSString *url = [[medicationList objectAtIndex:row] valueForKey:@"imageUrl"];
                [medication.medicationImages addObject:url];
                [medication.medicationImages addObject:url];
                medication.medicationForm= [[medicationList objectAtIndex:row ] valueForKey:@"form"];
                [selectedMedications addObject:medication];
            }
        }
    }
}



#pragma -mark delegate method of ConfirmView

-(void) pushToReminderViewController{
    self.navigationItem.rightBarButtonItem.enabled =YES;
    confirmedMedication.isMedicationConfirmed = @"YES";
    [self performSegueWithIdentifier:SET_REMINDER sender:self];
}


#pragma -mark TableView Delagate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
    return medicationList.count;
    else
        return medicationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddNewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.detailTextLabel.hidden =YES;
    return cell;
    }
    else{
        PMCouponedMedicationCell *cell = (PMCouponedMedicationCell*)[tableView dequeueReusableCellWithIdentifier:@"PMCouponedMedicationCell" forIndexPath:indexPath];
        cell.medicationName.text=[[medicationList objectAtIndex:indexPath.row] valueForKey:@"name"];
        return cell;
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
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
    else{
        PMCouponedMedicationCell * cell = (PMCouponedMedicationCell*)[tableView cellForRowAtIndexPath:indexPath];
        if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}



#pragma -mark Segue Methods
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:SET_REMINDER]){
        PMMedicationReminderViewController *reminder = [segue destinationViewController];
        reminder.delegate = self;
        reminder.medication = confirmedMedication;
        reminder.selectedMedications = selectedMedications;
        NSLog(@"%@",reminder.medication);
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
