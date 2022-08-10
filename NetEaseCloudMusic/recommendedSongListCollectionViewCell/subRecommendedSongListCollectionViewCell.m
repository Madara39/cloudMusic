//
//  subRecommendedSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import "subRecommendedSongListCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation subRecommendedSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.transVC.view];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@108);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(6);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@30);
    }];
    [self.transVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    
    return _titleLabel;
}

- (transViewController *)transVC {
    if (!_transVC) {
        _transVC = [[transViewController alloc] init];
    }

    return _transVC;
}

- (discoveryPageSongListCellModel *)cellModel {
    if (!_cellModel) {
        _cellModel = [[discoveryPageSongListCellModel alloc] init];
    }
    
    return _cellModel;
}

@end
