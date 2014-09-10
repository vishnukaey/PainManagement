//
//  PMConfirmMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

/*
 This ViewController shows a particular medication which is selected along with an image for the user to confirm it or cancel it
 */

#import "PMConfirmMedicationViewController.h"
#import "PMConfirmCollectionViewCell.h"

@interface PMConfirmMedicationViewController (){
    NSArray *imagesInArray;
}

@end

@implementation PMConfirmMedicationViewController

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
    self.medicationName.text = self.medication.medicationName;
    self.medicationForm.text = self.medication.medicationForm;
    imagesInArray = self.medication.medicationImages;
}


- (IBAction)confirmMedication:(id)sender {
    [self.delegate pushToReminderViewController];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark-  Collection View Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imagesInArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collection";
    PMConfirmCollectionViewCell *cell = (PMConfirmCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell==nil){
        cell=[[PMConfirmCollectionViewCell alloc] init];
    }
    cell.imageView.image = [imagesInArray objectAtIndex:indexPath.row];
    int pages = floor(_collectionView.contentSize.width / _collectionView.frame.size.width);
    [_pageController setNumberOfPages:pages];
    return cell;
}

#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWidth = _collectionView.frame.size.width;
    float currentPage = _collectionView.contentOffset.x / pageWidth;
    if (0.0f != fmodf(currentPage, 1.0f)) {
        _pageController.currentPage = currentPage + 1;
    } else {
        _pageController.currentPage = currentPage;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
