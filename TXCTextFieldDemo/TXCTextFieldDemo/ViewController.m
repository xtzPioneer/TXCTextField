//
//  ViewController.m
//  TXCTextFieldDemo
//
//  Created by komlin on 2017/11/8.
//  Copyright © 2017年 张雄. All rights reserved.
//

#import "ViewController.h"
#import "TXCTextField.h"
@interface ViewController ()

@end

@implementation ViewController

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
