//
//  carefullyChosenSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/27.
//

#import "carefullyChosenSongListCollectionViewCell.h"
#import "carefullyChosenSongListTitleView.h"
#import "subSubCarefullyChosenSongListCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface carefullyChosenSongListCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) carefullyChosenSongListTitleView *titleView;
@property (nonatomic, strong) UICollectionView *subCarefullyChosenSongListCollectionView;

@end

@implementation carefullyChosenSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.titleView];
    [self.contentView addSubview:self.subCarefullyChosenSongListCollectionView];
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
    [self.subCarefullyChosenSongListCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom).offset(12);
            make.left.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            make.height.equalTo(@170);
    }];
}

- (carefullyChosenSongListTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[carefullyChosenSongListTitleView alloc] init];
    }
    
    return _titleView;
}

- (UICollectionView *)subCarefullyChosenSongListCollectionView {
    if (!_subCarefullyChosenSongListCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _subCarefullyChosenSongListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _subCarefullyChosenSongListCollectionView.delegate = self;
        _subCarefullyChosenSongListCollectionView.dataSource = self;
        _subCarefullyChosenSongListCollectionView.backgroundColor = [UIColor whiteColor];
        _subCarefullyChosenSongListCollectionView.showsHorizontalScrollIndicator = NO;
        [_subCarefullyChosenSongListCollectionView registerClass:[subSubCarefullyChosenSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"subSubCarefullyChosenSongListCollectionViewCell"];
    }
    
    return _subCarefullyChosenSongListCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    subSubCarefullyChosenSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subSubCarefullyChosenSongListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.item == 0) {
        cell.avatarName1 = @"left1";
        cell.avatarName2 = @"left2";
        cell.avatarName3 = @"left3";
    } else {
        cell.avatarName1 = @"right1";
        cell.avatarName2 = @"right2";
        cell.avatarName3 = @"right3";
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(327, 170);
}


@end
