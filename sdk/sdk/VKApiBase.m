//
//  VKApiBase.m
//
//  Copyright (c) 2013 VK.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "VKApiBase.h"
@implementation VKApiBase
- (id)init {
	self = [super init];
	if (self) {
		NSString *methodsGroup = [[NSStringFromClass(self.class) substringFromIndex:@"VKApi".length] lowercaseString];
		[self setMethodGroup:methodsGroup];
	}
	return self;
}

- (NSString *)getMethodGroup {
	return _methodGroup;
}

- (void)setMethodGroup:(NSString *)methodGroup {
	_methodGroup = methodGroup;
}

- (VKRequest *)prepareRequestWithMethodName:(NSString *)methodName andParameters:(NSDictionary *)methodParameters {
	return [self prepareRequestWithMethodName:methodName andParameters:methodParameters andHttpMethod:@"GET"];
}

- (VKRequest *)prepareRequestWithMethodName:(NSString *)methodName andParameters:(NSDictionary *)methodParameters andHttpMethod:(NSString *)httpMethod {
	return [VKRequest requestWithMethod:[NSString stringWithFormat:@"%@.%@", _methodGroup, methodName]
	                      andParameters:methodParameters
	                      andHttpMethod:httpMethod];
}

- (VKRequest *)prepareRequestWithMethodName:(NSString *)methodName andParameters:(NSDictionary *)methodParameters andHttpMethod:(NSString *)httpMethod andClassOfModel:(Class)modelClass {
	return [VKRequest requestWithMethod:[NSString stringWithFormat:@"%@.%@", _methodGroup, methodName]
	                      andParameters:methodParameters
	                      andHttpMethod:httpMethod
	                       classOfModel:modelClass];
}

@end
