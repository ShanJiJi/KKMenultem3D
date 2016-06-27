//
//  ContainerViewController.h
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController

@property(nonatomic,strong)NSDictionary *itemDic;

@property (weak, nonatomic) IBOutlet UIView *menuContainerVC;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic,assign)BOOL showingMenu;
//隐藏菜单视图
-(void)hidenMenuitemView:(BOOL)show animated:(BOOL)animated;

@end
