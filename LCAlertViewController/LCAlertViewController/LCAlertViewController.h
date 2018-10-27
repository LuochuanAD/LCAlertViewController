//
//  LCAlertViewController.h
//  LCAlertViewController
//
//  Created by 罗川 on 2018/10/27.
//  Copyright © 2018年 罗川. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LCAlertViewControllerStyle) {
    LCAlertViewControllerStyleAlert,
    LCAlertViewControllerStyleActionSheet
};


@interface LCAlertViewController : UIAlertController

typedef void(^PickerViewDidSelectedBlcok) (NSInteger component, NSInteger row);
@property (nonatomic, strong) UIPickerView * pickerView;
/**
 *  UIPickerView 与 UIAlertViewController 结合
 *
 *  @param title alertViewController's title
 *
 *  @param array pickerView's dataSources
 *
 *  @param style alertViewController's style
 */
+ (LCAlertViewController *)LC_alertControllerWithTitle:(NSString *)title dataArray:(NSArray *)array preferredStyle:(LCAlertViewControllerStyle)style;

- (void)LC_addAction:(UIAlertAction *)action withPickerBlock:(PickerViewDidSelectedBlcok)block;

/**********************************************************************************/

typedef void(^CustomViewCallBackBlcok) (NSString * callBackString);
typedef void(^FixedWidthBlcok) (CGFloat customViewWidth);
@property (nonatomic, copy) CustomViewCallBackBlcok callBackBlock;
/**
 *  自定义View 警告 此处的view的坐标高度是 用空格的多少代替.  坐标在实际项目中需要仔细调整
 *  CustomViewCallBackBlcok 的作用 看实际的需求
 *
 *  @param title alertViewController's title
 *
 *  @param view  customView
 *
 *  @param style alertViewController's style
 *
 *  @param block 返回的是系统固定 alertViewController的宽度
 */
+ (LCAlertViewController *)LC_alertControllerWithTitle:(NSString *)title customView:(UIView *)view preferredStyle:(LCAlertViewControllerStyle)style customWidth:(FixedWidthBlcok)block;

- (void)LC_addAction:(UIAlertAction *)action withCustomBlock:(CustomViewCallBackBlcok)block;



@end
