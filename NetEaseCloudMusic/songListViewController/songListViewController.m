//
//  songListViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "songListViewController.h"
#import "transViewController.h"
#import "songListSongCollectionViewCell.h"
#import "songListCoverCollectionViewCell.h"
#import "playAllCollectionViewCell.h"
#import "songCellModel.h"
#import "miniBarVCViewController.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface songListViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *dotsButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSDictionary *songListDic;
@property (nonatomic, strong) UICollectionView *songListCollectionview;
@property (nonatomic, strong) NSMutableArray *songCellModels;
@property (nonatomic, strong) miniBarVCViewController *minibarVC;
@property (nonatomic, copy) NSString *coverImageUrl;
@property (nonatomic, copy) NSString *songListName;
@property (nonatomic, copy) NSString *songListAuthorName;
@property (nonatomic, copy) NSString *songListDiscription;
@property (nonatomic, copy) NSString *authorAvatarImageUrl;

@end

@implementation songListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupModels];
    [self buildView];
}

- (void)setupModels {
    self.coverImageUrl = self.songListDic[@"playlist"][@"coverImgUrl"];
    self.songListName = self.songListDic[@"playlist"][@"name"];
    self.songListAuthorName = self.songListDic[@"playlist"][@"creator"][@"nickname"];
    self.songListDiscription = self.songListDic[@"playlist"][@"description"];
    self.authorAvatarImageUrl = self.songListDic[@"playlist"][@"creator"][@"avatarUrl"];
    for (int i = 0; i < 9; i++) {
        NSDictionary *tempSongCellDict = [NSDictionary dictionaryWithObjectsAndKeys:self.songListDic[@"playlist"][@"tracks"][i][@"name"],@"songName",self.songListDic[@"playlist"][@"tracks"][i][@"ar"][0][@"name"],@"songAuthor",self.songListDic[@"playlist"][@"tracks"][i][@"al"][@"name"],@"songAlbum",self.songListDic[@"playlist"][@"tracks"][i][@"al"][@"picUrl"],@"coverImageUrl", self.songListDic[@"playlist"][@"tracks"][i][@"rurl"],@"musicUrl",nil];
        songCellModel *songListCellModel = [songCellModel songCellModelWithDic:tempSongCellDict];
        [self.songCellModels addObject:songListCellModel];
    }
}

- (void)buildView {
    [self.view addSubview:self.songListCollectionview];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.searchButton];
    [self.view addSubview:self.dotsButton];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.minibarVC.view];
    [self setupConstraints];
}

- (void)setupConstraints {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager2 =  windowScene.statusBarManager;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height + 8);
        make.left.equalTo(@16);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backButton);
        make.right.equalTo(self.view).offset(-60);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.dotsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backButton);
        make.right.equalTo(self.view).offset(-16);
        make.width.equalTo(@28);
        make.height.equalTo(@28);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backButton);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@72);
        make.height.equalTo(@18);
    }];
    [self.songListCollectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view).offset(-69);
    }];
    [self.minibarVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.songListCollectionview.mas_bottom);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(@49);
    }];
}

- (miniBarVCViewController *)minibarVC {
    if (!_minibarVC) {
        _minibarVC = [[miniBarVCViewController alloc] init];
    }
    
    return _minibarVC;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return  _backButton;
}

- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [[UIButton alloc] init];
        [_searchButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    }
    
    return  _searchButton;
}

- (UIButton *)dotsButton {
    if (!_dotsButton) {
        _dotsButton = [[UIButton alloc] init];
        [_dotsButton setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    }
    
    return  _dotsButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"歌单";
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    
    return _titleLabel;
}

- (NSDictionary *)songListDic {
    if (!_songListDic) {
        _songListDic = [[NSDictionary alloc] init];
        NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
        NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"songList.geojson"];
        NSURL *url=[NSURL fileURLWithPath:path];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        _songListDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    
    return _songListDic;
}

- (UICollectionView *)songListCollectionview {
    if (!_songListCollectionview) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _songListCollectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _songListCollectionview.delegate = self;
        _songListCollectionview.dataSource = self;
        _songListCollectionview.backgroundColor = [UIColor whiteColor];
        _songListCollectionview.showsVerticalScrollIndicator = NO;
        [_songListCollectionview registerClass:[songListCoverCollectionViewCell class]
                forCellWithReuseIdentifier:@"songListCoverCollectionViewCell"];
        [_songListCollectionview registerClass:[songListSongCollectionViewCell class]
                forCellWithReuseIdentifier:@"songListSongCollectionViewCell"];
        [_songListCollectionview registerClass:[playAllCollectionViewCell class]
                forCellWithReuseIdentifier:@"playAllCollectionViewCell"];
    }
    
    return _songListCollectionview;
}

- (NSMutableArray *)songCellModels {
    if (!_songCellModels) {
        _songCellModels = [[NSMutableArray alloc] init];
    }
    
    return _songCellModels;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"back");
    }];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        songListCoverCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"songListCoverCollectionViewCell"
                                          forIndexPath:indexPath];
        [cell.coverImageView setImageWithURL:[NSURL URLWithString:self.coverImageUrl]
                       placeholderImage:nil];
        cell.nameLabel.text = self.songListName;
        cell.authorNameLabel.text = self.songListAuthorName;
        [cell.authorImageView setImageWithURL:[NSURL URLWithString:self.authorAvatarImageUrl]
                       placeholderImage:nil];
        cell.descriptionLabel.text = self.songListDiscription;
        return cell;
    } else if (indexPath.row == 1) {
        playAllCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"playAllCollectionViewCell"
                                          forIndexPath:indexPath];
        return cell;
    } else {
        songListSongCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"songListSongCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.songNumLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row - 1];
        cell.cellModel = self.songCellModels[indexPath.row - 2];
        cell.songNameLabel.text = cell.cellModel.songName;
        cell.transVC.cellModel = cell.cellModel;
        cell.transVC.songCellModels = self.songCellModels;
        cell.transVC.cellNum = [NSString stringWithFormat:@"%ld",indexPath.row - 1];
        if (indexPath.row <= 9) {
            songCellModel *tempModel = self.songCellModels[indexPath.row - 1];
            cell.transVC.nextMusicUrl = tempModel.musicUrl;
            cell.transVC.nextCoverImageUrl = tempModel.coverImageUrl;
        } else {
            songCellModel *tempModel = self.songCellModels[0];
            cell.transVC.nextMusicUrl = tempModel.musicUrl;
            cell.transVC.nextCoverImageUrl = tempModel.coverImageUrl;
        }
        if (indexPath.row >= 3) {
            songCellModel *tempModel = self.songCellModels[indexPath.row - 3];
            cell.transVC.lastMusicUrl = tempModel.musicUrl;
            cell.transVC.lastCoverImageUrl = tempModel.coverImageUrl;
        } else {
            songCellModel *tempModel = self.songCellModels[8];
            cell.transVC.lastMusicUrl = tempModel.musicUrl;
            cell.transVC.lastCoverImageUrl = tempModel.coverImageUrl;
        }
        NSString *line = @"-";
        NSString *tempString = [cell.cellModel.songAuthor stringByAppendingString: line];;
        cell.songDiscriptionLabel.text = [tempString stringByAppendingString: cell.cellModel.songAlbum];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return CGSizeMake(self.view.frame.size.width, 255);
    } else if (indexPath.row == 1) {
        return CGSizeMake(self.view.frame.size.width, 50);
    } else {
        return CGSizeMake(self.view.frame.size.width, 60);
    }
    
    return CGSizeZero;
}

@end
