//
//  MBUserDefaults.m
//
//  Created by Michael Belkin on 3/14/16.
//
//

#import "MBUserDefaults.h"

@implementation MBUserDefaults

- (void)saveValue:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^
	{
		CDVPluginResult * pluginResult = nil;
		
		NSString * key = command.arguments[0];
		NSString * value = command.arguments[1];
		
		NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
		[userDefaults setObject:value forKey:key];
		[userDefaults synchronize];
		
		if ([[userDefaults stringForKey:key] isEqualToString:value])
		{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		}
		else
		{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_IO_EXCEPTION];
		}
		
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

- (void)saveValueToAppGroup:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^
	{
		CDVPluginResult * pluginResult = nil;
		
		NSString * key = command.arguments[0];
		NSString * value = command.arguments[1];
		NSString * appGroupId = command.arguments[2];
		
		if (appGroupId.length == 0)
		{
			appGroupId = [NSString stringWithFormat:@"group.%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]];
		}
		
		NSUserDefaults * userDefaults = [[NSUserDefaults alloc] initWithSuiteName:appGroupId];
		[userDefaults setObject:value forKey:key];
		[userDefaults synchronize];
		
		if ([[userDefaults stringForKey:key] isEqualToString:value])
		{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		}
		else
		{
			pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_IO_EXCEPTION];
		}
		
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

- (void)getValue:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^
	{
		NSString * key = command.arguments[0];
		
		NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
		NSString * value = [userDefaults stringForKey:key];
		
		CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
		
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

- (void)getValueFromAppGroup:(CDVInvokedUrlCommand*)command
{
	[self.commandDelegate runInBackground:^
	{
		NSString * key = command.arguments[0];
		NSString * appGroupId = command.arguments[1];
		
		if (appGroupId.length == 0)
		{
			appGroupId = [NSString stringWithFormat:@"group.%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]];
		}
		
		NSUserDefaults * userDefaults = [[NSUserDefaults alloc] initWithSuiteName:appGroupId];
		NSString * value = [userDefaults stringForKey:key];
		
		CDVPluginResult * pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
		
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

@end