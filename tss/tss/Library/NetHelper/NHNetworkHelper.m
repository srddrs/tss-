//
//  NHNetworkHelper.m
//  NHNetworkHelper
//
//  Created by simope on 16/6/17.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHNetworkHelper.h"
#import "AFNetworking.h"
#import "MBProgressHUD+NH.h"
#import "KissXML.h"

static NSString * const kAFNetworkingLockName = @"com.alamofire.networking.operation.lock";

@interface NHNetworkHelper ()

@property (readwrite, nonatomic, strong) NSRecursiveLock *lock;

@end

@implementation NHNetworkHelper
@synthesize outputStream = _outputStream;

/**
 *  建立网络请求单例
 */
+ (id)shareInstance{
    static NHNetworkHelper *helper;
    static dispatch_once_t onceToken;
    
    __weak NHNetworkHelper *weakSelf = helper;
    dispatch_once(&onceToken, ^{
        if (helper == nil) {
            helper = [[NHNetworkHelper alloc]init];
            weakSelf.lock = [[NSRecursiveLock alloc] init];
            weakSelf.lock.name = kAFNetworkingLockName;
        }
    });
    return helper;
}


/**
 *  GET请求
 */
- (void)GET:(NSString *)url Parameters:(NSDictionary *)parameters Success:(void (^)(id))success Failure:(void (^)(NSError *))failure{
    
    //网络检查
    if ([[NHNetworkHelper shareInstance] checkingNetwork] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败" ToView:nil];
        return;
    }
    
    //断言
    NSAssert(url != nil, @"url不能为空");
    
    //使用AFNetworking进行网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //因为服务器返回的数据如果不是application/json格式的数据
    //需要以NSData的方式接收,然后自行解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    //发起get请求
    
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //将返回的数据转成json数据格式
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        
        //通过block，将数据回掉给用户
        if (success) {
            success(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //通过block,将错误信息回传给用户
        if (failure) {
            failure(error);
        }
    }];
}


/**
 *  POST请求
 */
- (void)Post:(NSString *)url Parameters:(NSDictionary *)parameters Success:(void (^)(id))success Failure:(void (^)(NSError *))failure{
    
    //网络检查
    if ([[NHNetworkHelper shareInstance] checkingNetwork] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败" ToView:nil];
        return;
    }
    
    //断言
    NSAssert(url != nil, @"url不能为空");
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //将返回的数据转成json数据格式
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        
        ResponseObject *obj =[ResponseObject yy_modelWithDictionary:result];
        NSString *domain;
        if (((response *)obj.responses[0]).flag.intValue==-1)
        {
            domain = @"常规的错误返回值";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10010)
        {
            domain = @"参数有误或不能为空";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10011)
        {
            domain = @"参数类型错误";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10012)
        {
            domain = @"参数格式错误";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10013)
        {
            domain = @"验证码错误";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10014)
        {
            domain = @"身份证号码格式错误";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10015)
        {
            domain = @"参数长度不符合";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-10016)
        {
            domain = @"参数有特殊字符";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20010)
        {
            domain = @"数据库操作错误";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20011)
        {
            domain = @"不存在该账户";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20012)
        {
            domain = @"已存在相同数据";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20013)
        {
            domain = @"添加超过限制";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20014)
        {
            domain = @"扣除数值超过原值了";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20015)
        {
            domain = @"验证失败";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20016)
        {
            domain = @"不存在该条要操作的数据";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20017)
        {
            domain = @"状态不正常";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20018)
        {
            domain = @"token无效";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20019)
        {
            domain = @"无数据";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20020)
        {
            domain = @"账户或密码出错";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20021)
        {
            domain = @"没有要改变的数据";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-20022)
        {
            domain = @"雇主或雇员没有购买过该城市的运费劵";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-30010)
        {
            domain = @"账户异常";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-30011)
        {
            domain = @"账户余额不足";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-30012)
        {
            domain = @"账户未通过实名认证";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-30013)
        {
            domain = @"数据不在有效时间内";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-40001)
        {
            domain = @"token无效";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-40002)
        {
            domain = @"该功能暂时无法访问";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-40003)
        {
            domain = @"服务器处理异常,请稍后再试";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-40004)
        {
            domain = @"请求的功能号为空或无效";
        }
        else if (((response *)obj.responses[0]).flag.intValue==-40005)
        {
            domain = @"登录失败多次,需要输入验证码";
        }
        else
        {
            domain = @"";
            success(responseObject);
        }
        //通过block，将数据回掉给用户
        if ([domain length]>0)
        {
            NSError *error = [NSError errorWithDomain:domain // 域名
                                                 code:((response *)obj.responses[0]).flag.intValue           // 错误代码
                                             userInfo:nil] ;        // 字典描述
            failure(error);
        }
        else
        {
            success(result);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //通过block,将错误信息回传给用户
        NSLog(error.description);
        failure(error);
    }];
}



