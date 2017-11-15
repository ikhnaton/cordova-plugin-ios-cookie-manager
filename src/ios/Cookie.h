#import <Cordova/CDVPlugin.h>

@interface Cookie : CDVPlugin

- (void)getCookies:(CDVInvokedUrlCommand*)command;
- (void)setCookies:(CDVInvokedUrlCommand*)command;

@end
