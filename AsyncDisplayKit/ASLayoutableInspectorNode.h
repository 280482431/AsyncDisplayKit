//
//  ASLayoutableInspectorNode.h
//  Sample
//
//  Created by Hannah Troisi on 3/19/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@protocol ASLayoutableInspectorNodeDelegate <NSObject>

- (void)shouldShowMasterSplitViewController;
- (void)toggleVizualization:(BOOL)toggle;
@end 


@interface ASLayoutableInspectorNode : ASDisplayNode <UISplitViewControllerDelegate>

@property (nonatomic, strong) id<ASLayoutable> layoutableToEdit;
@property (nonatomic, strong) id<ASLayoutableInspectorNodeDelegate> delegate;
@property (nonatomic, assign) CGFloat      vizNodeInsetSize;

+ (instancetype)sharedInstance;

@end
