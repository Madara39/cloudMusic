//
//  songListSongCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "songListSongCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation songListSongCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.songNumLabel];
    [self.contentView addSubview:self.songNameLabel];
    [self.contentView addSubview:self.songDiscriptionLabel];
    [self.contentView addSubview:self.vipButton];
    [self.contentView addSubview:self.sqButton];
    [self.contentView addSubview:self.soleButton];
    [self.contentView addSubview:self.originalSingingButton];
    [self.contentView addSubview:self.videoPlayButton];
    [self.contentView addSubview:self.moreButton];
    [self.contentView addSubview:self.transVC.view];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.songNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(17);
        make.width.equalTo(@12);
        make.height.equalTo(@16);
    }];
    [self.songNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.left.equalTo(self.contentView.mas_left).offset(42);
        make.width.equalTo(@270);
        make.height.equalTo(@17);
    }];
    [self.songDiscriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(35);
        make.left.equalTo(self.contentView.mas_left).offset(126);
        make.width.equalTo(@180);
        make.height.equalTo(@12);
    }];
    [self.vipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songNameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.songNameLabel.mas_left);
        make.width.equalTo(@18);
        make.height.equalTo(@12);
    }];
    [self.sqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songNameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.vipButton.mas_right).offset(3);
        make.width.equalTo(@18);
        make.height.equalTo(@12);
    }];
    [self.soleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songNameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.sqButton.mas_right).offset(3);
        make.width.equalTo(@18);
        make.height.equalTo(@12);
    }];
    [self.originalSingingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songNameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.soleButton.mas_right).offset(3);
        make.width.equalTo(@18);
        make.height.equalTo(@12);
    }];
    [self.videoPlayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-52);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.transVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
}

- (songPlayTransVC *)transVC {
    if (!_transVC) {
        _transVC = [[songPlayTransVC alloc] init];
    }

    return _transVC;
}

- (UILabel *)songNumLabel {
    if (!_songNumLabel) {
        _songNumLabel = [[UILabel alloc] init];
    }
    
    return _songNumLabel;
}

- (UILabel *)songNameLabel {
    if (!_songNameLabel) {
        _songNameLabel = [[UILabel alloc] init];
    }
    
    return _songNameLabel;
}

- (UILabel *)songDiscriptionLabel {
    if (!_songDiscriptionLabel) {
        _songDiscriptionLabel = [[UILabel alloc] init];
        _songDiscriptionLabel.font = [UIFont systemFontOfSize:12];
        _songDiscriptionLabel.textColor = [UIColor grayColor];
    }
    
    return _songDiscriptionLabel;
}

- (UIButton *)vipButton {
    if (!_vipButton) {
        _vipButton = [[UIButton alloc] init];
        [_vipButton setImage:[UIImage imageNamed:@"VIP"] forState:UIControlStateNormal];
    }
    
    return _vipButton;
}

- (UIButton *)sqButton {
    if (!_sqButton) {
        _sqButton = [[UIButton alloc] init];
        [_sqButton setImage:[UIImage imageNamed:@"SQ"] forState:UIControlStateNormal];
    }
    
    return _sqButton;
}

- (UIButton *)soleButton {
    if (!_soleButton) {
        _soleButton = [[UIButton alloc] init];
        [_soleButton setImage:[UIImage imageNamed:@"独家"] forState:UIControlStateNormal];
    }
    
    return _soleButton;
}

- (UIButton *)originalSingingButton {
    if (!_originalSingingButton) {
        _originalSingingButton = [[UIButton alloc] init];
        [_originalSingingButton setImage:[UIImage imageNamed:@"原唱"] forState:UIControlStateNormal];
    }
    
    return _originalSingingButton;
}

- (UIButton *)videoPlayButton {
    if (!_videoPlayButton) {
        _videoPlayButton = [[UIButton alloc] init];
        [_videoPlayButton setImage:[UIImage imageNamed:@"视频播放"] forState:UIControlStateNormal];
    }
    
    return _videoPlayButton;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"更多操作"] forState:UIControlStateNormal];
    }
    
    return _moreButton;
}

- (songCellModel *)cellModel {
    if (!_cellModel) {
        _cellModel = [[songCellModel alloc] init];
    }
    
    return _cellModel;
}

@end
