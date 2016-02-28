//
//  TuZiCommentViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuZiCommentViewController.h"
#import "TuZiCommentCell.h"
#import "TuZiCommentViewModel.h"
#import "TuZiCommentHtmlViewController.h"

@interface TuZiCommentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TuZiCommentViewModel *commentVM;

@end

@implementation TuZiCommentViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"影评";
    }
    return self;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TuZiCommentCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.commentVM refreshDataCompletionHandle:^(NSError *error) {
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

- (TuZiCommentViewModel *)commentVM {
    if(_commentVM == nil) {
        _commentVM = [[TuZiCommentViewModel alloc] init];
    }
    return _commentVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TuZiCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.commentVM titleForRow:indexPath.row];
    cell.titlePlainLb.text = [self.commentVM titlePlainForRow:indexPath.row];
    [cell.commentView.imageView setImage:[UIImage imageNamed:@"topic_comment_n"]];
    cell.commentCountLb.text = [NSString stringWithFormat:@"%ld人",[self.commentVM commentCountForRow:indexPath.row]];
    cell.dateLb.text = [self.commentVM dateForRow:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TuZiCommentHtmlViewController *vc = [[TuZiCommentHtmlViewController alloc] initWithURL:[self.commentVM detailURLInListForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
