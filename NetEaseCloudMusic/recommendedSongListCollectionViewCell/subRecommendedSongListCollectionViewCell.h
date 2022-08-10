//
//  subRecommendedSongListCollectionViewCell.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import <UIKit/UIKit.h>
#import "discoveryPageSongListCellModel.h"
#import "transViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface subRecommendedSongListCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) transViewController *transVC;
@property (nonatomic, strong) discoveryPageSongListCellModel *cellModel;

@end

NS_ASSUME_NONNULL_END
