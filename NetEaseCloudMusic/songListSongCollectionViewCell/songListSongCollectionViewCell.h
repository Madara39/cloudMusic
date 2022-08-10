//
//  songListSongCollectionViewCell.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import <UIKit/UIKit.h>
#import "songCellModel.h"
#import "songPlayTransVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface songListSongCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *songNumLabel;
@property (nonatomic, strong) UILabel *songNameLabel;
@property (nonatomic, strong) UILabel *songDiscriptionLabel;
@property (nonatomic, strong) UIButton *vipButton;
@property (nonatomic, strong) UIButton *sqButton;
@property (nonatomic, strong) UIButton *soleButton;
@property (nonatomic, strong) UIButton *originalSingingButton;
@property (nonatomic, strong) UIButton *videoPlayButton;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) songCellModel *cellModel;
@property (nonatomic, strong) songPlayTransVC *transVC;


@end

NS_ASSUME_NONNULL_END
