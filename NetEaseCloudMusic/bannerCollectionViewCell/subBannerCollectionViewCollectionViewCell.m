//
//  subBannerCollectionViewCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "subBannerCollectionViewCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation subBannerCollectionViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.bannerView];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
}

- (UIImageView *)bannerView {
    if (!_bannerView) {
        _bannerView = [[UIImageView alloc] init];
    }
    
    return _bannerView;
}


@end
