#import "Cookie.h"
#import <Cordova/CDVPlugin.h>

@implementation Cookie

- (void)setCookies:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    NSDictionary* mycookies = [command.arguments objectAtIndex:0];
    NSDictionary* cookieSettings = [command.arguments objectAtIndex:1];
    
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    
    for (id key in cookieSettings)
    {
        if ([key  isEqual: @"domain"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookieDomain];
        }
        else if ([key  isEqual: @"url"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookieOriginURL];
        }
        else if ([key  isEqual: @"path"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookiePath];
        }
        else if ([key  isEqual: @"expiration"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookieDomain];
        }
        else if ([key  isEqual: @"domain"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookieDomain];
        }
        else if ([key  isEqual: @"domain"])
        {
            [cookieProperties setObject:[cookieSettings objectForKey:key] forKey:NSHTTPCookieDomain];
        }
    }
    
    for (id key in mycookies)
    {
        NSMutableDictionary *temp =  [[NSMutableDictionary new] initWithDictionary:cookieSettings];
        [temp setObject:key forKey:NSHTTPCookieName];
        [temp setObject:[mycookies objectForKey:key] forKey:NSHTTPCookieValue];
        
        NSHTTPCookie *newCookie = [NSHTTPCookie cookieWithProperties:temp];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];
    }
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getCookies:(CDVInvokedUrlCommand*)command
{
    
    NSString* myarg = [command.arguments objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:myarg];
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    NSHTTPCookieStorage *cookiesStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [cookiesStorage cookiesForURL:url];
    
    for (NSHTTPCookie* cookie in cookies)
    {
        [result setObject:[cookie valueForKey:@"value"] forKey:[cookie valueForKey:@"name"]];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
