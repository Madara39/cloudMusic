//
//  discoveryPageViewController.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/16.
//

#import "discoveryPageViewController.h"
#import "searchViewController.h"
#import <Masonry/Masonry.h>
#import "functionCollectionViewCell.h"
#import "bannerCollectionViewCell.h"
#import "carefullyChosenSongListCollectionViewCell.h"
#import "miniBarVCViewController.h"
#import "recommendedSongListCollectionViewCell.h"
#import "radarSongListCollectionViewCell.h"
#import "exclusiveSceneSongListCollectionViewCell.h"
#import "discoveryPageSongListCellModel.h"
#import "bannerModel.h"
#import <UIImageView+AFNetworking.h>



@interface discoveryPageViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) searchViewController *searchBar;
@property (nonatomic, strong) UICollectionView *mainCollectionview;
@property (nonatomic, strong) miniBarVCViewController *miniBar;
@property (nonatomic, strong) NSDictionary *homeDic;
@property (nonatomic, strong) NSMutableArray *recommendedSongListCellModels;
@property (nonatomic, strong) NSMutableArray *radarSongListCellModels;
@property (nonatomic, strong) NSMutableArray *exclusiveSceneSongListCellModels;
@property (nonatomic, strong) NSMutableArray *bannersModels;

@end

@implementation discoveryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupModels];
    [self buildView];
}

- (void)setupModels {
    for (int i = 0; i < 6; i++) {
        NSDictionary *tempRecommendedDict = [NSDictionary dictionaryWithObjectsAndKeys:self.homeDic[@"data"][@"blocks"][1][@"creatives"][i][@"uiElement"][@"mainTitle"][@"title"],@"title",self.homeDic[@"data"][@"blocks"][1][@"creatives"][i][@"uiElement"][@"image"][@"imageUrl"],@"imageUrl", nil];
        discoveryPageSongListCellModel *recommendedSongListCellModel = [discoveryPageSongListCellModel discoveryPageSongListCellModelWithDict:tempRecommendedDict];
        [self.recommendedSongListCellModels addObject:recommendedSongListCellModel];
        
        NSDictionary *tempRadarDict = [NSDictionary dictionaryWithObjectsAndKeys:self.homeDic[@"data"][@"blocks"][2][@"creatives"][i][@"uiElement"][@"mainTitle"][@"title"],@"title",self.homeDic[@"data"][@"blocks"][2][@"creatives"][i][@"uiElement"][@"image"][@"imageUrl"],@"imageUrl", nil];
        discoveryPageSongListCellModel *radarSongListCellModel = [discoveryPageSongListCellModel discoveryPageSongListCellModelWithDict:tempRadarDict];
        [self.radarSongListCellModels addObject:radarSongListCellModel];
        
        NSDictionary *tempExclusiveSceneDict = [NSDictionary dictionaryWithObjectsAndKeys:self.homeDic[@"data"][@"blocks"][3][@"creatives"][i][@"uiElement"][@"mainTitle"][@"title"],@"title",self.homeDic[@"data"][@"blocks"][3][@"creatives"][i][@"uiElement"][@"image"][@"imageUrl"],@"imageUrl", nil];
        discoveryPageSongListCellModel *exclusiveSceneSongListCellModel = [discoveryPageSongListCellModel discoveryPageSongListCellModelWithDict:tempExclusiveSceneDict];
        [self.exclusiveSceneSongListCellModels addObject:exclusiveSceneSongListCellModel];
    }
    for (int i = 0; i < 12; i++) {
        NSString *tempBannerString = self.homeDic[@"data"][@"blocks"][0][@"extInfo"][@"banners"][i][@"pic"];
        bannerModel *bannerImageModel = [bannerModel bannerModelWithString:tempBannerString];
        [self.bannersModels addObject:bannerImageModel];
    }
}

- (void)buildView {
    [self.view addSubview:self.searchBar.view];
    [self.view addSubview:self.mainCollectionview];
    [self.view addSubview:self.miniBar.view];
    [self setupConstraints];
}

- (void)setupConstraints {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager2 =  windowScene.statusBarManager;
    [self.searchBar.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.view);
            make.height.equalTo(@44);
            make.top.equalTo(self.view).offset(statusBarManager2.statusBarFrame.size.height);
    }];
    [self.mainCollectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.searchBar.view.mas_bottom);
            make.width.equalTo(self.view);
            make.height.equalTo(self.view).offset(-222);
    }];
    [self.miniBar.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.view);
            make.height.equalTo(@49);
            make.top.equalTo(self.mainCollectionview.mas_bottom);
    }];
}

