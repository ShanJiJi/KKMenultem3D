//
//  HamburgerView.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "HamburgerView.h"

@implementation HamburgerView{
    UIImageView *imageView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]){
        [self configUI];
    }
    return self;
}

-(void)configUI{
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hamburger"]];
    
    imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:imageView];
}

//旋转汉堡包图片
-(void)rotate:(CGFloat)fraction{
    CGFloat angle = fraction * M_PI_2;
    imageView.transform = CGAffineTransformMakeRotation(angle);
}

@end
