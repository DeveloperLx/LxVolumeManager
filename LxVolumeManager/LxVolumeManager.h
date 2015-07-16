//
//  LxVolumeManager.h
//  LxVolumeManagerDemo
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface LxVolumeManager : NSObject

+ (CGFloat)currentVolume;
+ (void)setVolume:(CGFloat)volume;

+ (void)mute;
+ (void)unmute;

+ (void)beginObserveVolumeChange:(void (^)(CGFloat volume))volumeChangeCallBack;
+ (void)stopObserveVolumeChange;

@end
