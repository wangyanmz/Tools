//
//  UIColor+Hex.m
//  qinghaiJiJianMobilePlat
//
//  Created by wangyan on 2020/3/18.
//  Copyright © 2020 wangyan. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (NSDictionary *)dictionaryWithHexString:(NSString *)color {
    NSDictionary *dict = @{@"r" : @"0",
                           @"g" : @"0",
                           @"b" : @"0"};
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return dict;
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return dict;
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    dict = @{@"r" : [NSString stringWithFormat:@"%u", r],
             @"g" : [NSString stringWithFormat:@"%u", g],
             @"b" : [NSString stringWithFormat:@"%u", b]};
    return dict;
}

+ (UIColor *)colorWithHexString: (NSString *)color {
    NSDictionary *dict = [self dictionaryWithHexString:color];
    CGFloat r = [[dict objectForKey:@"r"] floatValue];
    CGFloat g = [[dict objectForKey:@"g"] floatValue];
    CGFloat b = [[dict objectForKey:@"b"] floatValue];
    
    return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSDictionary *dict = [self dictionaryWithHexString:color];
    CGFloat r = [[dict objectForKey:@"r"] floatValue];
    CGFloat g = [[dict objectForKey:@"g"] floatValue];
    CGFloat b = [[dict objectForKey:@"b"] floatValue];
    
    return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:alpha];
}

@end
