//
//  ViewController.m
//  testDemo
//
//  Created by apple on 15/12/23.
//  Copyright © 2015年 Fabius's Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate,FZCommonUIViewDelegate>{
    UILabel *_lblTitle;
    UIButton *_btnOK;
    UITextField *_txtName;
    UIScrollView *_scrolView;
    
    NSURLSessionDownloadTask *_downloadTask;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    //btnSetImage.backgroundColor = [UIColor redColor];
    btnSetImage.imageView.frame = btnSetImage.bounds;
    btnSetImage.hidden = NO;
    btnSetImage.imageView.image = [UIImage imageNamed:@"test"];
    

    [self functionTestA];
    
}

- (void)functionTestA{

}


- (void)functionTestB{
    
    NSLog(@"functionTestB");
    [NSThread sleepForTimeInterval:10.0f];
}

- (void)functionTestC{
    NSLog(@"functionTestC");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//属性
//1.viewHeight 默认40
//2.leading    左边距 默认0
//3.Trailing   右边距 默认0
//4.belongView  所属View



- (IBAction)didBtnRun:(id)sender {
    
    //构建属性数据
    FZCommonUIViewElementData *addButtonElementData1=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUITextField ];
    addButtonElementData1.fzCommonUIViewElementDataText=@"确定";
    addButtonElementData1.fzCommonUIViewElementDataTextColor=[UIColor whiteColor];
    addButtonElementData1.fzCommonUIViewElementDataBgColor=[UIColor orangeColor];
    
    FZCommonUIViewElementData *reduceButtonElementData1=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUITextField];
    reduceButtonElementData1.fzCommonUIViewElementDataText=@"取消";
    reduceButtonElementData1.fzCommonUIViewElementDataTextColor=[UIColor whiteColor];
    
    NSArray *uiElementArray=[[NSArray alloc] initWithObjects:addButtonElementData1,reduceButtonElementData1,nil];
    //创建UI
    FZCommonUIView *buttonCustomView=[[FZCommonUIView alloc] initWithFrame:CGRectMake(0, 500, self.view.frame.size.width,35) effectObject:self];
    [buttonCustomView buildViewAverageUIElement:uiElementArray uiElementWidth:85.0];
    [self.view addSubview:buttonCustomView];

    
   
    NSInteger nameLabelWidth=85;
    NSInteger numLabelWidth=30.0;
    NSInteger reduceButtonWidth=40.0;

    //name
    FZCommonUIViewElementData *nameLabelElementData=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUILabel uiElementDataWidth:nameLabelWidth];
    nameLabelElementData.fzCommonUIViewElementDataBgColor=[UIColor blueColor];
    nameLabelElementData.fzCommonUIViewElementDataText=@"nameLabel";
   
    //price
    FZCommonUIViewElementData *priceLabelElementData=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUILabel uiElementDataWidth:0.0];
    priceLabelElementData.fzCommonUIViewElementDataBgColor=[UIColor orangeColor];
    priceLabelElementData.fzCommonUIViewElementDataText=@"nameLabel";
    
    //addbutton
    FZCommonUIViewElementData *addButtonElementData=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUIButton uiElementDataWidth:15.0];
    addButtonElementData.fzCommonUIViewElementDataImageName=@"list_btn_+_min.png";
    addButtonElementData.fzCommonUIViewElementDataHeight=15.0;
    
    //num
    FZCommonUIViewElementData *numLabelElementData=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUILabel uiElementDataWidth:numLabelWidth];
    numLabelElementData.fzCommonUIViewElementDataText=@"numLabel";
    
    //reduceButton
    FZCommonUIViewElementData *reduceButtonElementData=[[FZCommonUIViewElementData alloc] initWithUIEelementDataType:FZCommonUIViewUIEelmentTypeUIButton uiElementDataWidth:reduceButtonWidth];
    reduceButtonElementData.fzCommonUIViewElementDataImageName=@"list_btn_-_min.png";
    
    
    NSArray *uiElementArray1=[[NSArray alloc] initWithObjects:nameLabelElementData, priceLabelElementData,addButtonElementData,numLabelElementData,reduceButtonElementData,nil];
    
    FZCommonUIView *customView=[[FZCommonUIView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width,35) effectObject:self];
    customView.leading=15.0;
    customView.trailing=15.0;
    customView.viewTag=100;
    [customView buildViewUIElement:uiElementArray1];
    
    [self.view addSubview:customView];

    /*
    NSMutableArray *arryUserInfo=[[NSMutableArray alloc] init];
    
    //email
    NSString *sParaEmail=[NSString stringWithFormat:@"id=%@",@"1120537537"];
    [arryUserInfo addObject:sParaEmail];
    //groupName
    //NSString *sParaGroupName=[NSString stringWithFormat:@"Pvvd=%@",@"q12345"];
    //[arryUserInfo addObject:sParaGroupName];
    //mobiTel
    //NSString *sParaMobiTel=[NSString stringWithFormat:@"AType=%@",@"1"];
    //[arryUserInfo addObject:sParaMobiTel];
    
    
    [UIColor colorWithRed:0.269 green:1.000 blue:12.0 alpha:1.000];
    
    
    
    [FZNetworkHelper dataTaskWithUrl:@"http://itunes.apple.com/lookup" arryPara:arryUserInfo requestMethodType:requestMethodPost fatherObject:self bShowSuccessMsg:NO block:^(NSDictionary *returnData, BOOL bReturn) {
        if (bReturn) {
            //
        }
    }];
    
    return;
    
    //指定文件名
    //保存文件
    NSString *sExtension=@".jpg";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSString *sFileTitle=[NSString stringWithFormat:@"%@%@",currentDateStr,sExtension];
    NSString *sSaveUrl=[NSString stringWithFormat:@"%@%@",[PublicFunc GetSandBoxPathWithType:SandBoxPathTypeDocuments],sFileTitle];

    
    [FZNetworkHelper downTaskInBackgroundWithUrl:@"http://120.24.229.52:8090/api/HDFiles/Get?fileName=2.jpg"  arryPara:nil savePath:nil  block:^(NSString *sError) {
        if ([sError isEqualToString:@""]) {
           [PublicFunc ShowSimpleMsg:@"文件已下载!"];
        }else{
            [PublicFunc ShowSimpleMsg:@"文件下载失败!"];
        }
    }];
    
    return;
    
    NSString *urlStr=@"http://120.24.229.52:8090/api/HDFiles/Get?fileName=2.jpg";
    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    
    //后台会话
    _downloadTask=[[self backgroundSession] downloadTaskWithRequest:request];
    
    [_downloadTask resume];

    return;
    
    NSMutableArray *arrayPara=[[NSMutableArray alloc] init];
     */
    
    /*
    NSString *sID=@"ID=6";
    [arrayPara addObject:sID];
    
    
    NSString *sName=@"Name=小明";
    [arrayPara addObject:sName];
    
    NSString *sSex=@"Sex=男";
    [arrayPara addObject:sSex];
    
    NSString *sBirthday=@"Birthday=1991-02-01";
    [arrayPara addObject:sBirthday];
    
    NSString *sAge=@"Age=23";
    [arrayPara addObject:sAge];
     */

    
    /*
    [FZNetworkHelper dataTaskWithUrl:@"http://120.24.229.52:8090/api/HDFiles/Get" arryPara:[arrayPara copy] requestMethodType:requestMethodGet fatherObject:self bShowSuccessMsg:NO block:^(NSDictionary *returnData, BOOL bReturn) {
        if (bReturn) {
            NSArray *arrayResult=[returnData objectForKey:@"result"];
        }
    }];
     */
    
    //常见异常1---不存在方法引用
    
        //[self performSelector:@selector(thisMthodDoesNotExist) withObject:nil];
    
    //常见异常2---键值对引用nil
    
        //[[NSMutableDictionary dictionary] setObject:nil forKey:@"nil"];
    
    //常见异常3---数组越界
    
    //[[NSArray array] objectAtIndex:1];
    
    //常见异常4---memory warning 级别3以上
    
        //[self performSelector:@selector(killMemory) withObject:nil];
    
    //其他大家去想吧
    
}

