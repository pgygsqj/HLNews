//
//  ShiPinViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiPinViewController.h"
#import "ShiPinViewModel.h"
#import "ShiPinCell.h"
#import "iCarousel.h"
#import "TuZiCommentHtmlViewController.h"

@interface ShiPinViewController ()<UITableViewDataSource,UITableViewDelegate,iCarouselDataSource,iCarouselDelegate>
@property (nonatomic, strong) ShiPinViewModel *shipinVM;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShiPinViewController
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

- (UIView *)headerView{
    [_timer invalidate];
    if (!self.shipinVM.isExistIndexPic) return nil;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.shipinVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.shipinVM titleForRowInIndexPic:0];
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    _pageControl.hidesForSinglePage = YES;
    _ic.scrollEnabled = self.shipinVM.indexPicNumber != 1;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    if (self.shipinVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    _pageControl.userInteractionEnabled = NO;
    return headView;
}

#pragma mark - iCarousel

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.shipinVM.indexPicNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.shipinVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLb.text = [self.shipinVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.shipinVM isHtmlInIndexPicForRow:index]) {
        TuZiCommentHtmlViewController *vc = [[TuZiCommentHtmlViewController alloc] initWithURL:[self.shipinVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"精选";
    }
    return self;
}

- (ShiPinViewModel *)shipinVM {
    if(_shipinVM == nil) {
        _shipinVM = [[ShiPinViewModel alloc] init];
    }
    return _shipinVM;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.tableView registerClass:[ShiPinCell class] forCellReuseIdentifier:@"Cell"];
        
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.shipinVM refreshDataCompletionHandle:^(NSError *error) {
                self.tableView.tableHeaderView = [self headerView];
                [self.tableView.header endRefreshing];
                [self.tableView reloadData];
            }];
        }];
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.shipinVM getMoreDataCompletionHandle:^(NSError *error) {
                self.tableView.tableHeaderView = [self headerView];
                [self.tableView.footer endRefreshing];
                [self.tableView reloadData];
            }];
        }];
        [self.tableView.header beginRefreshing];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shipinVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShiPinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.shipinVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text = [self.shipinVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.shipinVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.shipinVM clicksForRowInList:indexPath.row];
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.shipinVM isHtmlInListForRow:indexPath.row]) {
        TuZiCommentHtmlViewController *vc = [[TuZiCommentHtmlViewController alloc] initWithURL:[self.shipinVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
