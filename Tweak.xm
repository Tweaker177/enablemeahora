#define PLIST_PATH                                                             \
@"/var/mobile/Library/Preferences/com.i0stweak3r.enablemeahora.plist"

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <UIKit/UISwitch.h>
#import <Foundation/Foundation.h>



#include <CSColorPicker/CSColorPicker.h>



static bool kEnabled = YES;
static NSString *kOutlineTintHex= @"FFFFFF";
static NSString *kOnTintColorHex = @"FFFFFF";
static UIColor *onTintColor;
static UIColor *outlineTintColor;
static UIColor *offTextColor;
static UIColor *onTextColor;
static NSString *kOnTextHex = @"FFFFFF";
static UIColor *wellOnColor;
static UIColor *thumbTintColor;
static NSString *kThumbTintHex = @"FFFFFF";
static NSString *kBackgroundColorHex;
static NSString *kOffTextHex = @"FFFFFF";
 static NSString *kWellOnColorHex  = @"FFFFFF";
static bool kUseLightTintOverColor = YES;
static bool kShowLabels = YES;
static bool kBackgroundColorEnabled = YES;
static bool kUseWellColor = YES;
static double kCustomBorderWidth = 3.f;
static bool kWantsCustomWidth = YES;


%hook UISwitchVisualElement
-(void)setOnTintColor:(UIColor *)onTintColor {
if(kEnabled) {
onTintColor = [UIColor colorFromHexString:kOnTintColorHex];
return %orig(onTintColor);
}
return %orig;
}

-(void)setThumbTintColor:(UIColor *)arg1 {
if(kEnabled) {
thumbTintColor = [UIColor colorFromHexString:kThumbTintHex];
arg1= thumbTintColor;
return %orig(arg1);
}
return %orig;
}

-(id)thumbTintColor {
if(kEnabled) {
UIColor *_thumbTintColor = [UIColor colorFromHexString:kThumbTintHex];
return _thumbTintColor;
}
return %orig;
}
%end

%hook UISwitch
/*** possible no haptic? 
-(void)_setImpactFeedbackGenerator:(id)arg1 {
if((kEnabled) && (kNoHaptic)) {
arg1= nil;
return;
}
return %orig;
}
*****/

-(id)initWithCoder:(id)arg1 {
return %orig;
}

-(id)init {
/* 
everything here is duplicated in initWithFrame, not needed, but system wide has an initialization issue so tried adding changes to both places */
%orig;
if(kEnabled) {
self.thumbTintColor=  [UIColor colorFromHexString:kThumbTintHex];
self.onTintColor=  [UIColor colorFromHexString: kOnTintColorHex];
/**
self.offImage.backgroundColor =  [UIColor colorFromHexString: kBackgroundColorHex];
**/
if(kBackgroundColorEnabled) {
self.layer.backgroundColor =  ([UIColor colorFromHexString: kBackgroundColorHex].CGColor);
return self;
}
return self;
}
return self;
}


-(id)initWithFrame:(CGRect)frame { 
%orig;
if(kEnabled) {
self.thumbTintColor=  [UIColor colorFromHexString:kThumbTintHex];
self.onTintColor=  [UIColor colorFromHexString: kOnTintColorHex];

if(kBackgroundColorEnabled) {
self.layer.backgroundColor =  ([UIColor colorFromHexString: kBackgroundColorHex].CGColor);
return self;
}
return self;
}
return self;
}

-(void)setThumbTintColor:(id)arg1
{
if(kEnabled) {
UIColor *thumbTintColor = [UIColor colorFromHexString:kThumbTintHex];
arg1=  thumbTintColor;
return %orig(arg1);
}
return %orig;
}

-(void)setOnTintColor:(id)arg1 {
if(kEnabled) {
arg1 = [UIColor colorFromHexString: kOnTintColorHex];
return %orig(arg1);
}
return %orig;
}
%end

%hook UISwitchModernVisualElement
- (id)_effectiveOnTintColor {
  if(kEnabled) {
onTintColor = [UIColor colorFromHexString:kOnTintColorHex];
return onTintColor;
}
return %orig;
}

%end 


%hook UISwitchModernVisualElement
- (id)_defaultOnTintColor {
  if(kEnabled) {
onTintColor = [UIColor colorFromHexString:kOnTintColorHex];
return onTintColor;
}
return %orig;
}

%end 


%hook UISwitchModernVisualElement
- (void)setOnTintColor:(id)arg1 {
if(kEnabled) {
onTintColor = [UIColor colorFromHexString:kOnTintColorHex];
arg1= onTintColor;
return %orig(arg1);
}
return %orig;
}

%end


