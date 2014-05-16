#include <notify.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreFoundation/CFNotificationCenter.h>
static void Process(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef AAA)
{
NSDictionary  *nsdic = (__bridge_transfer  NSDictionary*)AAA;//Doesn't Work WithOut ARC,Any Backup?
NSString *valueObj = [AAA objectForKey:@1];
UIAlertView *className = [[UIAlertView alloc] initWithTitle:@"Test" message:valueObj delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];

[className show];
[className release];
CFRelease(AAA);
 
}
%hook AppDelegate
-(BOOL)application:(id)fp8 didFinishLaunchingWithOptions:(id)fp12{
notify_post("naville.requestidentify");
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, Process, CFSTR("naville.identify"),CFDictionaryRef AAA, CFNotificationSuspensionBehaviorDeliverImmediately);
        CFRunLoopRun(); // keep it running in background
        return 0;

return %orig;
}
%end
