/**********************************************
Mobile Gestalt Part Written By Naville.Zhang
Based On Work Of Cykey
***********************************************/
#include "iOSInfoHeader/CoreTelephony.h"
#import "iOSInfoHeader/MobileGestalt.h"
#import <IOKit/IOKitLib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sysctl.h>
#include "iOSInfoHeader/UIDevice-IOKitExtensions.h"
/* Add
PROJECTNAME_LDFLAGS=./libMobileGestalt.dylib
PROJECTNAME_FRAMEWORKS = UIKit Foundation IOKit CoreFoundation
IN MakeFile
*/
@interface ID:NSObject
+(NSString *) platformString;
+(NSString *)serialNumber;
@end
@implementation ID
+(NSString *) platformString{
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = new char[size];
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    return platform;
}

+(NSString *)serialNumber{
    NSString *machine = (NSString*)MGCopyAnswer(kMGSerialNumber);

    return machine;
}
+(NSString *)UniqueDeviceID{
    NSString *machine = (NSString*)MGCopyAnswer(kMGUniqueDeviceID);

    return machine;
}
+(NSString *)WiFiAddress{
    NSString *machine = (NSString*)MGCopyAnswer(kMGWifiAddress);

    return machine;
}
+(NSString *)ChipID{
    NSString *machine = (NSString*)MGCopyAnswer(kMGChipID);

    return machine;
}

+(NSString *)IMEI{
    NSString *machine = (NSString*)MGCopyAnswer(kMGInternationalMobileEquipmentIdentity);

    return machine;
}
@end
