//
//  TWCollectionViewCell.h
//  CollectionView
//
//  Created by tang on 16/3/14.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)UILabel *label;

- (void)setImageAndLabel:(int)indexpath;
@end
