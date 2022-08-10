//
//  bannerModel.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface bannerModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;

+ (instancetype)bannerModelWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
