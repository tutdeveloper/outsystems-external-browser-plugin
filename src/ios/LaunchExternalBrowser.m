/********* LaunchExternalBrowser.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface LaunchExternalBrowser : CDVPlugin {
  // Member variables go here.
}

- (void)openExternalBrowser:(CDVInvokedUrlCommand*)command;
@end

@implementation LaunchExternalBrowser

- (void)openExternalBrowser:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    NSString* siteURL = [command.arguments objectAtIndex:0];
    
    if(siteURL != nil && [siteURL length] > 0) {
        //Open External Browser
        //NSURL* webViewUrl = self.webViewEngine.URL;
        
        //NSString * urlFormated = [NSString stringWithFormat:@"%@://%@/NativeAppBuilder/App?AppKey=%@", webViewUrl.scheme, webViewUrl.host, applicationKeyName];
        //NSURL *url = [NSURL URLWithString:[urlFormated stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		
		//NSURL *url = [NSURL string: siteURL];
		NSURL *url = [NSURL URLWithString:siteURL];

        //NSLog(@"URL --> %@", urlFormated);
		NSLog(@"URL --> %@", siteURL);
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success){
            CDVPluginResult* pluginResult;
            if (success) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                 messageAsString:[NSString stringWithFormat:@"Success: %@ opened",siteURL]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                 messageAsString:[NSString stringWithFormat:@"Failure: %@ not opened",siteURL]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No valid Parameters"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}


@end