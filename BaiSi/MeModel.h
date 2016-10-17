//
//  MeModel.h
//  
//
//  Created by stone on 16/9/19.
//
//

#import <Foundation/Foundation.h>

@class MeSqureListModel,MeTagListModel;

@interface MeModel : NSObject
@property (nonatomic, strong) NSArray<MeTagListModel*> *tag_list;
@property (nonatomic, strong) NSArray<MeSqureListModel*> *square_list;
@end

@interface MeSqureListModel : NSObject
@property (nonatomic, strong) NSString *market;
@property (nonatomic, strong) NSString *iphone;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *square_list_identifier;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *ipad;
@property (nonatomic, strong) NSString *android;
@property (nonatomic, strong) NSString *name;
@end

@interface MeTagListModel : NSObject
@property (nonatomic, strong) NSString *theme_id;
@property (nonatomic, strong) NSString *theme_name;
@end
