#import <UIKit/UIKit.h>
#include "Includes.h"
#import "mahoa.h"
#import "JHPP.h"
#import "main.h"
#import "Security/oxorany/oxorany_include.h"


#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^

@interface MenuLoad(){
    NSTimer *interactionTimer;

} 
@property (nonatomic, strong) ImGuiDrawView *vna;
- (ImGuiDrawView*) GetImGuiView;
@end

static MenuLoad *extraInfo;
UIWindow *mainwin;
UIButton* ButtonTouch;
UIButton* ButtonImage;
MenuInteraction* menuTouchView;
UITextField* hideRecordTextfield;
UIView* hideRecordView;
ImVec2 menuPos, menuSize;
bool StreamerMode = false;
bool blockdanhthang = true;
// extern bool choithang;
@interface MenuInteraction()

@end

@implementation MenuInteraction

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

@end

@implementation MenuLoad

- (ImGuiDrawView*) GetImGuiView
{
    return _vna;
} 


+ (void)load { 
    [super load];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        extraInfo = [MenuLoad new];
        [extraInfo initTapGes];
        [extraInfo reload];
    });
   }
void run_runnnnn() {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [generator prepare];
        [generator impactOccurred];
    }
}
+ (instancetype)createInstance {
    return [[self alloc] init];
}



-(void)initTapGes
{
    ButtonImage.transform = CGAffineTransformScale(ButtonImage.transform, 1, 1);

    mainwin = [UIApplication sharedApplication].keyWindow;

        CGFloat x = mainwin.bounds.size.width * 0.7;
    CGFloat y = mainwin.bounds.size.height * 0.2;


    UIView* mainView = [UIApplication sharedApplication].windows[0].rootViewController.view;
    hideRecordTextfield = [[UITextField alloc] init];
    hideRecordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [hideRecordView setBackgroundColor:[UIColor clearColor]];
    [hideRecordView setUserInteractionEnabled:YES];
    hideRecordTextfield.secureTextEntry = true;
    [hideRecordView addSubview:hideRecordTextfield];
    CALayer *layer = hideRecordTextfield.layer;
    if ([layer.sublayers.firstObject.delegate isKindOfClass:[UIView class]]) {
        hideRecordView = (UIView *)layer.sublayers.firstObject.delegate;
    } else {
        hideRecordView = nil;
    }
 
    [[UIApplication sharedApplication].keyWindow addSubview:hideRecordView];
    
    if (!_vna) {
         ImGuiDrawView *vc = [[ImGuiDrawView alloc] init];
         _vna = vc;
    }
      
    [ImGuiDrawView showChange:false];
    [hideRecordView addSubview:_vna.view];

    menuTouchView = [[MenuInteraction alloc] initWithFrame:mainView.frame];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:menuTouchView];

    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:nssoxorany("https://i.postimg.cc/rFvYKpWs/DF3D1CFA-321E-418C-8F6E-0FCC63C9BCB5.png")]];
    UIImage *decodedImage = [UIImage imageWithData:imageData];

    ButtonTouch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ButtonTouch.frame = CGRectMake(x, y, 90, 40);
    ButtonTouch.backgroundColor = [UIColor clearColor];
    [ButtonTouch addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu:)];
    [ButtonTouch addGestureRecognizer:tapGestureRecognizer];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:ButtonTouch];
    
    ButtonImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ButtonImage.frame = CGRectMake(x, y, 90, 40);
    ButtonImage.backgroundColor = [UIColor clearColor];
    ButtonImage.layer.cornerRadius = ButtonImage.frame.size.width * 0.5f;
    [ButtonImage setBackgroundImage:decodedImage forState:UIControlStateNormal];
    [hideRecordView addSubview:ButtonImage];
            ButtonImage.alpha = 1.0;

    BOOL isHidden = [[NSUserDefaults standardUserDefaults] boolForKey:@"hidemenuBtnState"];
    ButtonImage.hidden = isHidden;
    ButtonTouch.hidden = isHidden;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 3;
    tap.numberOfTouchesRequired = 3;
    [mainView addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(showMenu:)];
}



-(void)showMenu:(UITapGestureRecognizer *)tapGestureRecognizer {
        run_runnnnn();
    if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [ImGuiDrawView showChange:![ImGuiDrawView isMenuShowing]];
                [UIView animateWithDuration:0.1
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            ButtonImage.transform = CGAffineTransformMakeScale(1.1, 1.1);
            ButtonTouch.transform = CGAffineTransformMakeScale(1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                ButtonImage.transform = CGAffineTransformIdentity;
                ButtonTouch.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }];

        [self resetInteractionTimer]; // Reset timer khi có tương tác
        ButtonImage.alpha = 1.0;

    }
}

- (void)hidemenuBtn {

        BOOL isHidden = ButtonImage.hidden;
    ButtonImage.hidden = !isHidden;
    ButtonTouch.hidden = !isHidden;
    [[NSUserDefaults standardUserDefaults] setBool:!isHidden forKey:@"hidemenuBtnState"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];

    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;

    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
    ButtonImage.center = button.center;
    ButtonImage.frame = button.frame;
    lastPosition = button.center;
    [self resetInteractionTimer];
}

CGPoint lastPosition;
- (void)resizeFadeAndMoveButtonImage {
    [UIView animateWithDuration:0.5 animations:^{
        ButtonImage.alpha = 0.4; // Làm mờ 60%
    }];
}
-(void)resetInteractionTimer {
    if (interactionTimer) {
        [interactionTimer invalidate];
    }
        interactionTimer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                                         target:self
                                                       selector:@selector(resizeFadeAndMoveButtonImage)
                                                       userInfo:nil
                                                        repeats:NO];
}


- (void)reload {
    NSURL *url = [NSURL URLWithString:nssoxorany("https://thanhdo1110.github.io/api/reloadv1.json")];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }

        if (data) {
            NSError *jsonError;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError) {
                return;
            }
            BOOL shouldExit = [json[@"exit"] boolValue];
            if (shouldExit) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    exit(0);
                });
            } else {
            }
        }
    }];

    [dataTask resume];
}

 
void CD15S() {
  __block int countdown = 15;  // Thời gian đếm ngược 80 giây
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"THÔNG BÁO" message:[NSString stringWithFormat:@"ĐĂNG NHẬP SAU %d GIÂY", countdown] preferredStyle:UIAlertControllerStyleAlert];
  UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
  UIViewController *rootVC = keyWindow.rootViewController;
  [rootVC presentViewController:alert animated:YES completion:nil];
  __block NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                           repeats:YES
                                                             block:^(NSTimer *_Nonnull timer) {
                                                               countdown--;
                                                               alert.message = [NSString stringWithFormat:@"ĐĂNG NHẬP SAU %d GIÂY", countdown];
                                                               if (countdown <= 0) {
                                                                 [timer invalidate];
                                                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                                               }
                                                             }];
}
@end

