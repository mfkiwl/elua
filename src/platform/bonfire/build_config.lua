module( ..., package.seeall )

local at = require "attributes"

local function pt(t)

local level=0

  local function doprint(t)

    for k,v in pairs(t) do
      print(string.rep(" ",level) ..string.format("%s = %s",k,tostring(v)))
      if type(v)=="table"or type(v)=="romtable" then
        level=level+1
        doprint(v)
        level=level-1
      end
    end
  end

  doprint(t)
end


-- Add specific components to the 'components' table
function add_platform_components( t, board, cpu )


  t.bonfire_riscv = { macro = 'ENABLE_BONFIRE_RISCV' }
  t.bonfire_gdbserver = { 
    macro= 'ENABLE_BONFIRE_GDBSERVER',
   
    attrs= {
      uart = at.uart_attr('GDB_DEBUG_UART','1'),
      speed= at.int_attr('GDB_DEBUG_BAUD',300,1000000,115200)
    }

    
  }
end


-- Add specific configuration to the 'configs' table
function add_platform_configs( t, board, cpu )


  --if board:lower()=="bonfire_papilio_pro" then
    t.i2c = {
      attrs = {
        scl_bit = at.int_attr('I2C_SCL_BIT',0 ,31),
        sda_bit = at.int_attr('I2C_SDA_BIT', 0,31)
      }
    }
    t.bonfire = {
        
      attrs= {
        num_uarts=at.int_attr('NUM_UART',1,16),
        uarts=at.array_of(at.string_attr('UART_BASE_ADDR',32),true),
        uart_ints=at.array_of(at.string_attr('UART_INTS',32),true)
      }
    }    

end

-- Return an array of all the available platform modules for the given cpu
function get_platform_modules( board, cpu )

  m = { riscv = {  lib = '"riscv"',  open = luaopen_riscv },
        gdbserver= { lib='"gdbserver"', map="gdbserver_map", open=false }
   }

  return m
end

