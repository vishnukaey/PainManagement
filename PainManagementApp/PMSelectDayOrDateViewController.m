//
//  PMSelectDayOrDateViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMSelectDayOrDateViewController.h"

@interface PMSelectDayOrDateViewController (){
    NSArray *arrayDataSource;
    int maximumSelections;
    NSMutableArray *checkmarkStatus;
}

@end

@implementation PMSelectDayOrDateViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    checkmarkStatus = [[NSMutableArray alloc] init];
    arrayDataSource = [[NSArray alloc] init];
    maximumSelections = [self.numberOfselectionsNeeded intValue];
    NSArray *days=@[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"];
    NSMutableArray *alldays = [[NSMutableArray alloc]init];
    for (int i=0;i<30;i++)
    [alldays  setObject:[NSString stringWithFormat:@"%d",(i+1)] atIndexedSubscript:i];
    if([self.toSelect isEqualToString:@"Day"])
        arrayDataSource = days;
    else
        arrayDataSource = alldays;
     for ( int i= 0 ; i < arrayDataSource.count; i ++ ){
         [checkmarkStatus addObject:[NSNumber numberWithBool:NO]];
     }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayDataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text  = [arrayDataSource objectAtIndex:indexPath.row];
    if ([[checkmarkStatus objectAtIndex:indexPath.row] boolValue] == NO) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int selectionCount = 0;
    for ( int i= 0 ; i < arrayDataSource.count; i ++ ){
        UITableViewCell * cell2 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if(cell2.accessoryType == UITableViewCellAccessoryCheckmark)
            selectionCount++;
    }
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    NSNumber *newState;
	if ([[checkmarkStatus objectAtIndex:indexPath.row] boolValue] == NO) {
        if(selectionCount >= maximumSelections){
            [Utilities showAlert:@"Maximum days Selected" withTitle:@"Selection Limit"];
        }
        else{
		newState = [NSNumber numberWithBool:YES];
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
	}
    else {
		newState = [NSNumber numberWithBool:NO];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    
    if(newState)
	[checkmarkStatus replaceObjectAtIndex:indexPath.row withObject:newState];
}


- (IBAction)done:(id)sender {
    self.medication.days = [[NSMutableArray alloc] init];
    for ( int i= 0 ; i < arrayDataSource.count; i ++ ){
        UITableViewCell * cell2 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if(cell2.accessoryType == UITableViewCellAccessoryCheckmark)
            [self.medication.days addObject:[arrayDataSource objectAtIndex:i]];
             }
    [self.navigationController
     popViewControllerAnimated:YES];
}



@end
