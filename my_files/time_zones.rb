
include Java

java_import 'java.util.TimeZone'

#DAY_MICROSECONDS = 86400000000.0
#DAY_MILLISECONDS = 86400000.0


tz = TimeZone
dtz = tz.getDefault
puts dtz.getDisplayName

id = tz.getAvailableIDs

for i in 0..id.length - 1
  zones = tz.getTimeZone(id[i])
  out = "
    #{i} = #{(id[i])}
    #{zones.getRawOffset / 3600000.0} offset hours
  "
  puts out
end


