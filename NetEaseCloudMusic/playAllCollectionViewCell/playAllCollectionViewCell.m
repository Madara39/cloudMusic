//
//  playAllCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import "playAllCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation playAllCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.platAllButton];
    [self.contentView addSubview:self.playAllLabel];
    [self.contentView addSubview:self.playCountLabel];
    [self.contentView addSubview:self.downloadButton];
    [self.contentView addSubview:self.chooseButton];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.platAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.playAllLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.platAllButton.mas_right).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [self.playCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.playAllLabel.mas_right).offset(6);
        make.width.equalTo(@30);
        make.height.equalTo(@16);
    }];
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-52);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
}

- (UIButton *)platAllButton {
    if (!_platAllButton) {
        _platAllButton = [[UIButton alloc] init];
        [_platAllButton setImage:[UIImage imageNamed:@"播放全部"] forState:UIControlStateNormal];
    }
    
    return _platAllButton;
}

- (UIButton *)chooseButton {
    if (!_chooseButton) {
        _chooseButton = [[UIButton alloc] init];
        [_chooseButton setImage:[UIImage imageNamed:@"多选"] forState:UIControlStateNormal];
    }
    
    return _chooseButton;
}

- (UIButton *)downloadButton {
    if (!_downloadButton) {
        _downloadButton = [[UIButton alloc] init];
        [_downloadButton setImage:[UIImage imageNamed:@"下载"] forState:UIControlStateNormal];
    }
    
    return _downloadButton;
}

- (UILabel *)playAllLabel {
    if (!_playAllLabel) {
        _playAllLabel = [[UILabel alloc] init];
        _playAllLabel.text = @"播放全部";
    }
    
    return _playAllLabel;
}

- (UILabel *)playCountLabel {
    if (!_playCountLabel) {
        _playCountLabel = [[UILabel alloc] init];
        _playCountLabel.text = @"(50)";
        _playCountLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _playCountLabel;
}


@end
