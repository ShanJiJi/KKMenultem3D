//
//  MenuitemCell.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "MenuitemCell.h"

@implementation MenuitemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


-(void)cingigData:(NSDictionary *)menuitemDic{
    
    self.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",menuitemDic[@"image"]]];
    
    
    self.backgroundColor = [UIColor colorArray:menuitemDic[@"colors"]];
    
}

@end
