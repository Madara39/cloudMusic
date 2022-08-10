//
//  songCellModel.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/31.
//

#import "songCellModel.h"

@implementation songCellModel

+ (instancetype)songCellModelWithDic:(NSDictionary *)dict {
    songCellModel *songListCellModel = [[self alloc] init];
    songListCellModel.songName = dict[@"songName"];
    songListCellModel.songAuthor = dict[@"songAuthor"];
    songListCellModel.songAlbum = dict[@"songAlbum"];
    songListCellModel.coverImageUrl = dict[@"coverImageUrl"];
    songListCellModel.musicUrl = dict[@"musicUrl"];
    
    return songListCellModel;
}

- (NSString *)songName {
    if (!_songName) {
        _songName = [[NSString alloc] init];
    }
    
    return _songName;
}

- (NSString *)songAuthor {
    if (!_songAuthor) {
        _songAuthor = [[NSString alloc] init];
    }
    
    return _songAuthor;
}

- (NSString *)songAlbum {
    if (!_songAlbum) {
        _songAlbum = [[NSString alloc] init];
    }
    
    return _songAlbum;
}

- (NSString *)coverImageUrl {
    if (!_coverImageUrl) {
        _coverImageUrl = [[NSString alloc] init];
    }
    
    return _coverImageUrl;
}

- (NSString *)musicUrl {
    if (!_musicUrl) {
        _musicUrl = [[NSString alloc] init];
    }
    
    return _musicUrl;
}

- (NSMutableArray *)songListArray {
    if (!_songListArray) {
        _songListArray = [[NSMutableArray alloc] init];
    }
    
    return _songListArray;
}

@end
