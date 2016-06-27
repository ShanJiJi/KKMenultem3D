//
//  ContainerViewController.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "ContainerViewController.h"
#import "DetailVontainerViewController.h"

@interface ContainerViewController ()<UIScrollViewDelegate>{
    
}


@property(nonatomic,strong)DetailVontainerViewController *detailVC;
@end

@implementation ContainerViewController
@synthesize showingMenu;

-(void)viewDidLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.menuContainerVC.layer.anchorPoint = CGPointMake(1.0, 0.5);
    
    [self hidenMenuitemView:YES animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    showingMenu = NO;
}

//隐藏菜单视图
-(void)hidenMenuitemView:(BOOL)show animated:(BOOL)animated{
    
    CGFloat xOffset = CGRectGetWidth(self.menuContainerVC.bounds);
    
    [self.scrollView setContentOffset:(show ? CGPointZero : CGPointMake(xOffset, 0)) animated:animated];
    
    showingMenu = show;
}

-(void)setItemDic:(NSDictionary *)itemDic{
    
    _itemDic = itemDic;
    
    [self hidenMenuitemView:NO animated:YES];
    
    self.detailVC.itemDic = itemDic;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //菜单栏选转相关
    CGFloat multiplier = 1.0/CGRectGetWidth(self.menuContainerVC.bounds);
    CGFloat offset = scrollView.contentOffset.x *multiplier;
    CGFloat fraction = 1.0 - offset;
    
    self.menuContainerVC.layer.transform = [self transformForFraction:fraction];
    self.menuContainerVC.alpha = fraction;
    
    //汉堡包旋转
    [self.detailVC.hamburger rotate:fraction];
    
    //左右滑动显示相关
    scrollView.pagingEnabled = scrollView.contentOffset.x < scrollView.contentSize.width - CGRectGetWidth(scrollView.frame);
    
    CGFloat menuOffset = CGRectGetWidth(self.menuContainerVC.bounds);
    //当滚动界面时，判断菜单栏有没有被完全显示
    showingMenu = !CGPointEqualToPoint(CGPointMake(menuOffset, 0), scrollView.contentOffset);
}

//菜单栏3d旋转
-(CATransform3D)transformForFraction:(CGFloat)fraction{
    
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 =  -1.0/1000.0;
    CGFloat angle = (double)(1.0 - fraction) * -M_PI_2;
    CGFloat xOffset = CGRectGetWidth(self.menuContainerVC.bounds) * 0.5;
    CATransform3D rotateTransform = CATransform3DRotate(identity, (CGFloat)angle, 0.0, 1.0, 0.0);
    CATransform3D translateTransform = CATransform3DMakeTranslation(xOffset, 0.0, 0.0);
    
    return CATransform3DConcat(rotateTransform, translateTransform);

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([@"DetailViewSegue" isEqualToString:segue.identifier]) {
        
        UINavigationController *nav = segue.destinationViewController;
        self.detailVC = (DetailVontainerViewController *)nav.topViewController;
    }
    
    
}


@end
