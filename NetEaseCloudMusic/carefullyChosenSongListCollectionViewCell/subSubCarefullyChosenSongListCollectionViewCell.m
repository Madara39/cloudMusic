//
//  subSubCarefullyChosenSongListCollectionViewCell.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/27.
//

#import "subSubCarefullyChosenSongListCollectionViewCell.h"
#import "jingXuanSongListCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface subSubCarefullyChosenSongListCollectionViewCell () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *songListCollectionView;

@end

@implementation subSubCarefullyChosenSongListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildView];
    }
    
    return self;
}

- (void)buildView {
    [self.contentView addSubview:self.songListCollectionView];
    [self setupConstraints];
}

- (void)setupConstraints {
    [self.songListCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
}

- (UICollectionView *)songListCollectionView {
    if (!_songListCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _songListCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _songListCollectionView.delegate = self;
        _songListCollectionView.dataSource = self;
        _songListCollectionView.backgroundColor = [UIColor whiteColor];
        _songListCollectionView.showsVerticalScrollIndicator = NO;
        [_songListCollectionView registerClass:[jingXuanSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"jingXuanSongListCollectionViewCell"];
    }
    
    return _songListCollectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    jingXuanSongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"jingXuanSongListCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.item == 0) {
        [cell.avatarButton setImage:[UIImage imageNamed:self.avatarName1] forState:UIControlStateNormal];
        cell.songNameLabel.text = @"彼个所在";
        cell.songNameLabel.font = [UIFont systemFontOfSize:15];
        cell.singerNameLabel.text = @"-魏如萱";
        cell.singerNameLabel.font = [UIFont systemFontOfSize:12];
        cell.singerNameLabel.textColor = [UIColor grayColor];
        cell.introductionLabel.text = @"一提笔就写下最理想的爱情";
        cell.introductionLabel.font = [UIFont systemFontOfSize:12];
        cell.introductionLabel.textColor = [UIColor grayColor];
    } else if (indexPath.item == 1) {
        [cell.avatarButton setImage:[UIImage imageNamed:self.avatarName2] forState:UIControlStateNormal];
        cell.songNameLabel.text = @"害怕";
        cell.songNameLabel.font = [UIFont systemFontOfSize:15];
        cell.singerNameLabel.text = @"-Fine乐团";
        cell.singerNameLabel.textColor = [UIColor grayColor];
        cell.singerNameLabel.font = [UIFont systemFontOfSize:12];
        cell.introductionLabel.text = @"超90%人播放";
        cell.introductionLabel.font = [UIFont systemFontOfSize:12];
        cell.introductionLabel.textColor = [UIColor grayColor];
    } else {
        [cell.avatarButton setImage:[UIImage imageNamed:self.avatarName3] forState:UIControlStateNormal];
        cell.songNameLabel.text = @"盛夏光年";
        cell.songNameLabel.font = [UIFont systemFontOfSize:15];
        cell.singerNameLabel.text = @"-袁维娅";
        cell.singerNameLabel.font = [UIFont systemFontOfSize:12];
        cell.singerNameLabel.textColor = [UIColor grayColor];
        cell.introductionLabel.text = @"电音大神强强联手打造的全球热单";
        cell.introductionLabel.font = [UIFont systemFontOfSize:12];
        cell.introductionLabel.textColor = [UIColor grayColor];
    }

    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(327, 50);
}


@end
