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
    CGRect selectionFrame;
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
    CGRect selectionFrame2 = self.selectionView.frame ;
    selectionFrame= [ self.view convertRect:self.selectionView.frame toView:self.frequencyTable];
    NSLog(@"%f %f",selectionFrame.origin.y,selectionFrame2.origin.y);
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
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            NSLog(@"%f",cell.contentView.frame.origin.y);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for(int i=0;i<frequencyArray.count;i++){
        NSIndexPath *ind= [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell =[self.frequencyTable cellForRowAtIndexPath:ind];
        CGRect fr = [self.view convertRect:cell.contentView.frame toView:self.frequencyTable];
        float top = fr.origin.y;
        NSLog(@"%f %f",selectionFrame.origin.y,top);
        if(top > selectionFrame.origin.y)
            cell.textLabel.textColor = [UIColor whiteColor];
        else
            cell.textLabel.textColor = [UIColor greenColor];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
