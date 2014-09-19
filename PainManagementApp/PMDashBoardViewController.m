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
    menuItems=[[NSArray alloc]initWithContentsOfFile:
               [[NSBundle mainBundle] pathForResource:
                DASHBOARD_MENU_ITEMS ofType:@"plist"]];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"logInStatus"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"logInStatus"]){
        [self performSegueWithIdentifier:GO_TO_LANDINGVIEW sender:self];
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"logInStatus"]){
        self.usernameLabel.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    }
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(self.sideMenuView.frame.origin.x==0)
        [self toggleSideMenu:Nil];
}



- (IBAction)toggleSideMenu:(id)sender {
    static bool menuViewShown=NO;
    menuViewShown=!menuViewShown;
    [self toggleSideMenulist:menuViewShown];
}



-(void) toggleSideMenulist:(bool)shouldshow{
    int offset;
    if(shouldshow)
        offset=self.sideMenuView.frame.size.width;
    else
        offset=-self.sideMenuView.frame.size.width;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.25];
    CGRect dashBoardframe = self.dashBoardTableView.frame;
    dashBoardframe.origin.x += offset;
    self.dashBoardTableView.frame = dashBoardframe;
    CGRect menuListFrame = self.sideMenuView.frame;
    menuListFrame.origin.x += offset;
    self.sideMenuView.frame = menuListFrame;
    [UIView commitAnimations];
}



#pragma -mark LandingViewDelegateMethods

-(void) performSegueToLoginViewController{
    [self performSegueWithIdentifier:SIGN_IN sender:self];
}

-(void) performSegueToMedicationViewController{
    [self performSegueWithIdentifier:ADD_MEDICATION sender:self];
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
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.sideMenuTableView){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier forIndexPath:indexPath];
        cell.textLabel.font=[UIFont systemFontOfSize:13.0];
        cell.backgroundColor=[UIColor groupTableViewBackgroundColor];
        cell.textLabel.text=[menuItems objectAtIndex:indexPath.row];
        return cell;
    }
    
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 dashBoardCellIdentifier forIndexPath:indexPath];
        if(indexPath.section == 0)
            cell.textLabel.text = @"Section 1";
        else
            cell.textLabel.text = @"Section 2";
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.sideMenuTableView){
        [self performSegueWithIdentifier:[menuItems objectAtIndex:indexPath.row] sender:self];
    }
}



#pragma -mark SegueMethods

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:GO_TO_LANDINGVIEW]){
        PMLandingViewController *landing = [segue destinationViewController];
        landing.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
