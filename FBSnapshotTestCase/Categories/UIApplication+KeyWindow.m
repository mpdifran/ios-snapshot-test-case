/*
 *  Copyright (c) 2017-2018, Uber Technologies, Inc.
 *  Copyright (c) 2015-2018, Facebook, Inc.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

#if SWIFT_PACKAGE
#import "UIApplication+KeyWindow.h"
#else
#import <FBSnapshotTestCase/UIApplication+KeyWindow.h>
#endif

@implementation UIApplication (KeyWindow)

- (nullable UIWindow *)ub_keyWindow
{
    /// http://www.albertopasca.it/whiletrue/swift-get-app-keywindow/
    if (@available(iOS 13, *)) {
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if ([scene isKindOfClass:[UIWindowScene class]] &&
                 ((UIWindowScene *)scene).windows.firstObject.window) {
                return ((UIWindowScene *)scene).windows.firstObject.window;
            }
        }
        
        return nil;
    } else {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        return UIApplication.sharedApplication.keyWindow;
#pragma GCC diagnostic pop
    }
}

@end
