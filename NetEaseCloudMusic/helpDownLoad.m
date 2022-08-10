//
//  helpDownLoad.m
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/29.
//

#import "helpDownLoad.h"
#import <AFNetworking.h>
 
@implementation helpDownLoad
 
+(void)downLoadUrlString:(NSString *)urlStr returnStr:(filePath)str{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionDownloadTask *download  =[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *strp = [NSString stringWithFormat:@"%@",filePath];
        str(strp);
    }];
    [download resume];
    
}
@end


