//
//  TableViewController.m
//  LCAlertViewController
//
//  Created by 罗川 on 2018/10/27.
//  Copyright © 2018年 罗川. All rights reserved.
//

#import "TableViewController.h"
#import "LCAlertViewController.h"
@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
{
    LCAlertViewController * alertVC;
}
@property (nonatomic, strong)NSArray* tableDataArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableDataArray = @[@"UIPickerView,ArrayCount 1,Type:Alert",
                            @"UIPickerView,ArrayCount 1,Type:ActionSheet",
                            @"UIPickerView,ArrayCount 3 or more,Type:Alert",
                            @"UIPickerView,ArrayCount 3 or more,Type:ActionSheet",
                            @"UIView:imageView 坐标设置,修改代码",
                            @"UIView:textView 坐标设置,修改代码"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tableDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"strId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strId];
    }
    cell.textLabel.text = self.tableDataArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [self alertPickerViewWithOneDataSource:@"alert"];
    }else if (indexPath.row==1){
        
        [self alertPickerViewWithOneDataSource:@"actionSheet"];
    }else if (indexPath.row==2){
        
        [self alertPickerViewWithManyDataSource:@"alert"];
    }else if (indexPath.row==3){
        
        [self alertPickerViewWithManyDataSource:@"actionSheet"];
    }else if (indexPath.row==4){
        [self alertCustomView];
        
    }else if (indexPath.row==5){
        
        [self alertCustomViewTextView];
    }
    
    
}
- (void)alertPickerViewWithOneDataSource:(NSString *)type{
    NSArray * array1 = @[@"a1",@"b1",@"c1",@"d1",@"e1",@"f1"];
    NSArray * dataArray = @[array1];
    if ([type isEqualToString:@"alert"]) {
        alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"Attention" dataArray:dataArray preferredStyle:LCAlertViewControllerStyleAlert];
    }else if ([type isEqualToString:@"actionSheet"]){
        alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"Attention" dataArray:dataArray preferredStyle:LCAlertViewControllerStyleActionSheet];
    }
    
    [alertVC.pickerView selectRow:3 inComponent:0 animated:NO];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC LC_addAction:okAction withPickerBlock:^(NSInteger component, NSInteger row) {
        NSLog(@"-----选中了------%ld----%ld",(long)component,(long)row);
    }];
    [alertVC LC_addAction:cancelAction withPickerBlock:^(NSInteger component, NSInteger row) {
        NSLog(@"-----选中了------%ld----%ld",(long)component,(long)row);
    }];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

- (void)alertPickerViewWithManyDataSource:(NSString *)type{
    NSArray * array1 = @[@"a1",@"b1",@"c1",@"d1",@"e1",@"f1"];
    NSArray * array2 = @[@"a2",@"b2",@"c2",@"d2",@"e2",@"f2"];
    NSArray * array3 = @[@"a3",@"b3",@"c3",@"d3",@"e3",@"f3"];
    NSArray * dataArray = @[array1,array2,array3];
    
    if ([type isEqualToString:@"alert"]) {
        alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"Attention" dataArray:dataArray preferredStyle:LCAlertViewControllerStyleAlert];
    }else if ([type isEqualToString:@"actionSheet"]){
        alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"Attention" dataArray:dataArray preferredStyle:LCAlertViewControllerStyleActionSheet];
    }
    
    
    [alertVC.pickerView selectRow:3 inComponent:0 animated:NO];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC LC_addAction:okAction withPickerBlock:^(NSInteger component, NSInteger row) {
        NSLog(@"-----选中了------%ld----%ld",(long)component,(long)row);
    }];
    [alertVC LC_addAction:cancelAction withPickerBlock:^(NSInteger component, NSInteger row) {
        NSLog(@"-----选中了------%ld----%ld",(long)component,(long)row);
    }];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
}

- (void)alertCustomView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height-16, 300)];
    view.backgroundColor = [UIColor clearColor];
    UIImageView * imageView =[[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 100, 100)];
    imageView.image =[UIImage imageNamed:@"example1"];
    [view addSubview:imageView];
    
    UILabel * lable =[[UILabel alloc]initWithFrame:CGRectMake(120, 16, self.view.frame.size.width-20-120, 100)];
    lable.text = @"入秋啦, 注意保暖, 有空的话,一起来日本看红叶哈,世界之大,一定要出去旅游,不想回首一生的成就,就是30年的房贷";
    lable.numberOfLines = 0;
    lable.textColor =[UIColor lightGrayColor];
    lable.backgroundColor= [UIColor clearColor];
    lable.lineBreakMode= NSLineBreakByCharWrapping;
    [view addSubview:lable];
    
    UIImageView * imageView2 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 120, 350, 184)];

    imageView2.image =[UIImage imageNamed:@"example2"];
    [imageView2 setContentMode:UIViewContentModeScaleAspectFit];
    [view addSubview:imageView2];
    
    alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"" customView:view preferredStyle:LCAlertViewControllerStyleActionSheet customWidth:^(CGFloat customViewWidth) {
        NSLog(@"--Attention:-AlertView's width is Fixed by system----%lf",customViewWidth);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC LC_addAction:okAction withCustomBlock:^(NSString *callBackString) {
        
    }];
    [alertVC LC_addAction:cancelAction withCustomBlock:^(NSString *callBackString) {
        
    }];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
    
    
}
- (void)alertCustomViewTextView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 270, 100)];
    view.backgroundColor = [UIColor clearColor];
    
    UITextView *textView =[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 270, 100)];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.text =@"我已经26啦, 我还单身,连女孩子的手都没摸过, 我该怎么办, 我现在慌得的一逼. 看到这句话的,不给我点个星, 祝你永远都是单身贵族......";
    textView.delegate= self;
    [textView becomeFirstResponder];
    [view addSubview:textView];
    
    
    alertVC = [LCAlertViewController LC_alertControllerWithTitle:@"Alert" customView:view preferredStyle:LCAlertViewControllerStyleAlert customWidth:^(CGFloat customViewWidth) {
        NSLog(@"--Attention:-AlertView's width is Fixed by system----%lf",customViewWidth);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC LC_addAction:okAction withCustomBlock:^(NSString *callBackString) {
        NSLog(@"---OK---%@",callBackString);
        [self.view endEditing:YES];
    }];
    [alertVC LC_addAction:cancelAction withCustomBlock:^(NSString *callBackString) {
        
        [self.view endEditing:YES];
    }];
    [self presentViewController:alertVC animated:YES completion:^{
        
    }];
    
    
}

@end
