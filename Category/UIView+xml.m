//
//  UIView+xml.m
//  美团iPad
//
//  Created by wealon on 15-1-27.
//  Copyright (c) 2015年 wealon. All rights reserved.
//

#import "UIView+xml.h"

@implementation UIView (xml)

// 打印输出
- (void)xmlPrint
{
    NSString *xml = [self xmlWithViewComponent];
    [xml writeToFile:@"/Volumes/Data/MyIOS/MyTemp/xml.xml" atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

/**
 *  生成当前View的层次结构
 *
 *  @return xml字符串.
 */
- (NSString *)xmlWithViewComponent
{
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child xmlWithViewComponent];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", self.class];
    
    return xml;

}

@end
