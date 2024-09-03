//
//  FPhiWidgetIADLibh.h
//  FPhiWidgetCore
//

#ifndef FPhiWidgetIADLibh_h
#define FPhiWidgetIADLibh_h

#import <UIKit/UIKit.h>

@interface FPhiWidgetIADLib : NSObject

-(id)initWithCameraWidth:(int)cameraWidth cameraHeight:(int)cameraHeight;

+(BOOL)isRisky:(float)risk;
+(BOOL)isDoubtful:(float)risk;
+(BOOL)isSafe:(float)risk;

-(void)check:(UIImage *)image;

-(BOOL)isCheckFinished;
-(float)score;
-(NSString *)getLoggedData;

@end
#endif /* FPhiWidgetIADLibh_h */
