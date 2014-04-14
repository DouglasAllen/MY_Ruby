require 'ffi'

module MyModule
  extend FFI::Library
  ffi_lib FFI::Library = "mscorlib"
  
  attach_function :System,  [ :pointer ], :int
end

