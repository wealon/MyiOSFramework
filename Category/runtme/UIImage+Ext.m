//
//  UIImage+Ext.m
//  02-test_runtime
//
//  Created by wealon on 15-3-12.
//  Copyright (c) 2015年 wealon. All rights reserved.
//

#import "UIImage+Ext.h"
#import <objc/message.h>

@implementation UIImage (Ext)

+ (void)load
{
    // 获取的是类方法;
//    class_getInstanceMethod(nil, nil)  获取的是对象方法
   Method method1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method method2 = class_getClassMethod([UIImage class], @selector(imageWithName:));
    method_exchangeImplementations(method1, method2);
    
    
}

+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    BOOL iOS8 = [UIDevice currentDevice].systemVersion.floatValue >= 8.0;
    if (iOS8) {
        name = [name stringByAppendingString:@"_os8"];
        image = [UIImage imageWithName:name];
    }
    
    if (!image) {
        image = [UIImage imageWithName:name];
    }
    
    return image;
}
@end
