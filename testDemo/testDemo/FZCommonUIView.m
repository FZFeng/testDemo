#import "FZCommonUIView.h"

@implementation FZCommonUIViewElementData

#pragma mark 初始化默认属性值
- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType{
    self=[super init];
    if (self) {
        [self initDefaultValue];
        self.fzCommonUIViewElementDataType=uiElementDataType;
    }
    return self;
}

- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType uiElementDataWidth:(float)uiElementDataWidth{
    self=[super init];
    if (self) {
        [self initDefaultValue];
        self.fzCommonUIViewElementDataType=uiElementDataType;
        self.fzCommonUIViewElementDataWidth=uiElementDataWidth;
    }
    return self;
}


- (id)initWithUIEelementDataType:(FZCommonUIViewUIEelmentType)uiElementDataType uiElementDataWidth:(float)uiElementDataWidth uiElementDataHeight:(CGFloat)uiElementDataHeight{
    if (self) {
        [self initDefaultValue];
        self.fzCommonUIViewElementDataType=uiElementDataType;
        self.fzCommonUIViewElementDataWidth=uiElementDataWidth;
        self.fzCommonUIViewElementDataHeight=uiElementDataHeight;
    }
    return self;
}

- (void)initDefaultValue{
    self.fzCommonUIViewElementDataWidth=0.0;
    self.fzCommonUIViewElementDataImageName=@"";
    self.fzCommonUIViewElementDataHeight=0.0;
    self.fzCommonUIViewElementDataText=@"";
    self.fzCommonUIViewElementDataFont=[UIFont systemFontOfSize:16.0];
    self.fzCommonUIViewElementDataTextColor=[UIColor darkGrayColor];
    self.fzCommonUIViewElementDataBgColor=[UIColor clearColor];
    self.fzCommonUIViewElementDataSecureTextEntry=NO;
    self.fzCommonUIViewElementDataPlaceholder=@"";
    self.fzCommonUIViewElementDataTextAlignment=NSTextAlignmentCenter;
    self.fzCommonUIViewElementDataAccessibilityIdentifier=@"";
    self.fzCommonUIViewElementDatAaccessibilityLabel=@"";
}


@end

@implementation FZCommonUIView

#pragma mark 初始化默认值
- (id)initWithFrame:(CGRect)frame effectObject:(id)effectObject{
    self = [super initWithFrame:frame];
    if (self) {
        self.leading=0.0;
        self.trailing=0.0;
        self.viewTag=0;
        self.delegate=effectObject;
        _effectViewController=effectObject;
    }
    return self;
}

