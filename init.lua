-- lua repl initialization file

--[[
    alias.txt contains:
    luainit="package.path = '.lua/?.lua;' .. package.path ; init = require('init') ; init.init()"
    alias lua='cd && lua -i -e "$luainit"'
--]]

local m = {}

function m:init()
    -- change the prompt 
    _PROMPT='lua> '

    -- add ~/.lua to package path
    package.path = '.lua/?.lua;' .. package.path

    -- require some things ahead of time
    sh = require('sh')
    
    function printg()
        for k,v in pairs(_G) do
            print("Global key", k, "value", v)
        end
    end

    function printFuncInfo(tablename)
        n = 0
        
        local tbl = debug.getinfo(tablename)

        for k,v in pairs(tbl) do
            n = n + 1

            print(k,v)
        end
    end

    function rand(max)
        print(math.random(max))
    end

    --[[
    function persist(func, name)
        -- save cool things to a file in ~/
        if not name then 
            print('enter a name for ')
            name = io.read()
        end
        
        local file
        file = io.open(name, 'a+')
        file:write(func)
        file:close()


    end
    --]]

    -- add more modules/functions/etc as needed
end

return m