/**
 *  向服务器上传文件
 */
- (void)Post:(NSString *)url
   Parameter:(NSDictionary *)parameter
        Data:(NSData *)fileData FieldName:(NSString *)fieldName
    FileName:(NSString *)fileName MimeType:(NSString *)mimeType
     Success:(void (^)(id))success
     Failure:(void (^)(NSError *))failure{
    
    //网络检查
    if ([[NHNetworkHelper shareInstance] checkingNetwork] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败" ToView:nil];
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:fileData name:fieldName fileName:fileName mimeType:mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //将返回的数据转成json数据格式
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        
        //将返回的数据转成json数据格式
        success(result);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //通过block,将错误信息回传给用户
        failure(error);
    }];
}


/**
 *  下载文件
 */
- (void)downloadFileWithRequestUrl:(NSString *)url
                         Parameter:(NSDictionary *)patameter
                         SavedPath:(NSString *)savedPath
                          Complete:(void (^)(NSData *data, NSError *error))complete
                          Progress:(void (^)(id downloadProgress, double progressValue))progress{
    //网络检查
    if ([[NHNetworkHelper shareInstance] checkingNetwork] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败" ToView:nil];
        return;
    }
    
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //AFN3.0URLSession的句柄
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //下载Task操作
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"downloadProgress:%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
        double progressValue = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        
        progress(downloadProgress, progressValue);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
        NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        NSLog(@"下载地址11111111:%@",path);
        
        return [NSURL fileURLWithPath:savedPath != nil ? savedPath : path];
        
//        NSURL *downUrl = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [downUrl URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        // filePath就是下载文件的位置，可以直接拿来使用
        NSData *data = [NSData dataWithContentsOfURL:filePath];
        NSLog(@"下载地址:%@",filePath);
        complete(data, error);
    }];
    
    //默认下载操作是挂起的，须先手动恢复下载。
    [downloadTask resume];
}


/**
 *  NSData上传文件
 */
- (void)updataDataWithRequestStr:(NSString *)str
                        FromData:(NSData *)fromData
                        Progress:(void(^)(NSProgress *uploadProgress))progress
                      Completion:(void(^)(id object,NSError *error))completion{
    
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager uploadTaskWithRequest:request fromData:fromData progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        completion(responseObject,error);
    }];
}


/**
 *  NSURL上传文件
 */
- (void)updataFileWithRequestStr:(NSString *)str
                        FromFile:(NSURL *)fromUrl
                        Progress:(void(^)(NSProgress *uploadProgress))progress
                      Completion:(void(^)(id object,NSError *error))completion{
    
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager uploadTaskWithRequest:request fromFile:fromUrl progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        completion(responseObject,error);
    }];
}


/**
 *   监听网络状态的变化
 */
- (NetworkStatus1)checkingNetwork{
    
    __block NSInteger statusTag = 0;
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager manager];
    
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusUnknown) {
            
            statusTag = StatusUnknown;
            
        }else if (status == AFNetworkReachabilityStatusNotReachable){
            
            statusTag = StatusNotReachable;
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            
            statusTag = StatusReachableViaWWAN;
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            
            statusTag = StatusReachableViaWiFi;
            
        }
    }];
    return statusTag;
}


/**
 *   取消所有正在执行的网络请求项
 */
- (void)cancelAllNetworkingRequest{
    
    //开发中...
}


- (NSOutputStream *)outputStream {
    if (!_outputStream) {
        self.outputStream = [NSOutputStream outputStreamToMemory];
    }
    
    return _outputStream;
}


- (void)setOutputStream:(NSOutputStream *)outputStream {
    [self.lock lock];
    if (outputStream != _outputStream) {
        if (_outputStream) {
            [_outputStream close];
        }
        _outputStream = outputStream;
    }
    [self.lock unlock];
}


- (NSString *)pathForTemporaryFileWithPrefix:(NSString *)prefix{
    NSString    *result;
    NSString    *newResult;
    CFUUIDRef   uuid;
    CFStringRef uuidStr;
    uuid = CFUUIDCreate(NULL);
    
    uuidStr = CFUUIDCreateString(NULL, uuid);
    
    result = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-%@", prefix, uuidStr]];
    newResult = [NSString stringWithFormat:@"%@",uuidStr];
    NSLog(@"-----%@----",newResult);
    CFRelease(uuidStr);
    CFRelease(uuid);
    
    return result;
}

