//
//  ThreeViewController.m
//  Tools
//
//  Created by ywang on 2021/6/21.
//

#import "ThreeViewController.h"
#import "testViewController.h"

#import "HMSegmentedControl.h"
#import "HMSegementController.h"
#import "JXCategoryView.h"



@interface ThreeViewController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) HMSegmentedControl *topBarControl;
@property (nonatomic, strong) HMSegementController *topBarController;
@property (nonatomic, strong) JXCategoryTitleView *segment2View;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *vcs;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"第一", @"第二", @"第第第第第第第第第第第三", @"第四", @"第五"];
    self.titles = @[@"第一", @"第二"];
    self.vcs = [NSMutableArray array];

    for (NSInteger i = 0; i < self.titles.count; i++) {
        [self.vcs addObject:[testViewController class]];
    }
    
    [self.view setBackgroundColor:[UIColor grayColor]];
//    [self.view addSubview:self.topBarControl];
//    [self.topBarController setSegementIndex:0 animated:YES];
    [self.view addSubview:self.segment2View];
    [self.view addSubview:self.listContainerView];
    self.segment2View.listContainer = self.listContainerView;
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.segment2View.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // 离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}


- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%ld", index);
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    testViewController *vc = [[testViewController alloc] init];
    NSString *str = [NSString stringWithFormat:@"第%ld个", index + 1];
    vc.str = str;
    NSLog(@"%@", str);
    return vc;
}

#pragma mark - Lazy Load

- (HMSegmentedControl *)topBarControl {
    if (!_topBarControl) {
        _topBarControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.titles];
        _topBarControl.frame = CGRectMake(0.0, 88.0, 375, 66.0);
        _topBarControl.backgroundColor = [UIColor orangeColor];
//        _topBarControl.selectionIndicatorHeight = 3.0;
        _topBarControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
        _topBarControl.font = [UIFont systemFontOfSize:32.0];
        
        _topBarControl.textColor = [UIColor blackColor];
        _topBarControl.selectedTextColor = [UIColor redColor];
//        _topBarControl.selectionIndicatorColor = [UIColor blueColor];
        
        _topBarControl.indexChangeBlock = ^(NSInteger index) {
//            [wSelf handleTableDataWithType:index];
            NSLog(@"%ld", (long)index);
        };
    }
    return _topBarControl;
}

- (HMSegementController *)topBarController {
    if (!_topBarController) {
        _topBarController = [[HMSegementController alloc] initWithSegementControl:self.topBarControl segementControllerFrame:CGRectMake(0.0, 44.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44.0) childSegementControllClasses:self.vcs childControllersCompletedAddedBlock:^(NSArray *childControllers) {
            for (NSInteger i = 0; i < childControllers.count; i++) {
                
            }
        }];
    }
    return _topBarController;
}

- (JXCategoryTitleView *)segment2View {
    if (!_segment2View) {
        _segment2View = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.topBarControl.frame) + 20.0, 300, 44.0)];
        _segment2View.backgroundColor = [UIColor orangeColor];
        _segment2View.delegate = self;
        _segment2View.titles = self.titles;
        _segment2View.titleColorGradientEnabled = YES;
        _segment2View.titleFont = [UIFont boldSystemFontOfSize:17.0];
        _segment2View.titleSelectedFont = [UIFont boldSystemFontOfSize:20.0];
        _segment2View.titleColor = [UIColor whiteColor];
        _segment2View.titleSelectedColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        _segment2View.averageCellSpacingEnabled = NO;
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        // 设置指示器固定宽度
        lineView.indicatorWidth = 20;
        _segment2View.indicators = @[lineView];
    }
    return _segment2View;
}

- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        _listContainerView.frame = CGRectMake(0.0, CGRectGetMaxY(self.segment2View.frame) + 20.0, kWidth, 400.0);
    }
    return _listContainerView;
}

@end