- (void)FZCommonUIViewDelegateUIButtonTouchUpInsideEvent:(id)sender {

    UIButton *btnObject=sender;
    NSLog(@"%@",btnObject.accessibilityLabel);
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"test" message:@"msg" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"ttt" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"test" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //[alert show];

}

- (void) killMemory

{
    
    for (int i = 0; i < 300; i ++)
        
    {
        
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        
        tmpLabel.layer.masksToBounds = YES;
        
        tmpLabel.layer.cornerRadius = 10;
        
        tmpLabel.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:tmpLabel];
        
    }  
    
}


#pragma mark 下载文件
// - 下载任务代理
// 下载中(会多次调用，可以记录下载进度)
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    //    [NSThread sleepForTimeInterval:0.5];
    //    NSLog(@"%.2f",(double)totalBytesWritten/totalBytesExpectedToWrite);
}

// 下载完成
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSError *error;
    
    
    
    //保存文件
    NSString *sExtension=@"jpg";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSString *sFileTitle=[NSString stringWithFormat:@"%@.%@",currentDateStr,sExtension];
    NSURL *saveUrl=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",[PublicFunc GetSandBoxPathWithType:SandBoxPathLibrary ],sFileTitle]];
    [[NSFileManager defaultManager] copyItemAtURL:location toURL:saveUrl error:&error];
    
    if (error) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [PublicFunc ShowErrorHUD:@"文件下载失败"  view:self.view];
        }];
        
    }else{
        //记录plist数据
//        NSMutableArray *arrayInfo  = [[NSMutableArray  alloc]initWithContentsOfFile: [SystemPlist returnDownloadFilePath]];
//        NSDictionary *dictInfo=@{@"fileFilePath":_sCurDownloadFilePath,@"fileExtension":sExtension,@"fileTitle":sFileTitle};
//        [arrayInfo addObject:dictInfo];
//        [arrayInfo writeToFile:[SystemPlist returnDownloadFilePath] atomically:YES];
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            [PublicFunc ShowSuccessHUD:@"文件下载成功" view:self.view];
//        }];
    }
}

// 任务完成，不管是否下载成功
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    if (error) {
        NSLog(@"DidCompleteWithError:Error is %@",error.localizedDescription);
    }
}

-(NSURLSession *)backgroundSession{
    static NSURLSession *session;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        NSURLSessionConfiguration *sessionConfig=[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.cmjstudio.URLSession"];
        sessionConfig.timeoutIntervalForRequest=5.0f;//请求超时时间
        sessionConfig.discretionary=YES;//系统自动选择最佳网络下载
        sessionConfig.HTTPMaximumConnectionsPerHost=5;//限制每次最多连接数
        //创建会话
        session=[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];//指定配置和代理
    });
    return session;
}


@end
