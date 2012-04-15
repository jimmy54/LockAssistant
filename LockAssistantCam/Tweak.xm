#import "SBAwayView.h"
@interface SBAwayView (cameralockerwithoutsettings)
- (void)toggleCameraButton;
@end

static BOOL alwaysShow;

%hook SBAwayController
- (void)activate {
%orig;
NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.freemanrepo.lockassistant.plist"];
alwaysShow = [[dict objectForKey:@"Always Show"] boolValue];
if (alwaysShow) [self toggleCameraButton];
[dict release];
}
%end

%hook SBAwayView
- (void)hideCameraButton {
NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.freemanrepo.lockassistant.plist"];
alwaysShow = [[dict objectForKey:@"Always Show"] boolValue];
if (!alwaysShow) %orig;
[dict release];
}
%end