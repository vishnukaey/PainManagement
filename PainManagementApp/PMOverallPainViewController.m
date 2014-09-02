//
//  PMOverallPainViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 01/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMOverallPainViewController.h"
#import "PMOverallSliderCell.h"
#import "PMNotesTableCell.h"

@interface PMOverallPainViewController (){
    NSArray *descriptionList;
}

@end

@implementation PMOverallPainViewController

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
    descriptionList = [[NSArray alloc] initWithObjects:@"Level of pain today",@"Duration of Morning stiffness",@"Did you have any fatigue",nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
        return descriptionList.count;
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        static NSString *CellIdentifier = @"sliderCell";
        PMOverallSliderCell *cell = (PMOverallSliderCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.slider.minimumValue = 0;
        cell.slider.maximumValue = 100;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterNoStyle];
        [cell.slider setNumberFormatter:formatter];
        [cell.slider.dataSource slider:cell.slider stringForValue:50];
        cell.description.text=[descriptionList objectAtIndex:indexPath.row];
        cell.slider.popUpViewAnimatedColors = @[[UIColor greenColor], [UIColor orangeColor], [UIColor redColor]];
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"notesCell";
        PMNotesTableCell *cell = (PMNotesTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 1)
            return @"Notes";
        else
            return Nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end