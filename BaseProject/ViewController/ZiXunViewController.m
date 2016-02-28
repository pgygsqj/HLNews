//
//  ZiXunViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZiXunViewController.h"
#import "ZiXunCell.h"
#import "ZiXunViewModel.h"
#import "TuZiCommentHtmlViewController.h"

@interface ZiXunViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZiXunViewModel *zixunVM;

@end

@implementation ZiXunViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"资讯";
    }
    return self;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ZiXunCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.zixunVM getDataFromNetCompleteHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_tableView reloadData];
               }
               [_tableView.header endRefreshing];
           }];
        }];
    }
    return _tableView;
}

- (ZiXunViewModel *)zixunVM {
    if(_zixunVM == nil) {
        _zixunVM = [[ZiXunViewModel alloc] init];
    }
    return _zixunVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.zixunVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZiXunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.imgView.imageView setImageWithURL:[self.zixunVM imgsrcURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text = [self.zixunVM titleForRow:indexPath.row];
    [cell.replyView.imageView setImage:[UIImage imageNamed:@"topic_comment_n"]];//setting_appad,sound_comments
    cell.replyCountLb.text = [self.zixunVM replyCountForRow:indexPath.row];
    cell.ptimeLb.text = [self.zixunVM ptimeForRow:indexPath.row];
    return cell;
}

kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TuZiCommentHtmlViewController *vc = [[TuZiCommentHtmlViewController alloc] initWithURL:[self.zixunVM url3wForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
