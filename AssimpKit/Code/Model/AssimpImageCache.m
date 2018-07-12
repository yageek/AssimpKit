//
//  AssimpImageCache.m
//  AssimpKit-iOS
//
//  Created by The Almighty Dwayne Coussement on 12/07/2018.
//

@import UIKit;
#import "AssimpImageCache.h"

@interface AssimpImageCache()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *cacheDictionary;
@end

@implementation AssimpImageCache

- (instancetype)init
{
	if (self = [super init])
	{
		self.cacheDictionary = [NSMutableDictionary new];
	}
	return self;
}

- (nullable CGImageRef)cachedFileAtPath:(NSString *)path
{
	UIImage *image = self.cacheDictionary[path];
	return image.CGImage;
}

- (void)storeImage:(CGImageRef)image toPath:(NSString *)path
{
	[self.cacheDictionary setObject:[UIImage imageWithCGImage:image] forKey:path];
}

@end
