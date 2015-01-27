//
//  UIImage+ext.h
//  美团iPad
//
//  Created by wealon on 15-1-27.
//  Copyright (c) 2015年 wealon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ext)
#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName;

#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;
@end
