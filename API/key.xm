#import "pp.h"
#import <UIKit/UIKit.h>
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
NSString *token;
NSString *tieudealert;
NSString *submit;
NSString *contact;
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
 
    //token Package
    token = NSSENCRYPT("TRUONG-MODS-ADMIN-VIP1");
    // rosy
    //token = NSSENCRYPT("Onv20CTyO5om8WKStnHeKW3OHCAJ6uSZZCbpgq89OdaanjDsH72GNYiCjFHpAe4NI7XMRmv7fqJXHuvTwxhurXyfwyLffZcJqMQP");


    //Tiêu đề bảng nhập key
    tieudealert= NSSENCRYPT("KEY TRUONGMOD"); 
    
    // Nội dung nút Submit
    submit=NSSENCRYPT("LOGIN");

    //Nội dung nút liên hệ
    contact=NSSENCRYPT("Lấy Key");  
    phat *API = [[phat alloc] init];
    [phat startcheckkey];

    
}
%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}