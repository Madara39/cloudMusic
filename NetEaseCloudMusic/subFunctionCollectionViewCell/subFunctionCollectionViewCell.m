//
//  subFunctionCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/25.
//

#import "subFunctionCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation subFunctionCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.functionButton];
    [self.contentView addSubview:self.functionLabel];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.functionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@46);
        make.height.equalTo(@46);
    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.functionButton.mas_bottom).offset(5);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@50);
        make.height.equalTo(@12);
    }];
}

- (UIButton *)functionButton {
    if (!_functionButton) {
        _functionButton = [[UIButton alloc] init];
    }
    
    return _functionButton;
}

- (UILabel *)functionLabel {
    if (!_functionLabel) {
        _functionLabel = [[UILabel alloc] init];
    }
    
    return _functionLabel;
}

@end
