//
//  DetailVontainerViewController.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "DetailVontainerViewController.h"
#import "ContainerViewController.h"

@interface DetailVontainerViewController ()

@end

@implementation DetailVontainerViewController
@synthesize hamburger;

- (void)viewDidLoad {
    [super viewDidLoad];
    //消除navigationBar下面的一条细线
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    hamburger = [[HamburgerView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    [self.view addSubview:hamburger];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hamburgerViewTapped)];
    
    [hamburger addGestureRecognizer:tapGesture];
//    [self.view addGestureRecognizer:tapGesture];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:hamburger];
    
}

//点击汉堡包手势
- (void)hamburgerViewTapped {
    
    ContainerViewController *containerVC = ((ContainerViewController *)self.navigationController.parentViewController);
    
    [containerVC hidenMenuitemView:!containerVC.showingMenu animated:YES];
    
}


-(void)setItemDic:(NSDictionary *)itemDic{
    
    _itemDic = itemDic;
    
    self.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",itemDic[@"image"]]];
    
    self.view.backgroundColor = [UIColor colorArray:itemDic[@"colors"]];
    
    self.title = itemDic[@"title"];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
