#import "DeviceID.h"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreFoundation/CFNotificationCenter.h>
static void Notify(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
// Sender.
CFMutableDictionaryRef dictionary = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
CFDictionaryAddValue(dictionary,[ID WiFiAddress], @1);
CFDictionaryAddValue(dictionary,[ID UniqueDeviceID], @2);
CFDictionaryAddValue(dictionary,[ID serialNumber], @3);
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("naville.identify"), @"string object", dictionary, true);
CFRelease(dictionary);
 
}

int main(int argc, char **argv, char **envp)
{
NSLog([ID UniqueChipID]);
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, Notify, CFSTR("naville.requestidentify"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
        CFRunLoopRun(); // keep it running in background
        return 0;
}
// vim:ft=objc
