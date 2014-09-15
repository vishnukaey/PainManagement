//
//  PMFrequencyPickerView.m
//  PainManagementApp
//
//  Created by Vishnu on 15/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMFrequencyPickerView.h"

@implementation PMFrequencyPickerView{
    NSArray *frequencyArray,*reccurenceArray;
    CGRect selectionFrame;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    frequencyArray = @[@"",@"",@"1",@"2",@"3",@"4",@"5",@"",@""];
    reccurenceArray = @[@"",@"",@"Daily",@"Weekly",@"Monthly",@"",@""];
    [self.frequencyTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"frequency"];
    [self.reccurenceTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reccurence"];
    selectionFrame = self.containerView.frame;
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
        static NSString *CellIdentifier1 = @"frequency";
        UITableViewCell *cell2= [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
        if(cell2 == Nil)
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"frequency"];
        cell2.textLabel.text  = [frequencyArray objectAtIndex:indexPath.row];
        return cell2;
    }
    
    else{
        static NSString *CellIdentifier = @"reccurence";
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        if(cell1 == Nil)
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"reccurence"];
        cell1.textLabel.text  = [reccurenceArray objectAtIndex:indexPath.row];
        return cell1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%f",cell.contentView.frame.origin.y);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == self.frequencyTable){
        for(int i=0;i<frequencyArray.count;i++){
            NSIndexPath *ind= [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *cell =[self.frequencyTable cellForRowAtIndexPath:ind];
            CGRect fr = [cell.contentView convertRect:cell.contentView.frame fromView:self.containerView];
            float top = fr.origin.y;
            NSLog(@"%f %f",selectionFrame.origin.y,top);
            if(top > selectionFrame.origin.y-100 && top < selectionFrame.origin.y-56){
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.textLabel.alpha = 1.0;
            }
            else{
                cell.textLabel.textColor = [UIColor blackColor];
                cell.textLabel.alpha = 0.3;
            }
        }
    }
    else{
        for(int i=0;i<reccurenceArray.count;i++){
            NSIndexPath *ind= [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *cell =[self.reccurenceTable cellForRowAtIndexPath:ind];
            CGRect fr = [cell.contentView convertRect:cell.contentView.frame fromView:self.containerView];
            float top = fr.origin.y;
            NSLog(@"%f %f",selectionFrame.origin.y,top);
            if(top > selectionFrame.origin.y-100 && top < selectionFrame.origin.y-56){
                cell.textLabel.textColor = [UIColor whiteColor];
                cell.textLabel.alpha = 1.0;
            }
            else{
                cell.textLabel.textColor = [UIColor blackColor];
                cell.textLabel.alpha = 0.3;
            }
        }
    }
    
}

@end
