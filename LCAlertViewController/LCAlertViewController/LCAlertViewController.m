//
//  LCAlertViewController.m
//  LCAlertViewController
//
//  Created by 罗川 on 2018/10/27.
//  Copyright © 2018年 罗川. All rights reserved.
//

#import "LCAlertViewController.h"
@interface LCAlertViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic) LCAlertViewControllerStyle flagStyle;
@property (nonatomic, copy) PickerViewDidSelectedBlcok pickerViewblock;
@property (nonatomic, strong) NSArray *pickViewDataArray;
@end

@implementation LCAlertViewController
#pragma mark -----PickerView----Begain--
+ (LCAlertViewController *)LC_alertControllerWithTitle:(NSString *)title dataArray:(NSArray *)array preferredStyle:(LCAlertViewControllerStyle)style{
    
    LCAlertViewController * alertVC;
    if (style==LCAlertViewControllerStyleAlert) {
        alertVC = [LCAlertViewController alertControllerWithTitle:title message:@"\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    }else{
        alertVC = [LCAlertViewController alertControllerWithTitle:title message:@"\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    }
    alertVC.flagStyle = style;
    alertVC.pickViewDataArray = [NSArray arrayWithArray:array];
    [alertVC setUpPickerView];
    return alertVC;
    
}
- (void)setUpPickerView{
    self.pickerView = [[UIPickerView alloc]init];
    if (self.flagStyle == LCAlertViewControllerStyleAlert) {
        self.pickerView.frame = CGRectMake(0, 45, 270, 140);
    }else{
        if (@available(iOS 12.0, *)) {
            self.pickerView.frame = CGRectMake(0, 30, self.view.frame.size.width-16, 140);
        }else{
            self.pickerView.frame = CGRectMake(0, 30, self.view.frame.size.width-20, 140);
        }
    }
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pickerView];
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return self.pickViewDataArray.count;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSArray * rowArray = (NSArray *)self.pickViewDataArray[component];
    return rowArray.count;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 35.0f;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.pickViewDataArray[component][row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    
    UILabel *label = (UILabel *)view;
    
    if (label == nil) {
        
        label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:17.0f];
        label.textColor = [UIColor blackColor];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        
    }
    label.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (_pickerViewblock) {
        _pickerViewblock( component, row);
    }
}

- (void)LC_addAction:(UIAlertAction *)action withPickerBlock:(PickerViewDidSelectedBlcok)block{
    if (block) {
        _pickerViewblock = block;
    }
    
    [self addAction:action];
}
#pragma mark -----PickerView----end--
#pragma mark -----customView----begain--
+ (LCAlertViewController *)LC_alertControllerWithTitle:(NSString *)title customView:(UIView *)view preferredStyle:(LCAlertViewControllerStyle)style customWidth:(FixedWidthBlcok)block{
    
    LCAlertViewController * alertVC;
    NSString * message = [NSMutableString string];
    if (style==LCAlertViewControllerStyleAlert) {
        int count;
        count =(int)view.frame.size.height/17.2;
        for (NSInteger i=0; i<count; i++) {
            message = [message stringByAppendingString:@"\n"];
        }
        alertVC = [LCAlertViewController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        block(270.f);
    }else{
        int count;
        count =(int)(view.frame.size.height)/20;
        for (NSInteger i=0; i<count; i++) {
            message = [message stringByAppendingString:@"\n"];
        }
        alertVC = [LCAlertViewController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        if (@available(iOS 12.0, *)) {
            block(alertVC.view.frame.size.width-16);
        }else{
            block(alertVC.view.frame.size.width-20);
        }
    }
    
    alertVC.flagStyle = style;
    [alertVC setUpCustomView:view title:title];
    
    return alertVC;
    
}

- (void)setUpCustomView:(UIView *)view title:(NSString *)title{
    if (!view) {
        return;
    }
    if (self.flagStyle == LCAlertViewControllerStyleAlert) {
        if (title.length>0) {
            view.frame = CGRectMake(0, 45, 270, view.frame.size.height);
        }else{
            view.frame = CGRectMake(0, 0, 270, view.frame.size.height);
        }
        
    }else{
        if (title.length>0) {
            if (@available(iOS 12.0, *)) {
                view.frame = CGRectMake(0, 40, self.view.frame.size.width-16, view.frame.size.height);//view.frame.size.height
            }else{
                view.frame = CGRectMake(0, 40, self.view.frame.size.width-20, view.frame.size.height);
            }
        }else{
            if (@available(iOS 12.0, *)) {
                view.frame = CGRectMake(0, 0, self.view.frame.size.width-16, view.frame.size.height);//view.frame.size.height
            }else{
                view.frame = CGRectMake(0, 0, self.view.frame.size.width-20, view.frame.size.height);
            }
        }
        
    }
    
    [self.view addSubview:view];

}

- (void)LC_addAction:(UIAlertAction *)action withCustomBlock:(CustomViewCallBackBlcok)block{
    if (block) {
        self.callBackBlock = block;
    }
    [self addAction:action];
}
#pragma mark -----customView----end--


@end
