//
//  discoveryPageModel.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface discoveryPageSongListCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageUrl;

+ (instancetype)discoveryPageSongListCellModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
