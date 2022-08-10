//
//  songPlayViewController.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import <UIKit/UIKit.h>
#import "songCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface songPlayViewController : UIViewController

@property (nonatomic, strong) songCellModel *cellModel;
@property (nonatomic, copy) NSString *lastMusicUrl;
@property (nonatomic, copy) NSString *nextMusicUrl;
@property (nonatomic, copy) NSString *lastCoverImageUrl;
@property (nonatomic, copy) NSString *nextCoverImageUrl;
@property (nonatomic, strong) NSMutableArray *songCellModels;
@property (nonatomic, copy) NSString *cellNum;

@end

NS_ASSUME_NONNULL_END
