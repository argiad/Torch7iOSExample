//
//  TorchInterface.h
//  Torch7iOSExample
//
//  Created by Adrian Dawid on 12.03.16.
//  Copyright © 2016 Adrian Dawid. All rights reserved.
//

#ifndef TorchInterface_h
#define TorchInterface_h

#include <Torch/Torch.h>
#include <Foundation/Foundation.h>

int luaopen_libtorch(lua_State *L);
int luaopen_libnn(lua_State *L);
int luaopen_libnnx(lua_State *L);
int luaopen_libimage(lua_State *L);

lua_State *init_torch_vm();
int run_torch_script(lua_State *L,NSString* script_name);

#endif /* TorchInterface_h */
