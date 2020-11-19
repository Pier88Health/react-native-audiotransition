
#import "RNAudiotransition.h"
#import "PFAudio.h"

@implementation RNAudiotransition

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initAudioTransition) {
  
}

RCT_REMAP_METHOD(audioConvert,
                  filePath:(NSString *)absolutePath
                  andType:(NSString *)type
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *originType = [absolutePath pathExtension];
    NSString *outPutPath = [absolutePath stringByReplacingOccurrencesOfString:originType withString: type];
    BOOL isSucceed = YES;
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
    } else if ([originType isEqualToString:@"aac"] && [type isEqualToString:@"wav"]) {
        isSucceed = [[PFAudio shareInstance] pcm2Wav:absolutePath isDeleteSourchFile:YES];
    }

    if (isSucceed) {
        resolve(@{@"status": @"success", @"path": outPutPath});
    } else {
        resolve(@{@"status": @"failed"});
    }
}


RCT_EXPORT_METHOD(audioToStart:(NSString *) absolutePath andType:(NSString *) type andResponse:(RCTResponseSenderBlock)callback) {
    NSString *originType = [absolutePath pathExtension];
    NSString *outPutPath = [absolutePath stringByReplacingOccurrencesOfString:originType withString: type];
    // NSString *outPutPath = @"";
    BOOL isSucceed = YES;
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
    } else if ([originType isEqualToString:@"aac"] && [type isEqualToString:@"wav"]) {
        isSucceed = [[PFAudio shareInstance] pcm2Wav:absolutePath isDeleteSourchFile:YES];
    }
//
    if (isSucceed) {
        callback(@[outPutPath]);
    } else {
        callback(@[[NSNull null]]);
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
  
