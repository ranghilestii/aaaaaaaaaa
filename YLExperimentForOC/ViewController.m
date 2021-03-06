//
//  ViewController.m
//  YLExperimentForOC
//
//  Created by syl on 16/4/26.
//  Copyright © 2016年 yilin. All rights reserved.
//

#import "ViewController.h"
#import "QREncoding.h"
#import "CalendarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self creatQRCode];
    // [self creatSimpleCalendar];
    // [self testNSDate];
    // [self testNSTimeZone];
    // [self testNSLocale];
       [self testNSDateFormatter];
}
- (void)testNSDateFormatter {
   
    //一个简单例子
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"一周第 e 天  zzzz:   YYYY-MM-dd  HH:mm:ss"];//e代表一周的第几天,从周日开始计算.zzzz表是时区地点
    NSDate *date = [NSDate date];
    NSString *correctDate = [formatter stringFromDate:date];
    NSLog(@"%@",correctDate);
  
    //这个例子综合了各个参数,值得一看
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@" \n '公元前/后:'G ' \n 年份:'u'='yyyy'='yy ' \n 季度:'q'='qqq'='qqqq ' \n 月份:'M'='MMM'='MMMM ' \n 今天是今年第几周:'w ' \n 今天是本月第几周:'W  ' \n 今天是今年第几天:'D ' \n 今天是本月第几天:'d ' \n 星期:'c'='ccc'='cccc ' 上午/下午:'a ' \n 小时:'h'='H '分钟:'m '秒:'s '毫秒:'SSS  ' \n 这一天已过多少毫秒:'A  ' \n 时区名称:'zzzz'='vvvv '时区编号:'Z "];
    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
  
    /*
    参数      代表意义
    
    a        AM/PM (上午/下午)
    K        0~11 有0時的12小時制
    h        1~12 12小時制
    H        0~23 有0時的24小时制
    k        1~24 24小時制
    m        0~59 分鐘
    s        0~59 秒數
    s        秒數的個位數
    A        0~86399999 一天當中的第幾微秒
    
    v~vvv    一般的GMT時區縮寫
    vvvv     一般的GMT時區名稱
    z~zzz    具體的GMT時區縮寫
    zzzz     具體的GMT時區名稱
    d        1~31 日期
    D        1~366 一年的第幾天
    e        1~7 一週的第幾天
    c/cc     1~7 一週的第幾天，星期日為第一天
    
    ccc      星期幾縮寫
    E~EEE    星期幾縮寫
    cccc     星期幾全名
    EEEE     星期幾全名
    
    F        1~5 每月第幾周，一周的第一天為周一
    w        1~5 每月第幾周，一周的第一天為周日
    w        1~53 一年的第幾周，從去年的最後一個周日算起，一周的第一天為周日
    
    L/LL     1~12 第幾個月
    M/MM     1~12 第幾個月
    LLL      月份縮寫
    MMM      月份縮寫
    LLLL     月份全名
    MMMM     月份全名
    
    q/qq     1~4 第幾季
    Q/QQ     1~4 第幾季
    qqq      季度縮寫
    QQQ      季度縮寫
    qqqq     季度全名
    QQQQ     季度全名
    
    u        完整年份
    y/yyyy   完整年份
    Y/YYYY   完整年份，從星期天開始的第一周算起
    yy/yyy   兩位數的年份
    YY/YYY   兩位數的年份，從星期天開始的第一周算起
    g        Julian Day Number，從4713 BC一月一日算起
    G~GGG    BC/AD 西元前後縮寫
    GGGG     西元前後全名
    
  */
}
- (void)testNSLocale
{
    // 当前用户设置的本地化对象
    NSLocale *currentLocale= [NSLocale currentLocale];
    NSString *localeIdentifier = [currentLocale  objectForKey:NSLocaleIdentifier];
    NSString *localeLanguageCode = [currentLocale objectForKey:NSLocaleLanguageCode];
    NSLog(@"%@",currentLocale.localeIdentifier);
    NSLog(@"localeIdentifier:%@,localeLanguageCode:%@",localeIdentifier,localeLanguageCode);
    
    //获取国际化信息的显示名称
    NSLocale *curLocal = [[NSLocale alloc]initWithLocaleIdentifier:@"zh-Hans"];
    NSLog(@"%@",[curLocal displayNameForKey:NSLocaleIdentifier value:@"fr_FR"]);//法文（法國）
    NSLog(@"%@",[curLocal displayNameForKey:NSLocaleIdentifier value:@"en-US"]);//英文（美國)
    NSLog(@"%@",[curLocal displayNameForKey:NSLocaleIdentifier value:@"en_pl"]);//英文（波蘭）
    
    //会根据设备的设置，自动返回不同语言的数据。
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];//参数试试fr_FR,en_us
    NSDateFormatter *secondDateFormatter = [[NSDateFormatter alloc] init];
    [secondDateFormatter setDateFormat:@"cccc"];
    secondDateFormatter.locale = locale;
    NSDate *date = [NSDate date];
    NSLog(@"%@", [secondDateFormatter stringFromDate:date]);
    
    // 获取系统所有本地化标识符数组列表
    NSArray *localeIdentifiers = [NSLocale availableLocaleIdentifiers];
    // 获取所有已知国家代码数组列表
    NSArray * countryCodes = [NSLocale ISOCountryCodes];
    // 获取所有已知ISO货币代码数组列表
    NSArray *currenyCodes  = [NSLocale ISOCurrencyCodes];
    // 获取所有已知ISO语言代码数组列表
    NSArray *languageCodes = [NSLocale ISOLanguageCodes];
    //语言偏好设置列表，对应于IOS中Setting>General>Language弹出的面板中的语言列表。
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    NSLog(@"\n%@,\n%@,\n%@,\n%@,\n%@",localeIdentifiers,countryCodes,currenyCodes,languageCodes,preferredLanguages);
    
    
    /*
     NSDate *startDateOfYear;
     NSDate *startDateOfMonth;
     NSDate *startDateOfWeek;
     NSDate *startDateOfDay;
     NSTimeInterval TIOfYear;
     NSTimeInterval TIOfMonth;
     NSTimeInterval TIOfWeek;
     NSTimeInterval TIOfDay;
     [[NSCalendar currentCalendar] rangeOfUnit:NSYearCalendarUnit startDate:&startDateOfYear interval:&TIOfYear forDate:[NSDate date]];
     [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&startDateOfMonth interval:&TIOfMonth forDate:[NSDate date]];
     [[NSCalendar currentCalendar] rangeOfUnit:NSWeekCalendarUnit startDate:&startDateOfWeek interval:&TIOfWeek forDate:[NSDate date]];
     [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit startDate:&startDateOfDay interval:&TIOfDay forDate:[NSDate date]];
     NSLog(@"firstDateOfYear:%@, FirstDateOfMonth:%@, FirstDateOfWeek:%@, FirstDateOfDay:%@", startDateOfYear, startDateOfMonth, startDateOfWeek, startDateOfDay);
     NSLog(@"\nTIOfYear:%f\nTIOfMonth:%f\nTIOfWeek:%f\nTIOfDay:%f\n", TIOfYear, TIOfMonth, TIOfWeek, TIOfDay);
     */
}

