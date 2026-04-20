#import "pp.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation phat
UIWindow *ppwd;
static phat  *ppdz;
NSString *urlContact;
extern NSString *token;
extern NSString *messageinfo;
extern NSString *submit;
extern NSString *contact;
NSString *savedKey = [[NSUserDefaults standardUserDefaults] objectForKey:NSSENCRYPT("savedKey")];


- (NSString*) getSavedKey 
{
    return savedKey;
}


- (NSString*) getSavedAmount 
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:NSSENCRYPT("savedAmount")];
}


+ (void)startcheckkey {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ppwd = [UIApplication sharedApplication].keyWindow;
        ppdz = [phat new];
        
        if (![[NSUserDefaults standardUserDefaults] objectForKey:NSSENCRYPT("savedKey")]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ppdz sendTokenToServer:token];
        });
    } else {
        [ppdz checkKeyExistence:savedKey];
    }
    });
}

- (void)sendTokenToServer:(NSString *)token {
    NSString *urlString = [NSString stringWithFormat:@"https://truongmods.net/package.php?token=%@", token];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithMessage:@"Network error. Please try again." shouldExit:YES];
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithMessage:@"Invalid response from server." shouldExit:YES];
            });
            return;
        }
        
        NSInteger errorCode = [responseDict[@"error"] integerValue];
        if (errorCode == 1) {
            NSString *errorMessage = responseDict[@"message"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithMessage:errorMessage shouldExit:YES];
            });
        } else if (errorCode == 0) {
            NSString *contactLink = responseDict[@"lienhe"];
            urlContact = contactLink;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showKeyInputAlert];
            });
        }
    }];
    [task resume];
}

- (void)showAlertWithMessage:(NSString *)message shouldExit:(BOOL)shouldExit {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [rootViewController dismissViewControllerAnimated:YES completion:^{
                if (shouldExit) {
                    exit(0);
                }
            }];
        });
    }];
}

- (void)showKeyInputAlert 
{
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:tieudealert message:NSSENCRYPT("Enter your key!") preferredStyle:UIAlertControllerStyleAlert];
    [alertCtrl addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"";
    }];
     if (![urlContact isEqualToString:@""] || ![urlContact isEqualToString:@" "]) {
        UIAlertAction *contactAction = [UIAlertAction actionWithTitle:contact style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlContact] options:@{} completionHandler:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                exit(0);
            });
        }];
        [contactAction setValue:[UIColor redColor] forKey:NSSENCRYPT("titleTextColor")];
        [alertCtrl addAction:contactAction];
    }
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:submit style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alertCtrl.textFields.firstObject;
        NSString *key = textField.text;
        if (key.length < 15) {
            NSDictionary *titleAttributes = @{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
            NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:NSSENCRYPT("FAILED!") attributes:titleAttributes];

            NSDictionary *messageAttributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:15]};
            NSAttributedString *attributedMessage = [[NSAttributedString alloc] initWithString:NSSENCRYPT("Vui lòng kiểm tra lại key!") attributes:messageAttributes];

            UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];

            [alertCtrl setValue:attributedTitle forKey:NSSENCRYPT("attributedTitle")];
            [alertCtrl setValue:attributedMessage forKey:NSSENCRYPT("attributedMessage")];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertCtrl animated:YES completion:nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [alertCtrl dismissViewControllerAnimated:YES completion:^{
                        [self showKeyInputAlert];
                    }];
                });
            });
        } else {
            [self checkKeyExistence:key];
        }
    }];
    [alertCtrl addAction:confirmAction];
   
    UIViewController *rootViewController = [[UIApplication sharedApplication].keyWindow rootViewController];
    [rootViewController presentViewController:alertCtrl animated:YES completion:nil];
}

