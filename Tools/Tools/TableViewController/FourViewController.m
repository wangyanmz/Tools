//
//  FourViewController.m
//  Tools
//
//  Created by ywang on 2021/7/2.
//

#import "FourViewController.h"
#import "JXCategoryView.h"
#import "testViewController.h"
#import "TestListBaseView.h"

@interface FourViewController ()<JXPagerViewDelegate, JXCategoryViewDelegate>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) JXPagerView *pagingView;
@property (nonatomic, strong) JXCategoryTitleView *segmentView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"第一", @"第二", @"第第第第第第第第第第第三", @"第四", @"第五"];
    
    [self.view addSubview:self.pagingView];
    [self.view addSubview:self.segmentView];
    self.segmentView.listContainer = (id<JXCategoryViewListContainer>)self.pagingView.listContainerView;
    
}

#pragma mark - JXPagingViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.headerView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return self.headerView.frame.size.height;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return 50;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.segmentView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.titles.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    TestListBaseView *list = [[TestListBaseView alloc] init];
    if (index == 0) {
        list.dataSource = @[@"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮", @"橡胶火箭", @"橡胶火箭炮", @"橡胶机关枪", @"橡胶子弹", @"橡胶攻城炮", @"橡胶象枪", @"橡胶象枪乱打", @"橡胶灰熊铳", @"橡胶雷神象枪", @"橡胶猿王枪", @"橡胶犀·榴弹炮", @"橡胶大蛇炮"].mutableCopy;
    }else if (index == 1) {
        list.dataSource = @[@"吃烤肉", @"吃鸡腿肉", @"吃牛肉", @"各种肉"].mutableCopy;
    }else if (index == 2) {
        list.dataSource = @[@"【剑士】罗罗诺亚·索隆", @"【航海士】娜美", @"【狙击手】乌索普", @"【厨师】香吉士", @"【船医】托尼托尼·乔巴", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾", @"【船匠】 弗兰奇", @"【音乐家】布鲁克", @"【考古学家】妮可·罗宾"].mutableCopy;
    }
    return list;
    
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark - Lazy Load

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 64.0, kWidth, 400.0)];
        _headerView.backgroundColor = [UIColor orangeColor];
    }
    return _headerView;
}

- (JXCategoryTitleView *)segmentView {
    if (!_segmentView) {
        _segmentView = [[JXCategoryTitleView alloc] init];
        _segmentView.frame = CGRectMake(0, 64.0, kWidth, 50.0);
        _segmentView.delegate = self;
        _segmentView.titles = self.titles;
        _segmentView.titleFont = [UIFont boldSystemFontOfSize:17.0];
        _segmentView.titleSelectedFont = [UIFont boldSystemFontOfSize:17.0];
        _segmentView.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        _segmentView.titleSelectedColor = [UIColor blackColor];
        _segmentView.titleColorGradientEnabled = YES;
        _segmentView.titleLabelZoomEnabled = YES;
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        // 设置指示器固定宽度
        lineView.indicatorWidth = 12.0;
        lineView.indicatorHeight = 3.0;
        lineView.indicatorColor = [UIColor whiteColor];
        lineView.indicatorCornerRadius = 1.5;
        _segmentView.indicators = @[lineView];
    }
    return _segmentView;
}

- (JXPagerView *)pagingView {
    if (!_pagingView) {
        _pagingView = [[JXPagerView alloc] initWithDelegate:self];
//        _pagingView.frame = self.view.bounds;
        _pagingView.frame = CGRectMake(0.0, 64.0, kWidth, kHeight);
        _pagingView.pinSectionHeaderVerticalOffset = 100.0;
    }
    return _pagingView;
}

@end
