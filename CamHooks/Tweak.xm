#import "SBAwayView.h"

@interface SBAwayView (cameralockerwithoutsettings)
- (void)toggleCameraButton;
@end

static BOOL enabled;

%hook SBAwayLockBar
- (void)setShowsCameraButton:(BOOL)arg1 {
  %orig;
  NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.freemanrepo.lockassistant.plist"];
   enabled = [[dict objectForKey:@"Enabled"] boolValue];
   
  UIButton *camButton = MSHookIvar<UIButton *>(self, "_cameraButton");
  UIImage *cam = [UIImage imageWithContentsOfFile:@"/Library/Application Support/LockAssistant/AssistantMic.png"];
  UIImage *camVoiceControl = [UIImage imageWithContentsOfFile:@"/Library/Application Support/LockAssistant/VoiceControl.png"];
  
  if (enabled) {
    if ([camButton viewWithTag:92348] != nil) {
        [((UIImageView*)[camButton viewWithTag:92348]) setImage:cam];
      } else {
        UIImageView *appIconView = [[%c(UIImageView) alloc] initWithFrame:CGRectMake(1, 1, 50, 51)];
        if ([%c(SBAssistantController) preferenceEnabled]) {
          appIconView.image = cam;
        } else {
          appIconView.image = camVoiceControl;
        }
        appIconView.tag = 92348;
        appIconView.userInteractionEnabled = NO;
        appIconView.exclusiveTouch = NO;
        [camButton addSubview:appIconView];
        [appIconView release];
      }  
  } else {
    if([camButton viewWithTag:92348] != nil) [(UIView*)[camButton viewWithTag:92348] removeFromSuperview];
  }
  [dict release];
}
%end
