//
//  DetailVontainerViewController.h
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HamburgerView.h"

@interface DetailVontainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property(nonatomic,strong)NSDictionary *itemDic;
@property(nonatomic,strong)HamburgerView *hamburger;

@end
