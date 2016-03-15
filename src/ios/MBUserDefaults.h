//
//  MBUserDefaults.h
//
//  Created by Michael Belkin on 3/14/16.
//
//

#import <Cordova/CDV.h>

@interface MBUserDefaults : CDVPlugin

- (void)saveValue:(CDVInvokedUrlCommand *)command;
- (void)saveValueToAppGroup:(CDVInvokedUrlCommand *)command;
- (void)getValue:(CDVInvokedUrlCommand *)command;
- (void)getValueFromAppGroup:(CDVInvokedUrlCommand *)command;

@end