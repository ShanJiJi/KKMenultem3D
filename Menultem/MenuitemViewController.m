//
//  MenuitemViewController.m
//  Menultem
//
//  Created by 珍玮 on 16/6/27.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "MenuitemViewController.h"
#import "MenuitemCell.h"
#import "ContainerViewController.h"

@interface MenuitemViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuitemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"菜单";
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    _dataArr  = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"_dataArr = %@",_dataArr);
    
    ((ContainerViewController *)self.navigationController.parentViewController).itemDic = _dataArr[0];
    
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuitemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuitemCell"];
    
    NSDictionary *dic = _dataArr[indexPath.row];
    
    [cell cingigData:dic];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = _dataArr[indexPath.row];
    
    ((ContainerViewController *)self.navigationController.parentViewController).itemDic = dic;

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
