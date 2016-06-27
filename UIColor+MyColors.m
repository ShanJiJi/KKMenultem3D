//
//  UIColor+MyColors.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "UIColor+MyColors.h"

@implementation UIColor (MyColors)


+ (UIColor *)colorArray:(NSArray *)array{
    
    CGFloat red = [array[0] floatValue];
    CGFloat green = [array[1] floatValue];
    CGFloat blue = [array[2] floatValue];
    
    return [self colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}


@end
