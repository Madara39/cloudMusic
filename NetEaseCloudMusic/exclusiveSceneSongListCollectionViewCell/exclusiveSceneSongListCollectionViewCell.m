//
//  exclusiveSceneSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "exclusiveSceneSongListCollectionViewCell.h"
#import "subExclusiveSceneSongListCollectionViewCell.h"
#import "exclusiveSceneSongListTitleView.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface exclusiveSceneSongListCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) exclusiveSceneSongListTitleView *titleView;
@property (nonatomic, strong) UICollectionView *subExclusiveSceneSongListCollectionView;

@end

@implementation exclusiveSceneSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.titleView];
    [self.contentView addSubview:self.subExclusiveSceneSongListCollectionView];
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
    [self.subExclusiveSceneSongListCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom);
            make.left.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@144);
    }];
}

- (NSArray *)exclusiveSceneSongListCellModels {
    if (!_exclusiveSceneSongListCellModels) {
        _exclusiveSceneSongListCellModels = [[NSArray alloc] init];
    }
    
    return _exclusiveSceneSongListCellModels;
}

- (exclusiveSceneSongListTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[exclusiveSceneSongListTitleView alloc] init];
    }
    
    return _titleView;
}

- (UICollectionView *)subExclusiveSceneSongListCollectionView {
    if (!_subExclusiveSceneSongListCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _subExclusiveSceneSongListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _subExclusiveSceneSongListCollectionView.delegate = self;
        _subExclusiveSceneSongListCollectionView.dataSource = self;
        _subExclusiveSceneSongListCollectionView.backgroundColor = [UIColor whiteColor];
        _subExclusiveSceneSongListCollectionView.showsHorizontalScrollIndicator = NO;
        [_subExclusiveSceneSongListCollectionView registerClass:[subExclusiveSceneSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"subExclusiveSceneSongListCollectionViewCell"];
    }
    
    return _subExclusiveSceneSongListCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subExclusiveSceneSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subExclusiveSceneSongListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellModel = self.exclusiveSceneSongListCellModels[indexPath.item];
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
