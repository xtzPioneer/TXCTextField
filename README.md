# TXCTextField
* 只需简单操作即可监听TextField输入,监听第一响应事件,改变描述颜色以及对齐方式等功能。
### 版本更新说明
* 重构项目结构
* 新增光标起始位置
* 系统高度保持一致
### cocoapods集成
* pod 'TXCTextField', '~> 0.0.2'
### 代码片段
```objc
/*TextField改变*/
typedef void (^TXTextFieldDidChange)(TXCTextField * textField);
/*第一响应*/
typedef BOOL (^TXFirstResponder)(TXCTextField * textField);
/*描述Alignment*/
typedef NS_ENUM(NSInteger,TXPlaceholderAlignment){
    TXPlaceholderAlignmentLeft   = 0,//居左
    TXPlaceholderAlignmentCenter = 1,//居中
    TXPlaceholderAlignmentRight  = 2,//居右
};
@interface TXCTextField : UITextField
/*描述字体*/
@property (nonatomic,strong)UIFont  * placeholderFont;
/*描述颜色*/
@property (nonatomic,strong)UIColor * placeholderColor;
/*光标颜色*/
@property (nonatomic,strong)UIColor * cursorColor;
/*描述间距*/
@property (nonatomic,assign)CGFloat placeholderSpacing;
/*左侧文本填充宽度*/
@property (nonatomic,assign)CGFloat textFieldLeftPaddingWidth;
/*描述对齐方式*/
@property (nonatomic,assign)TXPlaceholderAlignment placeholderAlignment;
/*TextField改变*/
@property (nonatomic,copy)TXTextFieldDidChange  textFieldDidChange;
/*第一响应*/
@property (nonatomic,copy)TXFirstResponder firstResponderHandler;
```

### 使用方法
* 导入头文件 <TXCTextField.h>  直接使用TXCTextField...即可
```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    TXCTextField * textField=[[TXCTextField alloc]init];
    textField.frame=CGRectMake(40, 64, self.view.frame.size.width-40*2, 30);
    textField.layer.borderColor=[UIColor grayColor].CGColor;
    textField.layer.borderWidth=1;
    textField.layer.cornerRadius=15;
    textField.layer.masksToBounds=YES;
    textField.placeholder=@"描述";
    //光标颜色
    textField.cursorColor=[UIColor redColor];
    //描述字体
    textField.placeholderFont=[UIFont systemFontOfSize:13];
    //描述对齐方式
    textField.placeholderAlignment=TXPlaceholderAlignmentCenter;
    //左侧文本填充宽度
    textField.textFieldLeftPaddingWidth=10;
    //TextField改变
    textField.textFieldDidChange = ^(TXCTextField *textField) {
        NSLog(@"text:%@",textField.text);
    };
    //第一响应
    textField.firstResponderHandler = ^BOOL(TXCTextField *textField) {
        NSLog(@"第一响应");
        return YES;
    };
    [self.view addSubview:textField];

    // Do any additional setup after loading the view, typically from a nib.
}
```