- (void)checkKeyExistence:(NSString *)key 
{
    NSString *uuid  =  [[UIDevice currentDevice] identifierForVendor].UUIDString;
    NSString *lw = NSSENCRYPT("https://truongmods.net/key.php?");
    NSString *deviceModel = [[UIDevice currentDevice] model];
    NSString *urlString = [NSString stringWithFormat:NSSENCRYPT("%@key=%@&uuid=%@&hash=%@&devicemodel=%@"),lw, key, uuid,token,deviceModel];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSString *status = responseDict[NSSENCRYPT("status")];
        if ([status isEqualToString:NSSENCRYPT("success")]) {
            NSString *amount = responseDict[NSSENCRYPT("amount")];
            [[NSUserDefaults standardUserDefaults] setObject:amount forKey:NSSENCRYPT("savedAmount")];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSDictionary *hiAttributes = @{
                NSForegroundColorAttributeName: [UIColor greenColor],
                NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0]
            };
            NSAttributedString *hiString = [[NSAttributedString alloc] initWithString:NSSENCRYPT("SUCCESS!") attributes:hiAttributes];
            NSString *ls= NSSENCRYPT("Đăng nhập thành công\nThiết bị:");
            NSString *tg = NSSENCRYPT("\nHết hạn sau:");
            NSString *message = [NSString stringWithFormat:NSSENCRYPT("%@ %@ %@ %@"),ls,deviceModel,tg, amount];
                [[NSUserDefaults standardUserDefaults] setObject:key forKey:NSSENCRYPT("savedKey")];
                [[NSUserDefaults standardUserDefaults] synchronize];

                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showAlertWithAttributedTitle:hiString message:message shouldExit:NO];
                });
        }else{
            NSString *errorMessage = responseDict[@"messenger"];
            if ([errorMessage isEqualToString:NSSENCRYPT("Key đã hết hạn")] || 
                [errorMessage isEqualToString:NSSENCRYPT("Admin đã khóa thiết bị của bạn!")] || 
                [errorMessage isEqualToString:NSSENCRYPT("Admin tạm thời khoá app để update!")]) 
            {
                NSDictionary *errorAttributes = @{
                    NSFontAttributeName: [UIFont boldSystemFontOfSize:15.0] 
                };
                NSAttributedString *errorString = [[NSAttributedString alloc] initWithString:errorMessage attributes:errorAttributes];

                NSDictionary *failedAttributes = @{
                    NSForegroundColorAttributeName: [UIColor redColor],
                    NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0] 
                };
                NSAttributedString *failedString = [[NSAttributedString alloc] initWithString:NSSENCRYPT("FAILED!\n") attributes:failedAttributes];

                NSMutableAttributedString *finalString = [[NSMutableAttributedString alloc] init];
                [finalString appendAttributedString:failedString];
                [finalString appendAttributedString:errorString];

                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showAlertWithAttributedTitle:finalString message:nil shouldExit:YES];
                });
            }else{
                NSDictionary *errorAttributes = @{
                    NSFontAttributeName: [UIFont boldSystemFontOfSize:15.0] 
                };
                NSAttributedString *errorString = [[NSAttributedString alloc] initWithString:errorMessage attributes:errorAttributes];

                NSDictionary *failedAttributes = @{
                    NSForegroundColorAttributeName: [UIColor redColor],
                    NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0] 
                };
                NSAttributedString *failedString = [[NSAttributedString alloc] initWithString:NSSENCRYPT("FAILED!\n") attributes:failedAttributes];

                NSMutableAttributedString *finalString = [[NSMutableAttributedString alloc] init];
                [finalString appendAttributedString:failedString];
                [finalString appendAttributedString:errorString];

                [[NSUserDefaults standardUserDefaults] removeObjectForKey:NSSENCRYPT("savedKey")];
                [[NSUserDefaults standardUserDefaults] synchronize];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showAlertWithAttributedTitle:finalString message:nil shouldExit:YES];
                });
            }
        }
    }];
    [task resume];
}


- (void)showAlertWithAttributedTitle:(NSAttributedString *)title message:(NSString *)message shouldExit:(BOOL)shouldExit 
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title.string message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert setValue:title forKey:NSSENCRYPT("attributedTitle")];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [rootViewController dismissViewControllerAnimated:YES completion:^{
                if (shouldExit) {
                    exit(0);
                }
            }];
        });
    }];
}

@end