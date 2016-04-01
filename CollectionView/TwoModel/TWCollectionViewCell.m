//
//  TWCollectionViewCell.m
//  CollectionView
//
//  Created by tang on 16/3/14.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCollectionViewCell.h"

@implementation TWCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
        _imageView.image = [UIImage imageNamed:@"123_01"];
        [self addSubview:_imageView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        [self addSubview:_label];
    }
    return self;
}

@end
