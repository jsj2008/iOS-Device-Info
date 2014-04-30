
#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include "DeviceID.h"

int main(int argc, char **argv, char **envp) {




NSLog(@"%@ Platform",[ID platformString]);


NSLog(@"%@ UniqueDeviceID",[ID UniqueDeviceID]);
NSLog(@"%@ WiFiAddress",[ID WiFiAddress]);
NSLog(@"%@ ChipID",[ID ChipID]);
NSLog(@"%@ IMEI",[ID IMEI]);
}

// vim:ft=objc