- (NSMutableArray *)recommendedSongListCellModels {
    if (!_recommendedSongListCellModels) {
        _recommendedSongListCellModels = [[NSMutableArray alloc] init];
    }
    
    return _recommendedSongListCellModels;
}

- (NSMutableArray *)radarSongListCellModels {
    if (!_radarSongListCellModels) {
        _radarSongListCellModels = [[NSMutableArray alloc] init];
    }
    
    return _radarSongListCellModels;
}

- (NSMutableArray *)exclusiveSceneSongListCellModels {
    if (!_exclusiveSceneSongListCellModels) {
        _exclusiveSceneSongListCellModels = [[NSMutableArray alloc] init];
    }
    
    return _exclusiveSceneSongListCellModels;
}

- (NSMutableArray *)bannersModels {
    if (!_bannersModels) {
        _bannersModels = [[NSMutableArray alloc] init];
    }
    
    return _bannersModels;
}

- (NSDictionary *)homeDic {
    if (!_homeDic) {
        NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
        NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"home.json"];
        NSURL *url=[NSURL fileURLWithPath:path];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        _homeDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    
    return _homeDic;
}

- (searchViewController *)searchBar {
    if (!_searchBar) {
        _searchBar = [[searchViewController alloc] init];
    }
    
    return _searchBar;
}

- (UICollectionView *)mainCollectionview {
    if (!_mainCollectionview) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _mainCollectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _mainCollectionview.delegate = self;
        _mainCollectionview.dataSource = self;
        _mainCollectionview.backgroundColor = [UIColor whiteColor];
        _mainCollectionview.showsVerticalScrollIndicator = NO;
        [_mainCollectionview registerClass:[functionCollectionViewCell class]
                forCellWithReuseIdentifier:@"functionCollectionViewCell"];
        [_mainCollectionview registerClass:[bannerCollectionViewCell class]
                forCellWithReuseIdentifier:@"bannerCollectionViewCell"];
        [_mainCollectionview registerClass:[carefullyChosenSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"carefullyChosenSongListCollectionViewCell"];
        [_mainCollectionview registerClass:[recommendedSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"recommendedSongListCollectionViewCell"];
        [_mainCollectionview registerClass:[radarSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"radarSongListCollectionViewCell"];
        [_mainCollectionview registerClass:[exclusiveSceneSongListCollectionViewCell class]
                forCellWithReuseIdentifier:@"exclusiveSceneSongListCollectionViewCell"];
    }
    
    return _mainCollectionview;
}

- (miniBarVCViewController *)miniBar {
    if (!_miniBar) {
        _miniBar = [[miniBarVCViewController alloc] init];
    }
    
    return _miniBar;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        bannerCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"bannerCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        cell.bannerCellModels = self.bannersModels;
        return cell;
    } else if (indexPath.row == 1) {
        functionCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"functionCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        return cell;
    } else  if (indexPath.row == 2) {
        carefullyChosenSongListCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"carefullyChosenSongListCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        return cell;
    } else  if (indexPath.row == 3) {
        recommendedSongListCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"recommendedSongListCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.recommendedSongListCellModels = self.recommendedSongListCellModels;
        return cell;
    } else  if (indexPath.row == 4) {
        radarSongListCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"radarSongListCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.radarSongListCellModels = self.radarSongListCellModels;
        return cell;
    } else {
        exclusiveSceneSongListCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:@"exclusiveSceneSongListCollectionViewCell"
                                          forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.exclusiveSceneSongListCellModels = self.exclusiveSceneSongListCellModels;
        return cell;
    }

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return CGSizeMake(self.view.frame.size.width, 144);
    } else if (indexPath.row == 1) {
        return CGSizeMake(self.view.frame.size.width, 80);
    } else if (indexPath.row == 2) {
        return CGSizeMake(self.view.frame.size.width, 208);
    } else if (indexPath.row == 3) {
        return CGSizeMake(self.view.frame.size.width, 178);
    } else if (indexPath.row == 4) {
        return CGSizeMake(self.view.frame.size.width, 178);
    } else {
        return CGSizeMake(self.view.frame.size.width, 178);
    }
    
    return CGSizeZero;
}


@end
