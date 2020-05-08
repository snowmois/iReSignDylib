//
//  Helper.h
//  InjectionDylib
//
//  Created by mapboo on 2020/2/27.
//  Copyright © 2020 qunhongtech. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Helper : NSObject
+(NSString *)getHardwareSerialNumber;
+(NSString *)MD5:(NSString *)inPutText;
+(NSString *)reverseWordsInString:(NSString*)oldStr;
+ (NSString *)getTimeAfterNowWithDay:(NSInteger)day;
+(NSString *)getCurrentDate;
+(NSDate *)formatterDateStr:(NSString *)dateStr;
@end

NS_ASSUME_NONNULL_END
