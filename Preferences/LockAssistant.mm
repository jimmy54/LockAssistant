#import <UIKit/UIKit.h>

@interface PSListController : UIViewController {
    id _specifiers;
}
- (id)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
@end

@interface LockAssistantListController: PSListController
@end

@implementation LockAssistantListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers =  [[self loadSpecifiersFromPlistName:@"LockAssistant" target:self] mutableCopy];
    }

    return _specifiers;
}

- (void)followPressed:(id)specifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/freemanrepo"]];
}

- (void)donatePressed:(id)specifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HXA3FNRKUL636"]];
}

- (void)SiriBoard:(id)specifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cydia://package/com.freemanrepo.siriboard"]];
}

- (void)mailPressed:(id)specifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:majdfhailylebanon@gmail.com"]];
}

@end

