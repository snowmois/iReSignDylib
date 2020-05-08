//
//  Helper.m
//  InjectionDylib
//
//  Created by mapboo on 2020/2/27.
//  Copyright © 2020 qunhongtech. All rights reserved.
//

#import "Helper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Helper

+(NSString *)getHardwareSerialNumber{
    NSString * ret = nil;
    io_service_t platformExpert ;
    platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice")) ;
    
    if (platformExpert)    {
        CFTypeRef uuidNumberAsCFString ;
        uuidNumberAsCFString = IORegistryEntryCreateCFProperty(platformExpert, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0) ;
        if (uuidNumberAsCFString)    {
            ret = [(__bridge NSString *)(CFStringRef)uuidNumberAsCFString copy];
            CFRelease(uuidNumberAsCFString); uuidNumberAsCFString = NULL;
        }
        IOObjectRelease(platformExpert); platformExpert = 0;
    }
    
    return ret;
}

+(NSString *)MD5:(NSString *)inPutText{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] uppercaseString];
}

+(NSString*)reverseWordsInString:(NSString*)oldStr{
    NSMutableString *newStr = [[NSMutableString alloc] initWithCapacity:oldStr.length];
    for (int i = (int)oldStr.length - 1; i >= 0; i --) {
       unichar character = [oldStr characterAtIndex:i];
       [newStr appendFormat:@"%c",character];
    }
    return newStr;
}


+ (NSString *)getTimeAfterNowWithDay:(NSInteger)day{
    NSDate *nowDate = [NSDate date];
    NSTimeInterval  oneDay = 24*60*60*1;
    NSDate *theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*day];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:theDate];
}


+(NSString *)getCurrentDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}

+(NSDate *)formatterDateStr:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [dateFormatter dateFromString:dateStr];
}


@end