- (void)testNSTimeZone
{
//------------------------------ 取得各个时区时间  ---------------------------------//
    
   //取得已知时区名称
    NSArray *timeZoneNames = [NSTimeZone knownTimeZoneNames];
    NSDate *date = [NSDate date];
    //几百个时区,建议断点调试着看
    for(NSString *name in timeZoneNames) {
        NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:name];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //格式
        [formatter setDateFormat:@"YYYY-MM-d HH:mm:ss"];
        //设置时区
        [formatter setTimeZone:timezone];
        //NSDate ----> NSString
        NSString *correctDate = [formatter stringFromDate:date];
        NSLog(@"地点：%@   当地时间：%@",[timezone name], correctDate);
        NSLog(
              @"\nlocalTimeZone = [%@]\nDisplay = [%@]\nGMT = [%d] hours",
              timezone,
              [timezone name],
              (int)[timezone secondsFromGMT] / 60 /60
              );
    }
    
//-------------------方法timeZoneForSecondsFromGMT自定义时区---------------------------//
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    df.timeZone = [NSTimeZone systemTimeZone];//系统所在时区
    NSString *systemTimeZoneStr =  [df stringFromDate:date];
    df.timeZone = [NSTimeZone defaultTimeZone];//默认时区
    NSString *defaultTimeZoneStr = [df stringFromDate:date];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:8*3600];//直接指定时区
    NSString *plus8TZStr = [df stringFromDate:date];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0*3600];//这就是GMT+0时区
    NSString *gmtTZStr = [df stringFromDate: date];
    NSLog(@"\n SysTime:%@\n DefaultTime:%@\n +8:%@\n GMT_time:%@",systemTimeZoneStr,defaultTimeZoneStr,plus8TZStr,gmtTZStr);
    
//-------------------- 修改默认时区会影响时间 -----------------------------------------//
    
    // 只能够修改该程序的defaultTimeZone，不能修改系统的，更不能修改其他程序的。
    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0900"]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *now = [NSDate date];
    NSLog(@"now:%@", [dateFormatter stringFromDate:now]);
    
    // 也可直接修改NSDateFormatter的timeZone变量
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    NSLog(@"now:%@", [dateFormatter stringFromDate:now]);

