//
//  TorchInterface.m
//  Torch7iOSExample
//
//  Created by Adrian Dawid on 12.03.16.
//  Copyright © 2016 Adrian Dawid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TorchInterface.h"

lua_State *init_torch_vm(){
    lua_executable_dir("./");
    lua_State *L = luaL_newstate();
    
    luaL_openlibs(L);
    
    /*
     * Set the Lua package path to include the framework/lua folder, so that the require command in lua works as expeceted.
     */
    NSString *luaPackagePath = [NSString stringWithFormat:@"package.path='/?.lua;%@/framework/lua/?.lua;'.. package.path", [[NSBundle mainBundle] resourcePath]];
    if (luaL_dostring(L, [luaPackagePath UTF8String]) != 0) {
        NSLog(@"Could not update LUA path, error message: %s", lua_tostring(L, -1));
    }
    
    /*
     * Load the torch C library into lua and set up the wrappers,
     */
    luaopen_libtorch(L);
    run_torch_script(L,@"/framework/lua/torch/init.lua");
    
    return L;
}

int run_torch_script(lua_State *L,NSString *file_name){
    NSString *scriptPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:file_name];
    
    int ret = luaL_dofile(L, [scriptPath UTF8String]);
    if (ret != 0) {
        NSLog(@"Error in Torch Script: %s", lua_tostring(L, -1));
    }
    return ret;
}