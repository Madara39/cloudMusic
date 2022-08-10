//
//  songCellModel.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface songCellModel : NSObject

@property (nonatomic, copy) NSString *songName;
@property (nonatomic, copy) NSString *songAuthor;
@property (nonatomic, copy) NSString *songAlbum;
@property (nonatomic, copy) NSString *coverImageUrl;
@property (nonatomic, copy) NSString *musicUrl;
@property (nonatomic, copy) NSMutableArray *songListArray;

+ (instancetype)songCellModelWithDic:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