#pragma mark 构建UI
//初始化UI
- (void)buildViewUIElement:(NSArray*)elementArray{
    
    if (!elementArray || elementArray.count==0) {
        return;
    }
    
    float selfWidth=CGRectGetWidth(self.frame);  //view的宽度
    float selfHeight=CGRectGetHeight(self.frame);//view的高度
    float unFixUIWidth=0.0;                      //非固定ui的宽度
    float fixUITotalWidth=0.0;                   //固定ui的总宽度
    float currentOriginX=self.leading;
    float currentOriginY=0.0;
    
    
    for (FZCommonUIViewElementData *currentData in elementArray) {
        fixUITotalWidth=fixUITotalWidth+currentData.fzCommonUIViewElementDataWidth;
    }
    unFixUIWidth=selfWidth-fixUITotalWidth-self.leading-self.trailing;
    
    for (int i=0; i<=elementArray.count-1; i++) {
        FZCommonUIViewElementData *currentElementData=[elementArray objectAtIndex:i];
        float currentUIWidth=currentElementData.fzCommonUIViewElementDataWidth;
        float currentUIHeight=currentElementData.fzCommonUIViewElementDataHeight;
        
        if (currentUIWidth==0.0) {
            currentUIWidth=unFixUIWidth;
        }
        
        if (currentUIHeight==0.0) {
            currentUIHeight=selfHeight;
        }
        currentOriginY=(selfHeight-currentUIHeight)/2.0;
        
        
        switch (currentElementData.fzCommonUIViewElementDataType) {
            case FZCommonUIViewUIEelmentTypeUILabel:{
                //UILabel
                UILabel *objectUI=[[UILabel alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX, currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.text=currentElementData.fzCommonUIViewElementDataText;
                objectUI.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.textColor=currentElementData.fzCommonUIViewElementDataTextColor;
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                objectUI.textAlignment=currentElementData.fzCommonUIViewElementDataTextAlignment;
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
                [self addSubview:objectUI];
                break;
            }case FZCommonUIViewUIEelmentTypeUITextField:{
                //UITextField
                UITextField *objectUI=[[UITextField alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX, currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.text=currentElementData.fzCommonUIViewElementDataText;
                objectUI.textColor=currentElementData.fzCommonUIViewElementDataTextColor;
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;;
                objectUI.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.secureTextEntry=currentElementData.fzCommonUIViewElementDataSecureTextEntry;
                objectUI.placeholder=currentElementData.fzCommonUIViewElementDataPlaceholder;
                objectUI.clearButtonMode=UITextFieldViewModeWhileEditing;
                objectUI.delegate=self;
                [self addSubview:objectUI];
                
                break;
            }case FZCommonUIViewUIEelmentTypeUIButton:{
                //UIButton
                UIButton *objectUI=[[UIButton alloc] init];
                NSString *imageNameString=currentElementData.fzCommonUIViewElementDataImageName;
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.titleLabel.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.accessibilityIdentifier=currentElementData.fzCommonUIViewElementDataAccessibilityIdentifier;
                objectUI.accessibilityLabel=currentElementData.fzCommonUIViewElementDatAaccessibilityLabel;
                [objectUI setTitle:currentElementData.fzCommonUIViewElementDataText forState:UIControlStateNormal];
                [objectUI setTitleColor:currentElementData.fzCommonUIViewElementDataTextColor forState:UIControlStateNormal];
                //bg
                if (![imageNameString isEqualToString:@""]) {
                    [objectUI setImage:[UIImage imageNamed:imageNameString] forState:UIControlStateNormal];
                }else{
                    objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                }
                //event
                [objectUI addTarget:self action:@selector(didUIButtonTouchUpInsideEvent:) forControlEvents:UIControlEventTouchUpInside];
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }

                [self addSubview:objectUI];
                
                break;
            }case FZCommonUIViewUIEelmentTypeUIView:{
                //UIView
                UIView *objectUI=[[UIView alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }

                [self addSubview:objectUI];

                break;
            }case FZCommonUIViewUIEelmentTypeUIImageView:{
                //UIImageView
                UIImageView *objectUI=[[UIImageView alloc] init];
                NSString *imageNameString=currentElementData.fzCommonUIViewElementDataImageName;
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                if (![imageNameString isEqualToString:@""]) {
                    objectUI.image=[UIImage imageNamed:imageNameString];
                }
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
               
                [self addSubview:objectUI];

                break;
            }
        }
        currentOriginX=currentOriginX+currentUIWidth;
    }
}

//初始化UI 是否平均控件的width 和 间距
- (void)buildViewAverageUIElement:(NSArray*)elementArray  uiElementWidth:(CGFloat)uiElementWidth{
    
    if (!elementArray || elementArray.count==0) {
        return;
    }
    
    float selfWidth=CGRectGetWidth(self.frame);  //view的宽度
    float selfHeight=CGRectGetHeight(self.frame);//view的高度
    //控件的间距
    float uiDistance=(selfWidth-uiElementWidth*elementArray.count)/(elementArray.count+1);
    float currentOriginX=0.0;
    float currentOriginY=0.0;
    float currentUIWidth=uiElementWidth;
    
    for (int i=0; i<=elementArray.count-1; i++) {
        FZCommonUIViewElementData *currentElementData=[elementArray objectAtIndex:i];
        float currentUIHeight=currentElementData.fzCommonUIViewElementDataHeight;
        
        currentOriginX=uiDistance*(i+1)+currentUIWidth*i;
        
        if (currentUIHeight==0.0) {
            currentUIHeight=selfHeight;
        }
        currentOriginY=(selfHeight-currentUIHeight)/2.0;
        
        switch (currentElementData.fzCommonUIViewElementDataType) {
            case FZCommonUIViewUIEelmentTypeUILabel:{
                //UILabel
                UILabel *objectUI=[[UILabel alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX, currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.text=currentElementData.fzCommonUIViewElementDataText;
                objectUI.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.textColor=currentElementData.fzCommonUIViewElementDataTextColor;
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                objectUI.textAlignment=currentElementData.fzCommonUIViewElementDataTextAlignment;
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
                [self addSubview:objectUI];
                break;
            }case FZCommonUIViewUIEelmentTypeUITextField:{
                //UITextField
                UITextField *objectUI=[[UITextField alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX, currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.text=currentElementData.fzCommonUIViewElementDataText;
                objectUI.textColor=currentElementData.fzCommonUIViewElementDataTextColor;
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;;
                objectUI.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.secureTextEntry=currentElementData.fzCommonUIViewElementDataSecureTextEntry;
                objectUI.placeholder=currentElementData.fzCommonUIViewElementDataPlaceholder;
                objectUI.clearButtonMode=UITextFieldViewModeWhileEditing;
                objectUI.delegate=self;
                [self addSubview:objectUI];
                
                break;
            }case FZCommonUIViewUIEelmentTypeUIButton:{
                //UIButton
                UIButton *objectUI=[[UIButton alloc] init];
                NSString *imageNameString=currentElementData.fzCommonUIViewElementDataImageName;
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.titleLabel.font=currentElementData.fzCommonUIViewElementDataFont;
                objectUI.accessibilityIdentifier=currentElementData.fzCommonUIViewElementDataAccessibilityIdentifier;
                objectUI.accessibilityLabel=currentElementData.fzCommonUIViewElementDatAaccessibilityLabel;
                [objectUI setTitle:currentElementData.fzCommonUIViewElementDataText forState:UIControlStateNormal];
                [objectUI setTitleColor:currentElementData.fzCommonUIViewElementDataTextColor forState:UIControlStateNormal];
                //bg
                if (![imageNameString isEqualToString:@""]) {
                    [objectUI setImage:[UIImage imageNamed:imageNameString] forState:UIControlStateNormal];
                }else{
                    objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                }
                //event
                [objectUI addTarget:self action:@selector(didUIButtonTouchUpInsideEvent:) forControlEvents:UIControlEventTouchUpInside];
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
                [self addSubview:objectUI];
                
                break;
            }case FZCommonUIViewUIEelmentTypeUIView:{
                //UIView
                UIView *objectUI=[[UIView alloc] init];
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                objectUI.backgroundColor=currentElementData.fzCommonUIViewElementDataBgColor;
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
                
                [self addSubview:objectUI];
                
                break;
            }case FZCommonUIViewUIEelmentTypeUIImageView:{
                //UIImageView
                UIImageView *objectUI=[[UIImageView alloc] init];
                NSString *imageNameString=currentElementData.fzCommonUIViewElementDataImageName;
                
                objectUI.frame=CGRectMake(currentOriginX,currentOriginY, currentUIWidth, currentUIHeight);
                if (![imageNameString isEqualToString:@""]) {
                    objectUI.image=[UIImage imageNamed:imageNameString];
                }
                if (self.viewTag>0) {
                    objectUI.tag=self.viewTag+i;
                }
                
                [self addSubview:objectUI];
                
                break;
            }
        }
        
    }

}

#pragma mark 处理delegate
//处理UIButton 事件
- (void)didUIButtonTouchUpInsideEvent:(id)sender{
    [self.delegate FZCommonUIViewDelegateUIButtonTouchUpInsideEvent:sender];
}

#pragma mark UITextfield delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //显示键盘
    
    if ([textField.accessibilityLabel isEqualToString:@"yes"]) {
        textField.accessibilityLabel=@"";
        return [textField resignFirstResponder];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //隐藏键盘
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    textField.accessibilityLabel=@"";
    
    CGFloat width =CGRectGetWidth(_effectViewController.view.frame);
    CGFloat height =CGRectGetHeight(_effectViewController.view.frame);
    
    CGRect rect=CGRectMake(0.0,0.0,width,height);
    _effectViewController.view.frame=rect;
    
    
    [self layoutIfNeeded];

    
    return textField.resignFirstResponder;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //隐藏键盘
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardDidHideNotification object:nil];
    textField.accessibilityLabel=@"yes";
    [textField resignFirstResponder];
    
    
    //[[[UIApplication sharedApplication] keyWindow] resignFirstResponder];
    
    //[self endEditing:YES];
    
    CGFloat width =CGRectGetWidth(_effectViewController.view.frame);
    CGFloat height =CGRectGetHeight(_effectViewController.view.frame);
    
    CGRect rect=CGRectMake(0.0,0.0,width,height);
    _effectViewController.view.frame=rect;
}

- (void)keyBoardWillShow:(NSNotification *)note{
    
    NSDictionary *userInfo = [note userInfo];
    NSValue *value = [userInfo objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
    //键盘高度
    CGFloat keyboardHeight = value.CGRectValue.size.height;
    //键盘显示动画时长
    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    //键盘显示动画方式
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [UIView animateWithDuration:[duration floatValue] animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        
        CGFloat width =CGRectGetWidth(_effectViewController.view.frame);
        CGFloat height =CGRectGetHeight(_effectViewController.view.frame);
        //提升的高度 多加gapDistance 的距离
        CGFloat gapDistance=5.0;
        CGFloat liftingDistance=(height-keyboardHeight)-(self.frame.origin.y+CGRectGetHeight(self.frame)+gapDistance);
        
        if (liftingDistance>0.0) {
            liftingDistance=0.0;
        }
        
        CGRect rect=CGRectMake(0.0,liftingDistance,width,height);
        _effectViewController.view.frame=rect;
        
        [self layoutIfNeeded];
        
         [[NSNotificationCenter defaultCenter] removeObserver:self];
        
    }];
}

- (void)keyboardHide:(NSNotification *)note{
    
    NSDictionary *userInfo = [note userInfo];
    //键盘显示动画时长
    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    //键盘显示动画方式
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
//    [UIView animateWithDuration:[duration floatValue] animations:^{
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationCurve:[curve intValue]];
//        
//        CGFloat width =CGRectGetWidth(_effectViewController.view.frame);
//        CGFloat height =CGRectGetHeight(_effectViewController.view.frame);
//        
//        CGRect rect=CGRectMake(0.0,0.0,width,height);
//        _effectViewController.view.frame=rect;
//        
//        
//    }];
    
    CGFloat width =CGRectGetWidth(_effectViewController.view.frame);
    CGFloat height =CGRectGetHeight(_effectViewController.view.frame);
    
    CGRect rect=CGRectMake(0.0,0.0,width,height);
    _effectViewController.view.frame=rect;

    
    [self layoutIfNeeded];
    
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
