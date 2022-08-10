//
//  discoveryPageModel.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/28.
//

#import "discoveryPageSongListCellModel.h"

@implementation discoveryPageSongListCellModel

+ (instancetype)discoveryPageSongListCellModelWithDict:(NSDictionary *)dict {
    discoveryPageSongListCellModel *discoveryPageSongListModel = [[self alloc] init];
    discoveryPageSongListModel.title = dict[@"title"];
    discoveryPageSongListModel.imageUrl = dict[@"imageUrl"];
    
    return discoveryPageSongListModel;
}

- (NSString *)title {
    if (!_title) {
        _title = [[NSString alloc] init];
    }
    
    return _title;
}

- (NSString *)imageUrl {
    if (!_imageUrl) {
        _imageUrl = [[NSString alloc] init];
    }
    
    return _imageUrl;
}

@end
