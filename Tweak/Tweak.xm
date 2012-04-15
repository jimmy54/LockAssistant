#import "SBAwayView.h"

@interface SBAwayView (lockAssistant)
- (void)toggleCameraButton;
@end

static BOOL enabled = YES;

%hook SBAwayLockBar
- (void)_cameraButtonHit:(id)arg1 {
 NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.freemanrepo.lockassistant.plist"];
 enabled = [[dict objectForKey:@"Enabled"] boolValue];

 if (enabled) {
if ([%c(SBAssistantController) preferenceEnabled]) {
                [[UIApplication sharedApplication] activateAssistantWithOptions:nil withCompletion:nil];
        } else {
                SBVoiceControlAlert *alert = [%c(SBVoiceControlAlert) pendingOrActiveAlert];
                if (alert) {
                        [alert cancel];
                }
                if ([%c(SBVoiceControlAlert) shouldEnterVoiceControl]) {
                        alert = [[%c(SBVoiceControlAlert) alloc] initFromMenuButton];
                        [alert _workspaceActivate];
                        [alert release];
                }
        }
 }
 else {
%orig;
 }
[dict release];
}