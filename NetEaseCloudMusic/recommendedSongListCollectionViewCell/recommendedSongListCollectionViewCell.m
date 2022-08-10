//
//  recommendedSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import "recommendedSongListCollectionViewCell.h"
#import "subRecommendedSongListCollectionViewCell.h"
#import "recommendedSongListTitleView.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface recommendedSongListCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) recommendedSongListTitleView *titleView;
@property (nonatomic, strong) UICollectionView *subRecommendedSongListCollectionView;

@end

@implementation recommendedSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.titleView];
    [self.contentView addSubview:self.subRecommendedSongListCollectionView];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(@26);
    }];
    [self.subRecommendedSongListCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom);
            make.left.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@144);
    }];
}

- (NSArray *)recommendedSongListCellModels {
    if (!_recommendedSongListCellModels) {
        _recommendedSongListCellModels = [[NSArray alloc] init];
    }
    
    return _recommendedSongListCellModels;
}

- (recommendedSongListTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[recommendedSongListTitleView alloc] init];
    }
    
    return _titleView;
}

- (UICollectionView *)subRecommendedSongListCollectionView {
    if (!_subRecommendedSongListCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _subRecommendedSongListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _subRecommendedSongListCollectionView.delegate = self;
        _subRecommendedSongListCollectionView.dataSource = self;
        _subRecommendedSongListCollectionView.backgroundColor = [UIColor whiteColor];
        _subRecommendedSongListCollectionView.showsHorizontalScrollIndicator = NO;
        [_subRecommendedSongListCollectionView registerClass:[subRecommendedSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"subRecommendedSongListCollectionViewCell"];
    }
    
    return _subRecommendedSongListCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subRecommendedSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subRecommendedSongListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellModel = self.recommendedSongListCellModels[indexPath.item];
    cell.titleLabel.text = cell.cellModel.title;
    cell.titleLabel.font = [UIFont systemFontOfSize:12];
    cell.titleLabel.numberOfLines = 2;
    [cell.imageView setImageWithURL:[NSURL URLWithString:cell.cellModel.imageUrl]
                   placeholderImage:nil];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(104, 144);
}

@end