//-------------------- 通过secondsFromGMTForDate方法获得localtime ---------------------//
    
     NSDate *currentDate = [NSDate date];
     NSLog(@"currentDate: %@",currentDate);
     NSTimeZone *zone = [NSTimeZone systemTimeZone];
     NSInteger interval = [zone secondsFromGMTForDate:currentDate];
     NSDate *localDate = [currentDate dateByAddingTimeInterval:interval];
     NSLog(@"正确的当前时间localDate: %@",localDate);
     NSLog(@"当前时区和格林尼治时区差的秒数:%ld",[zone secondsFromGMT]);
     NSLog(@"当前时区的缩写:%@",[zone abbreviation]);
    
//-------------------------------- 设置并获取时区的缩写 ---------------------------------//
    
    NSMutableDictionary *abbs = [[NSMutableDictionary alloc] init];
    [abbs setValuesForKeysWithDictionary:[NSTimeZone abbreviationDictionary]];//获得所有缩写
    [abbs setValue:@"Asia/Shanghai" forKey:@"CCD"];//增加一个
    [NSTimeZone setAbbreviationDictionary:abbs];//设置NStimezone的缩写
    NSLog(@"abbs:%@", [NSTimeZone abbreviationDictionary]);


}
- (void)testNSDate
{
//-------------------------------- NSDate ----> NSString ---------------------------------//
    
    //NSDate ----> NSString
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"年月日,时分秒  yyyy - MM - dd HH:mm:ss"]; //似乎只要有对应的就行
    NSLog(@"%@",dateFormatter.timeZone);
    NSLog(@"%@",dateFormatter.locale);
    NSDate *dateOne = [NSDate date];
    NSLog(@"转换前 = %@", dateOne);
    NSString *strDate = [dateFormatter stringFromDate:dateOne];
    //转的时候会根据-时区-变化,加了8小时,参考NSTimeZone
    NSLog(@"转换后 = %@", strDate);
    
//---------------------------- NSString -----> NSDate ------------------------------------//
    
    //NSString -----> NSDate
    NSDateFormatter *dateFormatterTwo = [[NSDateFormatter alloc] init];
    [dateFormatterTwo setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatterTwo dateFromString:@"2016-04-29 17:46:03"];
    //转的时候会根据-时区-变化,减掉了8小时,,参考NSTimeZone
    NSLog(@"%@",date);//输出2016-04-29 09:46:03 +0000 对比 2016-04-29 17:46:03
    
//--------------------------------------------------------------------------------------------//
    
    //日期创建方式
    NSDate *dateTwo = [NSDate date];
    NSString *str = [dateTwo description];
    NSLog(@"%@",str);
    NSDate *dateThree = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*7]; //负数代表过去
    NSLog(@"%@",dateThree);
    //日期是否相同
    BOOL isEqual = [dateTwo isEqual:dateThree];
    NSLog(@"%d",isEqual);
    
    // 从某时间开始经过某秒后的日期时间
    NSDate *dateFour = [dateThree  initWithTimeInterval:60*60*24*7 sinceDate:dateThree];
    NSDate *dateFive = [NSDate dateWithTimeInterval:60*60*24*7 sinceDate:dateThree];
    NSLog(@"%@",dateFour);
    NSLog(@"%@",dateFive);
    
    //某两个时间相隔多久
    NSInteger gap = [dateThree timeIntervalSinceDate:dateFive];
    NSLog(@"%ld",gap);
    
    //取得正确的时间,既UTC世界统一时间 + 8小时
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateTwo];
    NSDate *localDate = [dateTwo  dateByAddingTimeInterval: interval];
    NSLog(@"正确当前时间 localDate = %@",localDate);
    
    //时间比较
    BOOL later = [dateOne laterDate:localDate];
    NSLog(@"%d",later);
    BOOL early = ([localDate compare:dateOne] == NSOrderedAscending);
    NSLog(@"%d",early);

}

- (void)creatQRCode
{
    CGFloat imageSize = ceilf(self.view.bounds.size.width * 0.6f);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(floorf(self.view.bounds.size.width * 0.5f - imageSize * 0.5f), floorf(self.view.bounds.size.height * 0.5f - imageSize * 0.5f), imageSize, imageSize)];
    //生成二维码图片
    imageView.image = [QREncoding createQRcodeForString:@"http://www.baidu.com" withSize:imageView.bounds.size.width withRed:255 green:0 blue:0];
    //添加中心图片
    UIImageView *centerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhifubao.png"]];
    centerImage.frame= CGRectMake(0, 0, 38.f, 38.f);
    centerImage.center = CGPointMake(CGRectGetWidth(imageView.frame)/2.f, CGRectGetHeight(imageView.frame)/2.f);
    [imageView addSubview:centerImage];
    [self.view addSubview:imageView];

}
- (void)creatSimpleCalendar
{
    CalendarViewController *temp = [[CalendarViewController alloc] init];
    [temp.view setFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self addChildViewController:temp];
    [self.view addSubview:temp.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
