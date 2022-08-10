//
//  helpDownLoad.h
//  NetEaseCloudMusic
//
//  Created by cegan on 2022/3/29.
//

#import <Foundation/Foundation.h>
 
@interface helpDownLoad : NSObject
 
typedef void(^filePath)(NSString  *data);
 
+(void)downLoadUrlString:(NSString *)urlStr returnStr:(filePath)str;
 
@end


