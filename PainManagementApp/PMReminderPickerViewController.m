//
//  PMReminderPickerViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMReminderPickerViewController.h"


@interface PMReminderPickerViewController (){
    NSMutableArray *pickerViewData;
    int componentInverse;
    UIPickerView *pickerView;
    UIDatePicker *datePicker;
}

@end

@implementation PMReminderPickerViewController

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
    [self createDataSourceForPickerView];
    [self toggleInputView:NO];
}


-(void) createDataSourceForPickerView{
    pickerViewData = [[NSMutableArray alloc] init];
    NSArray *days=@[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"];
    [pickerViewData addObject:days];
    [pickerViewData addObject:@[@"Week 1",@"Week 2",@"Week 3",@"Week 4"]];
}

#pragma -mark TableView Delagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.medication valueForKey:@"frequency"] intValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"reminder";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

- (IBAction)hideInputView:(id)sender {
    [self toggleInputView:NO];
}


-(void) toggleInputView:(bool)shouldshow{
    int offset;
    if(shouldshow)
        offset=self.pickerContainerView.frame.size.height;
    else
        offset=-self.pickerContainerView.frame.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 0.25];
    CGRect menuListFrame = self.pickerContainerView.frame;
    menuListFrame.origin.y -= offset;
    self.pickerContainerView.frame = menuListFrame;
    [UIView commitAnimations];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.pickerContainerView.frame.origin.y == 568.0)
    [self toggleInputView:YES];
}


- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if([[self.medication valueForKey:@"reccurence"] isEqualToString:@"Daily"]){
            return componentInverse = 0;
    }
    else if([[self.medication valueForKey:@"reccurence"] isEqualToString:@"Weekly"])
        return componentInverse = 1;
    else if([[self.medication valueForKey:@"reccurence"] isEqualToString:@"Monthly"])
        return componentInverse = 2;
    else
        return 0;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (int)[[pickerViewData objectAtIndex:componentInverse-component-1] count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [[pickerViewData objectAtIndex:componentInverse- component-1
             ] objectAtIndex:row];
}

- (IBAction)Done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
