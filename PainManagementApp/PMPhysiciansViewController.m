//
//  PMPhysiciansViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMPhysiciansViewController.h"
#import "PMPhysicianCell.h"

@interface PMPhysiciansViewController () <PhysicianCellDelegate>
@end

@implementation PMPhysiciansViewController

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
}

-(void) performSegueForPhysician:(NSString *)physician{
    [self performSegueWithIdentifier:@"addAppointment" sender:self];
}
#pragma -mark TableView delegate and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"physicianCell";
    PMPhysicianCell *cell = (PMPhysicianCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate= self;
    cell.physicianName.text = @"Hello";
    cell.physicianSpecialization.text = @"Nothing Special";
    cell.physicianAddress.text = @"KJNJKNV KLJMNLKjl;kdo;kLKDGLKSKLKSlkl";
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
