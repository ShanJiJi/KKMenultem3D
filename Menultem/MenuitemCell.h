//
//  MenuitemCell.h
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuitemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;



-(void)cingigData:(NSDictionary *)menuitemDic;

@end
