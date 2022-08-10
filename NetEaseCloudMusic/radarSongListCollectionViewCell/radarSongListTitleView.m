//
//  radarSongListTitleView.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "radarSongListTitleView.h"
#import <Masonry/Masonry.h>

@implementation radarSongListTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self addSubview:self.titleLabel];
    [self addSubview:self.moreButton];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self);
        make.width.equalTo(@180);
        make.height.equalTo(@18);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.centerY.equalTo(self);
        make.width.equalTo(@61);
        make.height.equalTo(@26);
    }];
}

- (UIButton*)moreButton {
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    }
    
    return _moreButton;
}

- (UILabel*)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"-_Madara_-的雷达歌单";
    }
    
    return _titleLabel;
}

@end
