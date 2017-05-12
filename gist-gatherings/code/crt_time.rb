# windows version
# https://msdn.microsoft.com/en-us/library/634ca0c2%28v=vs.80%29.aspx

require 'ffi'
 
module CPUTime
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :_strtime, [ :pointer ], :string
end
 
tbuffer = ""
puts CPUTime._strtime(tbuffer) 

# https://github.com/ffi/ffi
# my current libc.so.6 does not contain this function
# FFI::Library::LIBC.methods.sort - Object.methods
