//
//  PMSampleCollectionViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMSampleCollectionViewController.h"
#import "PMConfirmCollectionViewCell.h"

@interface PMSampleCollectionViewController (){
    NSArray *frequencyArray,*reccurenceArray;
}

@end

@implementation PMSampleCollectionViewController

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
    frequencyArray = @[@"",@"",@"1",@"2",@"3",@"4",@"5",@"",@""];
    reccurenceArray = @[@"",@"",@"Daily",@"Weekly",@"Monthly",@"",@""];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.frequencyTable)
        return frequencyArray.count;
    else
        return reccurenceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.frequencyTable){
    static NSString *CellIdentifier = @"frequency";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == Nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"frequency"];
        cell.textLabel.text  = [frequencyArray objectAtIndex:indexPath.row];
    return cell;
    }
    
    else{
        static NSString *CellIdentifier = @"reccurence";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        if(cell == Nil)
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"reccurence"];
        cell.textLabel.text  = [reccurenceArray objectAtIndex:indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
