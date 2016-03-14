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

    }
    return self;
}

- (void)setImageAndLabel:(int)number
{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
        _imageView.image = [UIImage imageNamed:@"123_01"];
        [self addSubview:_imageView];
    }
    if(_label == nil){
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        _label.text = [NSString stringWithFormat:@"顺序 %d", number ];
        [self addSubview:_label];
    }

}
@end
