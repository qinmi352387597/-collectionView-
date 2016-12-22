//
//  GridListCollectionViewCell.m
//  Grid-List
//
//  Created by LeeJay on 16/10/17.
//  Copyright © 2016年 Mob. All rights reserved.
//  代码下载地址https://github.com/leejayID/List2Grid

#import "GridListCollectionViewCell.h"
#import "GridListModel.h"
#import "UIImageView+WebCache.h"

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)

@interface GridListCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *haoping;
@end

@implementation GridListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)configureUI
{
    _imageV = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageV];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    
    _haoping = [[UILabel alloc] initWithFrame:CGRectZero];
    _haoping.textColor = [UIColor redColor];
    _haoping.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_haoping];

    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_priceLabel];
}

- (void)setIsGrid:(BOOL)isGrid
{
    _isGrid = isGrid;
    
    if (isGrid) {
        _imageV.frame = CGRectMake(5, 5, self.bounds.size.width - 60, self.bounds.size.width - 80);
        _titleLabel.frame = CGRectMake(5, self.bounds.size.width - 80, ScreenWidth/2-20, 40);
        _haoping.frame = CGRectMake(5, self.bounds.size.width - 45, ScreenWidth/2-10, 20);
        
        _priceLabel.frame = CGRectMake(5, self.bounds.size.width-20 , ScreenWidth/2-10, 20);
        
    } else {
        _imageV.frame = CGRectMake(5, 5, self.bounds.size.height - 10, self.bounds.size.height - 10);
        
        _titleLabel.frame = CGRectMake(self.bounds.size.height + 10, 0, ScreenWidth/2, self.bounds.size.height/3);
        
        _haoping.frame = CGRectMake(self.bounds.size.height + 10, self.bounds.size.height/3+10, ScreenWidth/2-30, self.bounds.size.height/6);
        
        _priceLabel.frame = CGRectMake(self.bounds.size.height + 10, self.bounds.size.height/3+10+self.bounds.size.height/6+10, ScreenWidth/2, self.bounds.size.height-(self.bounds.size.height/3+10+self.bounds.size.height/6+10));
    }
}

- (void)setModel:(GridListModel *)model
{
    _model = model;
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:model.imageurl]];
    _titleLabel.text = model.wname;
    _haoping.text = [NSString stringWithFormat:@"👍%d",model.totalCount];

    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",model.jdPrice];
}

@end
