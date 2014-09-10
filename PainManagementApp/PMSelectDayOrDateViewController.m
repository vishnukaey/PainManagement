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
    if(cell == Nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"Cell"];
    cell.textLabel.text  = [arrayDataSource objectAtIndex:indexPath.row];
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
        if(cell.accessoryType == UITableViewCellAccessoryCheckmark)
            cell.accessoryType = UITableViewCellAccessoryNone;
        else{
            if(selectionCount >= maximumSelections)
                [Utilities showAlert:@"Selection Limit reached" withTitle:@"Selection Complete"];
            else
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
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
