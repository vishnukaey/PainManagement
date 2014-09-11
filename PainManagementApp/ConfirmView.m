//
//  ConfirmView.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "ConfirmView.h"
#import "PMConfirmCollectionViewCell.h"

@implementation ConfirmView{
    NSMutableArray *imagesInArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void) awakeFromNib {
    imagesInArray = [[NSMutableArray alloc] init];
    [super awakeFromNib];
}


- (IBAction)confirmMedication:(id)sender {
    [self removeFromSuperview];
    [self.delegate pushToReminderViewController];
}

#pragma mark-  Collection View Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    imagesInArray = [self.imagesArray mutableCopy];
    return imagesInArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collection";
    PMConfirmCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
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


@end
