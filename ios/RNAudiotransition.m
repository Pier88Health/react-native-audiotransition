
#import "RNAudiotransition.h"
#import "PFAudio.h"
// #import PFAudioLib

@implementation RNAudiotransition

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initAudioTransition) {
  
}

RCT_EXPORT_METHOD(audioToStart:(NSString *) absolutePath andType:(NSString *) type andResponse:(RCTResponseSenderBlock)callback) {
    NSString *originType = [absolutePath pathExtension];
    NSString *outPutPath = @"";
    BOOL isSucceed = YES
    if ([originType isEqualToString:@"wav"] && [type isEqualToString:@"amr"]) {
        isSucceed = [[PFAudio shareInstance] wav2Amr:absolutePath isDeleteSourchFile:YES];
    } else if ([originType isEqualToString:@"amr"] && [type isEqualToString:@"wav"]) {
        isSucceed = [[PFAudio shareInstance] amr2Wav:absolutePath isDeleteSourchFile:YES];
    } else if ([originType isEqualToString:@"pcm"] && [type isEqualToString:@"mp3"]) {
        isSucceed = [[PFAudio shareInstance] pcm2Mp3:absolutePath isDeleteSourchFile:YES];
    } else if ([originType isEqualToString:@"pcm"] && [type isEqualToString:@"wav"]) {
        isSucceed = [[PFAudio shareInstance] pcm2Wav:absolutePath isDeleteSourchFile:YES];
    } else if ([originType isEqualToString:@"pcm"] && [type isEqualToString:@"amr"]) {
        isSucceed = [[PFAudio shareInstance] pcm2Amr:absolutePath isDeleteSourchFile:YES];
    }
//
    if (!outPutPath) {
        callback(@[@101]);
//        callback([@"101", @"转换出现错误，请重试"]);
    } else if ([outPutPath isEqualToString:@""]) {
        callback(@[@100]);
//        callback([@"100", @"暂不支持此类型转换"]);
    } else {
        callback(@[@200, outPutPath]);
        // callback([@"200", outPutPath]);
    }
}
//RCT_EXPORT_METHOD(addTag:(NSString *)tag response:(RCTResponseSenderBlock)completion)
//{
//  [UMessage addTags:tag response:^(id  _Nonnull responseObject, NSInteger remain, NSError * _Nonnull error) {
//    [self handleResponse:responseObject remain:remain error:error completion:completion];
//  }];
//}
//initAudioTransition

@end
  
