//
//  bannerCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/24.
//

#import "bannerCollectionViewCell.h"
#import "subBannerCollectionViewCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface bannerCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *subBannerCollectionView;

@end

@implementation bannerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.subBannerCollectionView];
    [self.contentView setBackgroundColor:[UIColor redColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.subBannerCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
            make.width.equalTo(@343);
            make.height.equalTo(@134);
    }];
}

- (NSArray *)bannerCellModels {
    if (!_bannerCellModels) {
        _bannerCellModels = [[NSArray alloc] init];
    }
    
    return _bannerCellModels;
}

- (UICollectionView *)subBannerCollectionView {
    if (!_subBannerCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _subBannerCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _subBannerCollectionView.delegate = self;
        _subBannerCollectionView.dataSource = self;
        _subBannerCollectionView.backgroundColor = [UIColor whiteColor];
        _subBannerCollectionView.showsHorizontalScrollIndicator = NO;
        _subBannerCollectionView.pagingEnabled = YES;
        _subBannerCollectionView.bounces = NO;
        [_subBannerCollectionView registerClass:[subBannerCollectionViewCollectionViewCell class]
                forCellWithReuseIdentifier:@"subBannerCollectionViewCollectionViewCell"];
    }
    
    return _subBannerCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subBannerCollectionViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subBannerCollectionViewCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellModel = self.bannerCellModels[indexPath.item];
    [cell.bannerView setImageWithURL:[NSURL URLWithString:cell.cellModel.imageUrl]
                   placeholderImage:nil];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(343, 134);
}

@end