- (void)Soap:(NSString *)url
  Parameters:(NSDictionary *)parameters
     Success:(void(^)(id responseObject))success
     Failure:(void(^)(NSError *error))failure
{
  
    if ([[NHNetworkHelper shareInstance] checkingNetwork] == StatusNotReachable) {
        [MBProgressHUD showAutoMessage:@"网络连接失败" ToView:nil];
        return;
    }
    
    DDXMLElement *requests = [DDXMLElement elementWithName:@"requests"];
    DDXMLElement *global = [DDXMLElement elementWithName:@"global"];
    
    
    DDXMLElement *token = [DDXMLElement elementWithName:@"token"];
   
    NSDictionary *item = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUser];
    NSString *tokenValue = [item objectForKey:@"token"];
    
    token.stringValue = tokenValue;
    [global addChild:token];
    
    
   DDXMLElement *request = [DDXMLElement elementWithName:@"request"];
    
    NSArray *keys =[parameters allKeys];
    for (NSString *key in keys)
    {
        DDXMLElement *element = [DDXMLElement elementWithName:key];
        NSString *value = [parameters objectForKey:key];
        element.stringValue = value;
         [request addChild:element];
    }
    
     [requests addChild:global];
    [requests addChild:request];
    
    NSString *xmlString = [requests XMLString];
    NSLog(@"result:%@",xmlString);
    
        
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    // 设置请求头，也可以不设置
//    [manager.requestSerializer setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%zd", xmlString.length] forHTTPHeaderField:@"Content-Length"];
    
    
    // 设置HTTPBody
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error)
    {
        return xmlString;
    }];

    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        ResponseObject *obj =[ResponseObject yy_modelWithDictionary:responseObject];
        NSString *domain;
        
        if (obj.global.flag.intValue==-1)
        {
            domain = @"常规的错误返回值";
        }
        else if (obj.global.flag.intValue==-10010)
        {
            domain = @"参数有误或不能为空";
        }
        else if (obj.global.flag.intValue==-10011)
        {
            domain = @"参数类型错误";
        }
        else if (obj.global.flag.intValue==-10012)
        {
            domain = @"参数格式错误";
        }
        else if (obj.global.flag.intValue==-10013)
        {
            domain = @"验证码错误";
        }
        else if (obj.global.flag.intValue==-10014)
        {
            domain = @"身份证号码格式错误";
        }
        else if (obj.global.flag.intValue==-10015)
        {
            domain = @"参数长度不符合";
        }
        else if (obj.global.flag.intValue==-10016)
        {
            domain = @"参数有特殊字符";
        }
        else if (obj.global.flag.intValue==-20010)
        {
            domain = @"数据库操作错误";
        }
        else if (obj.global.flag.intValue==-20011)
        {
            domain = @"不存在该账户";
        }
        else if (obj.global.flag.intValue==-20012)
        {
            domain = @"已存在相同数据";
        }
        else if (obj.global.flag.intValue==-20013)
        {
            domain = @"添加超过限制";
        }
        else if (obj.global.flag.intValue==-20014)
        {
            domain = @"扣除数值超过原值了";
        }
        else if (obj.global.flag.intValue==-20015)
        {
            domain = @"验证失败";
        }
        else if (obj.global.flag.intValue==-20016)
        {
            domain = @"不存在该条要操作的数据";
        }
        else if (obj.global.flag.intValue==-20017)
        {
            domain = @"状态不正常";
        }
        else if (obj.global.flag.intValue==-20018)
        {
            domain = @"token无效";
        }
        else if (obj.global.flag.intValue==-20019)
        {
            domain = @"无数据";
        }
        else if (obj.global.flag.intValue==-20020)
        {
            domain = @"账户或密码出错";
        }
        else if (obj.global.flag.intValue==-20021)
        {
            domain = @"没有要改变的数据";
        }
        else if (obj.global.flag.intValue==-20022)
        {
            domain = @"雇主或雇员没有购买过该城市的运费劵";
        }
        else if (obj.global.flag.intValue==-30010)
        {
            domain = @"账户异常";
        }
        else if (obj.global.flag.intValue==-30011)
        {
            domain = @"账户余额不足";
        }
        else if (obj.global.flag.intValue==-30012)
        {
            domain = @"账户未通过实名认证";
        }
        else if (obj.global.flag.intValue==-30013)
        {
            domain = @"数据不在有效时间内";
        }
        else if (obj.global.flag.intValue==-40001)
        {
            domain = @"token无效";
        }
        else if (obj.global.flag.intValue==-40002)
        {
            domain = @"该功能暂时无法访问";
        }
        else if (obj.global.flag.intValue==-40003)
        {
            domain = @"服务器处理异常,请稍后再试";
        }
        else if (obj.global.flag.intValue==-40004)
        {
            domain = @"请求的功能号为空或无效";
        }
        else if (obj.global.flag.intValue==-40005)
        {
            domain = @"登录失败多次,需要输入验证码";
        }
        else
        {
            domain = @"";
            success(responseObject);
        }
        //通过block，将数据回掉给用户
        if ([domain length]>0)
        {
                NSError *error = [NSError errorWithDomain:domain // 域名
                                        code:obj.global.flag.intValue           // 错误代码
                                    userInfo:nil] ;        // 字典描述
             failure(error);
        }
        else
        {
             success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //通过block,将错误信息回传给用户
        NSLog(error.description);
        failure(error);
    }];

    
    }
@end
