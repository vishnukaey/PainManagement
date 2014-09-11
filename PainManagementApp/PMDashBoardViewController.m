//
//  PMDashBoardViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 01/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMDashBoardViewController.h"
#import "PMMedicationModal.h"
#import "PMLandingViewController.h"

@interface PMDashBoardViewController () <LandingViewDelegate>
@end

@implementation PMDashBoardViewController{
    NSArray *menuItems;
}

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
    menuItems=[[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DashBoardMenuItems" ofType:@"plist"]];
    [self performSegueWithIdentifier:@"landingView" sender:self];
}



- (IBAction)toggleSideMenu:(id)sender {
    static bool menuViewShown=NO;
    menuViewShown=!menuViewShown;
    [self toggleSideMenulist:menuViewShown];
}

-(void) toggleSideMenulist:(bool)shouldshow{
    int offset;
    if(shouldshow)
        offset=self.sideMenuTableView.frame.size.width;
    else
        offset=-self.sideMenuTableView.frame.size.width;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.25];
    CGRect dashBoardframe = self.dashBoardTableView.frame;
    dashBoardframe.origin.x += offset;
    self.dashBoardTableView.frame = dashBoardframe;
    CGRect menuListFrame = self.sideMenuTableView.frame;
    menuListFrame.origin.x += offset;
    self.sideMenuTableView.frame = menuListFrame;
    [UIView commitAnimations];
}


-(void) viewWillDisappear:(BOOL)animated{
    if(self.sideMenuTableView.frame.origin.x==0)
        [self toggleSideMenu:Nil];
}

#pragma -mark LandingViewDelegateMethods
-(void) performSegueToMedicationViewController{
    [self performSegueWithIdentifier:@"MEDICATION" sender:self];
}
-(void) performSegueToPainManagementViewController{
    [self performSegueWithIdentifier:@"PAIN MANAGEMENT" sender:self];
    
}
-(void) performSegueToAppoinmentsViewController{
    [self performSegueWithIdentifier:@"APPOINTMENTS" sender:self];
    
}

#pragma -mark TableView Delagate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(tableView == self.dashBoardTableView)
        return 2;
    else
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.sideMenuTableView)
        return menuItems.count;
    else{
            return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.sideMenuTableView){
        static NSString *CellIdentifier = @"menuCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.font=[UIFont systemFontOfSize:13.0];
        cell.backgroundColor=[UIColor groupTableViewBackgroundColor];
        cell.textLabel.text=[menuItems objectAtIndex:indexPath.row];
        return cell;
    }
    else{
        if(indexPath.section == 0){
            static NSString *CellIdentifier = @"dashboardCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.textLabel.text = @"Section 1";
            return cell;
        }
        else{
            static NSString *CellIdentifier = @"dashboardCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            cell.textLabel.text = @"Section 2";
            return cell;        }
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.sideMenuTableView){
        [self performSegueWithIdentifier:[menuItems objectAtIndex:indexPath.row] sender:self];
    }
    else{
        
    }
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"landingView"]){
        PMLandingViewController *landing = [segue destinationViewController];
        landing.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
