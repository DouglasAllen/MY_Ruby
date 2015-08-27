    =begin
    doctest: str.scanf("%d%s") returns [[246, "ABC"], [912, "DEF"], [1578, "GHI"]]
    >> str.scanf("%d%s") { |num,str| [ num * 2, str.upcase ] }
    => [[246, "ABC"], [912, "DEF"], [1578, "GHI"]]
    =end

    require 'scanf'

    str = "123 abc 456 def 789 ghi"
    str.scanf("%d%s") { |num,str| [ num * 2, str.upcase ] }
