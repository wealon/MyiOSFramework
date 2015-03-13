//
//  NSArray+Ext.m
//  02-test_runtime
//
//  Created by wealon on 15-3-13.
//  Copyright (c) 2015年 wealon. All rights reserved.
//  让所有的数组越界不会报错;  所有的数组插入空不可能得逞

#import "NSArray+Ext.h"
#import <objc/message.h>

/** 
 交换  NSArray的 objectAtIndex 与 NUObjectAtIndex
 */
@implementation NSArray (Ext)

+ (void)load
{
    Method methodOriginal = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method methodIdentify = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(NUObjectAtIndex:));
    
    method_exchangeImplementations(methodOriginal, methodIdentify);
}

- (instancetype)NUObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self NUObjectAtIndex:index];
    }else{
        NSLog(@"传入的索引越界");
        return nil;
    }
}

@end
/**
 交换  NSMutableArray 的 insertObject:atIndex: 与 NUObjectAtIndex
 交换  NSMutableArray的 objectAtIndex 与 NUObjectAtIndex
 */
@implementation NSMutableArray (Ext)

+ (void)load
{
    Method methodOriginal = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method methodIdentify = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(NUInsertObject:atIndex:));
    
    method_exchangeImplementations(methodOriginal, methodIdentify);
    
    
    Method methodOriginal2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method methodIdentify2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(NUObjectAtIndex:));
    
    method_exchangeImplementations(methodOriginal2, methodIdentify2);

}
- (instancetype)NUObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self NUObjectAtIndex:index];
    }else{
        NSLog(@"传入的索引越界");
        return nil;
    }
}

- (void)NUInsertObject:(id)obj atIndex:(NSUInteger)index
{
    // 判断传入的是否为空
    if (obj != nil) {
        [self NUInsertObject:obj atIndex:index];
    }else{
        NSLog(@"往数组中要传入的的值为空");
    }
}

@end
