//
//  UIView+xml.h
//  美团iPad
//
//  Created by wealon on 15-1-27.
//  Copyright (c) 2015年 wealon. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIView (xml)

// 打印输出
- (void)xmlPrint;

/**
 *  生成当前View的层次结构
 *
 *  @return xml字符串.
 */
- (NSString *)xmlWithViewComponent;

@end