%hook UISwitchModernVisualElement
- (void)setThumbTintColor:(id)arg1 {
 if(kEnabled) {
thumbTintColor= [UIColor colorFromHexString: kThumbTintHex];
arg1= thumbTintColor;
return %orig(arg1);
}
return %orig;
}
/**
-(id)thumbTintColor {
if(kEnabled) {
UIColor *_thumbTintColor = [UIColor colorFromHexString:kThumbTintHex];
return _thumbTintColor;
}
return %orig;
}
**/
%end

%hook UISwitchModernVisualElement
- (id)_effectiveTintColor {
if(kEnabled) {
outlineTintColor= [UIColor colorFromHexString: kOutlineTintHex];
return outlineTintColor;
}
return %orig;
}

- (double)_wellBorderWidthPressed:(bool)arg1 on:(bool)arg2 {
if((kEnabled)&&(kWantsCustomWidth)) {
return kCustomBorderWidth;
%orig;
} 
    return %orig;
}
%end
/*** Left this method to remind possibility to hook and add custom thumb images
%hook UISwitchModernVisualElement
- (id)_effectiveThumbImage {
    return %orig;
}
%end
**/

%hook UISwitchModernVisualElement
- (id)_effectiveOffImageTintColor {
  if(kEnabled) {
UIColor *offImageColor = [UIColor colorFromHexString: kOffTextHex];
return offImageColor;
}
return %orig;
}

- (id)_effectiveOnImageTintColor {
  if(kEnabled) {
UIColor *onImageColor = [UIColor colorFromHexString: kOnTextHex];
return onImageColor;
}
return %orig;
}
%end

%hook UISwitchModernVisualElement
- (CGColor*)_wellColorOn:(bool)arg1 {
if((kEnabled) && (kUseWellColor)) {
%orig;
wellOnColor= [UIColor colorFromHexString: kWellOnColorHex];
return wellOnColor.CGColor;
}
return %orig;
}
%end

//Pointless need to look into more

%hook UISwitchModernVisualElement
- (bool)_shouldUseLightTintOverColor:(id)arg1 {
if((kEnabled)&&(kUseLightTintOverColor)) {
return YES;
%orig;
}
    return %orig;
}

-(BOOL)showsOnOffLabel {
if((kEnabled)&&(kShowLabels)) {
return YES; }
return %orig;
}

-(void)setShowsOnOffLabel:(BOOL)arg1 {
if((kEnabled)&&(kShowLabels)) {
arg1= YES;
return %orig(arg1);
}
return %orig;
}

%end


%hook UISwitchModernVisualElement
- (id)_effectiveOffTextColor {
    if(kEnabled) {
offTextColor= [UIColor colorFromHexString: kOffTextHex];
return offTextColor;
}
return %orig;
}

- (id)_effectiveOnTextColor {
    if(kEnabled) {
onTextColor= [UIColor colorFromHexString: kOnTextHex];
return onTextColor;
}
return %orig;
}


%end

%hook UISwitchModernVisualElement
- (void)_setPressed:(bool)arg1 on:(bool)arg2 animated:(bool)arg3 shouldAnimateLabels:(bool)arg4 completion:(id)arg5 {
if((kEnabled)&&(kShowLabels)) {
    arg4 = 1;
    %orig;
}
return %orig;
}
%end



static void
loadPrefs() {
    static NSUserDefaults *prefs = [[NSUserDefaults alloc]
                                    initWithSuiteName:@"com.i0stweak3r.enablemeahora"];
    
    kEnabled = [prefs boolForKey:@"Enabled"];

kOnTintColorHex = [[prefs objectForKey:@"onTintColorHex"] stringValue];

kOutlineTintHex = [[prefs objectForKey:@"offTintColorHex"] stringValue];

kOnTextHex =  [[prefs objectForKey:@"onTextHex"] stringValue];

kOffTextHex = [[prefs objectForKey:@"offTextHex"] stringValue];

kUseWellColor = [prefs boolForKey:@"wellColorEnabled"];

kWantsCustomWidth = [prefs boolForKey:@"wantsCustomWidth"];

kCustomBorderWidth = [[prefs objectForKey:@"customBorderWidth"] floatValue];

kWellOnColorHex = [[prefs objectForKey:@"wellOnColorHex"] stringValue];

kThumbTintHex =  [[prefs objectForKey:@"thumbTintColorHex"] stringValue];

kUseLightTintOverColor = [prefs boolForKey:@"useTintOverColor"];

kBackgroundColorEnabled= [prefs boolForKey:@"backgroundColorEnabled"];

kBackgroundColorHex = 
[[prefs objectForKey:@"backgroundColorHex"] stringValue];

kShowLabels = [prefs boolForKey:@"showsLabels"];

}

%ctor {
    CFNotificationCenterAddObserver(
                                    CFNotificationCenterGetDarwinNotifyCenter(), NULL,
                                    (CFNotificationCallback)loadPrefs,
                                    CFSTR("com.i0stweak3r.enablemeahora/settingschanged"), NULL,
                                    CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPrefs();

}

