require 'ffi'

module CPUTime
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :_strtime, [ :pointer ], :string
end

string_buffer = ""
puts CPUTime._strtime(string_buffer)