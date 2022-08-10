//
//  jingXuanSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import "jingXuanSongListCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation jingXuanSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.avatarButton];
    [self.contentView addSubview:self.songNameLabel];
    [self.contentView addSubview:self.singerNameLabel];
    [self.contentView addSubview:self.introductionLabel];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(@50);
        make.height.equalTo(self.contentView);
    }];
    [self.songNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(8);
        make.left.equalTo(self.avatarButton.mas_right).offset(10);
        make.width.equalTo(@64);
        make.height.equalTo(@16);
    }];
    [self.singerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.songNameLabel);
        make.left.equalTo(self.songNameLabel.mas_right).offset(6);
        make.width.equalTo(@70);
        make.height.equalTo(@12);
    }];
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songNameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.songNameLabel.mas_left);
        make.width.equalTo(@200);
        make.height.equalTo(@12);
    }];
    
}

- (UIButton *)avatarButton {
    if (!_avatarButton) {
        _avatarButton = [[UIButton alloc] init];
        
    }
    
    return _avatarButton;
}

- (UILabel *)songNameLabel {
    if (!_songNameLabel) {
        _songNameLabel = [[UILabel alloc] init];
    }
    
    return  _songNameLabel;
}

- (UILabel *)singerNameLabel {
    if (!_singerNameLabel) {
        _singerNameLabel = [[UILabel alloc] init];
    }
    
    return  _singerNameLabel;
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
    }
    
    return  _introductionLabel;
}

@end
