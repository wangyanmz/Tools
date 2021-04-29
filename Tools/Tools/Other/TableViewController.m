//
//  TableViewController.m
//  Tools
//
//  Created by wangyan on 2021/4/28.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = @[@{@"name" : @"测试", @"class" : @"ViewController"},
                  @{@"name" : @"验证码输入框", @"class" : @"OneViewController"},
                  @{@"name" : @"性别选择器", @"class" : @"TwoViewController"},
                  @{@"name" : @"时间选择器", @"class" : @"TwoViewController"},];
    
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *dict = self.data[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = self.data[indexPath.row];
    Class class = NSClassFromString(dict[@"class"]);
    UIViewController *vc = class.new;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
