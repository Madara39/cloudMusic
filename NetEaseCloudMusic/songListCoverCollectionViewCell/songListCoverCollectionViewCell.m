//
//  songListCoverCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "songListCoverCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation songListCoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.backgroundImageView];
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.followButton];
    [self.contentView addSubview:self.authorImageView];
    [self.contentView addSubview:self.descriptionLabel];
    [self.contentView addSubview:self.authorNameLabel];
    [self.contentView addSubview:self.functionBarButton];
    [self.contentView addSubview:self.collectionLabel];
    [self.contentView addSubview:self.collectionButton];
    [self.contentView addSubview:self.shareLabel];
    [self.contentView addSubview:self.shareButton];
    [self.contentView addSubview:self.commentLabel];
    [self.contentView addSubview:self.commentButton];
    [self.contentView addSubview:self.divisionButton1];
    [self.contentView addSubview:self.divisionButton2];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@245);
    }];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@53);
            make.left.equalTo(@16);
            make.width.equalTo(@120);
            make.height.equalTo(@120);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.coverImageView.mas_right).offset(16);
            make.top.equalTo(self.coverImageView);
            make.width.equalTo(@207);
            make.height.equalTo(@40);
    }];
    [self.authorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.coverImageView.mas_right).offset(16);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(16);
            make.width.equalTo(@25);
            make.height.equalTo(@25);
    }];
    [self.authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.authorImageView);
            make.left.equalTo(self.authorImageView.mas_right).offset(6);
            make.width.equalTo(@80);
            make.height.equalTo(@12);
    }];
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.authorImageView);
            make.left.equalTo(self.authorNameLabel.mas_right).offset(5);
            make.width.equalTo(@32);
            make.height.equalTo(@20);
    }];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.authorImageView.mas_bottom).offset(22);
            make.left.equalTo(self.nameLabel);
            make.width.equalTo(@207);
            make.height.equalTo(@20);
    }];
    [self.functionBarButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageView.mas_bottom).offset(44);
            make.centerX.equalTo(self.contentView);
            make.width.equalTo(@275);
            make.height.equalTo(@44);
    }];
    [self.collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.functionBarButton.mas_top).offset(10);
            make.left.equalTo(self.functionBarButton.mas_left).offset(28);
            make.width.equalTo(@24);
            make.height.equalTo(@24);
    }];
    [self.collectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.collectionButton.mas_right).offset(4);
            make.width.equalTo(@40);
            make.height.equalTo(@12);
    }];
    [self.divisionButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.functionBarButton.mas_left).offset(94);
            make.width.equalTo(@1);
            make.height.equalTo(@20);
    }];
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.divisionButton1.mas_left).offset(19);
            make.width.equalTo(@24);
            make.height.equalTo(@24);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.commentButton.mas_right).offset(4);
            make.width.equalTo(@40);
            make.height.equalTo(@12);
    }];
    [self.divisionButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.functionBarButton.mas_left).offset(180);
            make.width.equalTo(@1);
            make.height.equalTo(@20);
    }];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.divisionButton2.mas_left).offset(19);
            make.width.equalTo(@24);
            make.height.equalTo(@24);
    }];
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.collectionButton);
            make.left.equalTo(self.shareButton.mas_right).offset(4);
            make.width.equalTo(@40);
            make.height.equalTo(@12);
    }];
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        [_backgroundImageView setImage:[UIImage imageNamed:@"背景"]];
    }
    
    return _backgroundImageView;
}

- (UIButton *)functionBarButton {
    if (!_functionBarButton) {
        _functionBarButton = [[UIButton alloc] init];
        [_functionBarButton setBackgroundColor:[UIColor whiteColor]];
        _functionBarButton.layer.cornerRadius = 20;
        _functionBarButton.layer.borderWidth = 1;
        _functionBarButton.layer.borderColor = [[UIColor grayColor] CGColor];
    }
    
    return _functionBarButton;
}

- (UIButton *)collectionButton {
    if (!_collectionButton) {
        _collectionButton = [[UIButton alloc] init];
        [_collectionButton setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
    }
    
    return _collectionButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [[UIButton alloc] init];
        [_commentButton setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    }
    
    return _commentButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [[UIButton alloc] init];
        [_shareButton setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    }
    
    return _shareButton;
}

- (UIButton *)divisionButton1 {
    if (!_divisionButton1) {
        _divisionButton1 = [[UIButton alloc] init];
        [_divisionButton1 setImage:[UIImage imageNamed:@"分割"] forState:UIControlStateNormal];
    }
    
    return _divisionButton1;
}

- (UIButton *)divisionButton2 {
    if (!_divisionButton2) {
        _divisionButton2 = [[UIButton alloc] init];
        [_divisionButton2 setImage:[UIImage imageNamed:@"分割"] forState:UIControlStateNormal];
    }
    
    return _divisionButton2;
}

- (UILabel *)collectionLabel {
    if (!_collectionLabel) {
        _collectionLabel = [[UILabel alloc] init];
        _collectionLabel.text = @"829";
        _collectionLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _collectionLabel;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.text = @"584";
        _commentLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _commentLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        _shareLabel.text = @"283";
        _shareLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _shareLabel;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
    }
    
    return _coverImageView;
}

- (UIImageView *)authorImageView {
    if (!_authorImageView) {
        _authorImageView = [[UIImageView alloc] init];
        _authorImageView.layer.masksToBounds = YES;
        _authorImageView.layer.cornerRadius = 25 * 0.5;
    }
    
    return _authorImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.numberOfLines = 2;
        _nameLabel.textColor = [UIColor whiteColor];
    }
    
    return _nameLabel;
}

- (UILabel *)authorNameLabel {
    if (!_authorNameLabel) {
        _authorNameLabel = [[UILabel alloc] init];
        _authorNameLabel.font = [UIFont systemFontOfSize:12];
        _authorNameLabel.textColor = [UIColor whiteColor];
    }
    
    return _authorNameLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = [UIFont systemFontOfSize:12];
        _descriptionLabel.textColor = [UIColor whiteColor];
    }
    
    return _descriptionLabel;
}

- (UIButton *)followButton {
    if (!_followButton) {
        _followButton = [[UIButton alloc] init];
        [_followButton setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
    }
    
    return _followButton;
}

@end
