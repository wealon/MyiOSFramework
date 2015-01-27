//
//  UIView+frame.m
//  美团iPad
//
//  Created by wealon on 15-1-27.
//  Copyright (c) 2015年 wealon. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)
- (void)setX:(NSInteger)x
{
    CGRect tempFrame = self.frame;
    tempFrame.origin.x = x;
    self.frame = tempFrame;
}

- (NSInteger)x
{
    return self.frame.origin.x;
}

- (void)setY:(NSInteger)y
{
    CGRect tempFrame = self.frame;
    tempFrame.origin.y = y;
    self.frame = tempFrame;
}

- (NSInteger)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(NSInteger)width
{
    CGRect tempFrame = self.frame;
    tempFrame.size.width = width;
    self.frame = tempFrame;
}

- (NSInteger)width
{
    return self.frame.size.width;
}

- (void)setHeight:(NSInteger)height
{
    CGRect tempFrame = self.frame;
    tempFrame.size.height = height;
    self.frame = tempFrame;
}

- (NSInteger)height
{
    return self.frame.size.height;
}
@end
