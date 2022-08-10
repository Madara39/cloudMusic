//
//  subBannerCollectionViewCollectionViewCell.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "bannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface subBannerCollectionViewCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *bannerView;
@property (nonatomic, strong) bannerModel *cellModel;

@end

NS_ASSUME_NONNULL_END
