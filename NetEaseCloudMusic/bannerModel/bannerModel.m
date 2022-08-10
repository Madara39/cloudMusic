//
//  bannerModel.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/30.
//

#import "bannerModel.h"

@implementation bannerModel

+ (instancetype)bannerModelWithString:(NSString *)string {
    bannerModel *bannerImageModel = [[self alloc] init];
    bannerImageModel.imageUrl = string;
    
    return bannerImageModel;
}

- (NSString *)imageUrl {
    if (!_imageUrl) {
        _imageUrl = [[NSString alloc] init];
    }
    
    return _imageUrl;
}

@end
