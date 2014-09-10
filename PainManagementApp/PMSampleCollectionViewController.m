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
    NSArray *imagesInArray;
    NSInteger *page;
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
    imagesInArray = [[NSArray alloc]init];
	imagesInArray = [NSArray arrayWithObjects:
                     @"Plaquenil.jpg",@"ball-orange.png", @"Plaquenil.jpg",@"ball-orange.png", nil];
}

#pragma mark-  Collection View Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collection";
    PMConfirmCollectionViewCell *cell = (PMConfirmCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell==nil){
        cell=[[PMConfirmCollectionViewCell alloc] init];
    }
    cell.imageView.image = [UIImage imageNamed:[imagesInArray objectAtIndex:indexPath.row]];
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
    // Dispose of any resources that can be recreated.
}

@end
