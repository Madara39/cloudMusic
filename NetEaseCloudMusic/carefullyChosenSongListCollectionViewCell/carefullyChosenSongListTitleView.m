//
//  carefullyChosenSongListTitleView.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/27.
//

#import "carefullyChosenSongListTitleView.h"
#import <Masonry/Masonry.h>

@implementation carefullyChosenSongListTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self addSubview:self.titleButton];
    [self addSubview:self.titleLabel];
    [self addSubview:self.playButton];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleButton.mas_right).offset(3);
        make.centerY.equalTo(self);
        make.width.equalTo(@108);
        make.height.equalTo(@18);
    }];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self);
        make.width.equalTo(@64);
        make.height.equalTo(@26);
    }];
}

- (UIButton*)titleButton {
    if (!_titleButton) {
        _titleButton = [[UIButton alloc] init];
        [_titleButton setImage:[UIImage imageNamed:@"刷新"] forState:UIControlStateNormal];
    }
    
    return _titleButton;
}

- (UIButton*)playButton {
    if (!_playButton) {
        _playButton = [[UIButton alloc] init];
        [_playButton setImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
    }
    
    return _playButton;
}

- (UILabel*)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"华语流行精选";
    }
    
    return _titleLabel;
}



@end
