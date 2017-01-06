//
//  CustomCommonUIView.h
//  testDemo
//
//  Created by apple on 2017/1/4.
//  Copyright © 2017年 Fabius's Studio. All rights reserved.
//  Info:服务于CustomCommonUIView的数据集

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FZCommonUIViewUIEelmentType) {
    FZCommonUIViewUIEelmentTypeUILabel,
    FZCommonUIViewUIEelmentTypeUIButton,
    FZCommonUIViewUIEelmentTypeUITextField,
    FZCommonUIViewUIEelmentTypeUIView,
    FZCommonUIViewUIEelmentTypeUIImageView
};


@interface FZCommonUIViewElementData : NSObject

//控件的类型 UILabel,UIButton
@property (nonatomic)FZCommonUIViewUIEelmentType fzCommonUIViewElementDataType;
//控件的宽度 0 为自由宽度 非0 为固定宽度
@property (nonatomic)CGFloat fzCommonUIViewElementDataWidth;
//控件的高度 默认为0
@property (nonatomic)CGFloat fzCommonUIViewElementDataHeight;
//控件的text
@property (nonatomic,strong)NSString *fzCommonUIViewElementDataText;
//控件的bg ImageName
@property (nonatomic,strong)NSString *fzCommonUIViewElementDataImageName;
//控件字体大小
@property (nonatomic)UIFont *fzCommonUIViewElementDataFont;
//控件字体颜色
@property (nonatomic)UIColor *fzCommonUIViewElementDataTextColor;
//控件背景颜色
@property (nonatomic)UIColor *fzCommonUIViewElementDataBgColor;
//是否密码显示
@property (nonatomic)BOOL fzCommonUIViewElementDataSecureTextEntry;
//placeholder值
@property (nonatomic,strong)NSString *fzCommonUIViewElementDataPlaceholder;
//控件字体对齐方式
@property (nonatomic)NSTextAlignment fzCommonUIViewElementDataTextAlignment;
//button 的accessibilityIdentifier属性 可用于保存一临时数据
@property (nonatomic,strong)NSString *fzCommonUIViewElementDataAccessibilityIdentifier;
//button 的accessibilityLabel属性 可用于保存一临时数据
@property (nonatomic,strong)NSString *fzCommonUIViewElementDatAaccessibilityLabel;


//初始化对象
- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType;

- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType uiElementDataWidth:(float)uiElementDataWidth;

- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType uiElementDataWidth:(float)uiElementDataWidth uiElementDataHeight:(CGFloat)uiElementDataHeight;

@end

//
//  CustomCommonUIView.h
//  testDemo
//
//  Created by apple on 2017/1/4.
//  Copyright © 2017年 Fabius's Studio. All rights reserved.
//  Info:自定义UIView 用于构建UI

@protocol FZCommonUIViewDelegate

- (void)FZCommonUIViewDelegateUIButtonTouchUpInsideEvent:(id)sender;

@optional
//UITextfield的 delegate
//(void)FZCommonUIViewDelegateUIButtonTouchUpInsideEvent:(id)sender currentTextField:(UITextField*)currentTextField;

@end

@interface FZCommonUIView : UIView<UITextFieldDelegate>{

    UIViewController *_effectViewController;//所在ViewController对象

}


#pragma mark 属性
//leading    左边距 默认0.0
@property (nonatomic) CGFloat leading;
//Trailing   右边距 默认0.0
@property (nonatomic) CGFloat trailing;
//viewTag    默认0
@property (nonatomic) NSInteger viewTag;
//delegate
@property (nonatomic,weak) id<FZCommonUIViewDelegate>delegate;
#pragma mark 方法
//初始化
- (id)initWithFrame:(CGRect)frame effectObject:(id)effectObject;
//构建UI
- (void)buildViewUIElement:(NSArray*)elementArray;
//构建UI 平均控件的width 和 间距
- (void)buildViewAverageUIElement:(NSArray*)elementArray  uiElementWidth:(CGFloat)uiElementWidth;

@end
