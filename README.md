# LCAlertViewController

![image](https://raw.githubusercontent.com/LuochuanAD/LCAlertViewController/add-license-1/LCAlertViewController/demo.gif)


***

***一,说明***

***
支持iOS8及以上,LCAlertViewController将 UIPickerView和UIAlertViewController结合, 并且添加自定义的View 
blog地址:
[https://blog.csdn.net/luochuanAD/article/details/83450748](https://blog.csdn.net/luochuanAD/article/details/83450748 "https://blog.csdn.net/luochuanAD/article/details/83450748")
***
***二,UIPickerView 与UIAlertViewController结合***

***

```python
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


```
***

***三,UIView (:UIImageView,UILable......)与UIAlertViewController结合 ***

***
***
自定义view的加载 是计算了 添加空格的多少. 所以坐标不准确. 但在实际项目中,只要仔细调整一下位置, 都是可以呈现出完美效果的.
***
```python
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

```
***

***注意: ***

***
***
由于使用的是系统的样式与动画效果, 那么LCAlertViewController的宽度和系统的保持相等
LCAlertViewControllerStyleAlert : 
宽度为 270;

LCAlertViewControllerStyleActionSheet:
iOS12.x版本 宽度为self.view.frame.size.width-16
iOS12.0以下 宽度为self.view.frame.size.width-20
***


