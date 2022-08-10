//
//  songListCoverCollectionViewCell.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface songListCoverCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *functionBarButton;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *authorImageView;
@property (nonatomic, strong) UIButton *followButton;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *authorNameLabel;
@property (nonatomic, strong) UILabel *collectionLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *shareLabel;
@property (nonatomic, strong) UIButton *collectionButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *divisionButton1;
@property (nonatomic, strong) UIButton *divisionButton2;


@end

NS_ASSUME_NONNULL_END
