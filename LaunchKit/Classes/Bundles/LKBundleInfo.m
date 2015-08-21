//
//  LKBundleInfo.m
//  Pods
//
//  Created by Rizwan Sattar on 7/24/15.
//
//

#import "LKBundleInfo.h"

@interface LKBundleInfo ()

@property (strong, nonatomic) NSDate *createTime;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *version;

@end

@implementation LKBundleInfo

- (instancetype) initWithAPIDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSTimeInterval rawCreateTime = [dictionary[@"createTime"] doubleValue];
        self.createTime = [NSDate dateWithTimeIntervalSince1970:rawCreateTime];
        self.name = dictionary[@"name"];
        NSString *urlString = dictionary[@"url"];
        self.url = [NSURL URLWithString:urlString];
        self.version = dictionary[@"version"];
    }
    return self;
}

- (instancetype) initWithName:(NSString *)name
                      version:(NSString *)version
                          url:(NSURL *)url
                   createTime:(NSDate *)date
{
    self = [super init];
    if (self) {
        self.name = name;
        self.version = version;
        self.url = url;
        self.createTime = date;
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.createTime = [aDecoder decodeObjectForKey:@"createTime"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.version = [aDecoder decodeObjectForKey:@"version"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.createTime forKey:@"createTime"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.version forKey:@"version"];
}

@end
