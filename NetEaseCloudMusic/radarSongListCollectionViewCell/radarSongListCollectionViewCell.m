//
//  radarSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "radarSongListCollectionViewCell.h"
#import "subRadarSongListCollectionViewCell.h"
#import "radarSongListTitleView.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface radarSongListCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) radarSongListTitleView *titleView;
@property (nonatomic, strong) UICollectionView *subRadarSongListCollectionView;

@end

@implementation radarSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.titleView];
    [self.contentView addSubview:self.subRadarSongListCollectionView];
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
    [self.subRadarSongListCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom);
            make.left.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@144);
    }];
}

- (NSArray *)radarSongListCellModels {
    if (!_radarSongListCellModels) {
        _radarSongListCellModels = [[NSArray alloc] init];
    }
    
    return _radarSongListCellModels;
}

- (radarSongListTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[radarSongListTitleView alloc] init];
    }
    
    return _titleView;
}

- (UICollectionView *)subRadarSongListCollectionView {
    if (!_subRadarSongListCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _subRadarSongListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _subRadarSongListCollectionView.delegate = self;
        _subRadarSongListCollectionView.dataSource = self;
        _subRadarSongListCollectionView.backgroundColor = [UIColor whiteColor];
        _subRadarSongListCollectionView.showsHorizontalScrollIndicator = NO;
        [_subRadarSongListCollectionView registerClass:[subRadarSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"subRadarSongListCollectionViewCell"];
    }
    
    return _subRadarSongListCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subRadarSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subRadarSongListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.cellModel = self.radarSongListCellModels[indexPath.item];
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
