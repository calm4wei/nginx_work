module("logger", package.seeall)

local local_log_file = ""
function info(log_file, msg)
  if log_file ~= nil and log_file ~= "" then
    response = "0000"
    if local_log_file ~= log_file then
      response = "1111"
      local_log_file = log_file
    end
    -- line = ngx.localtime() .. "|" .. ngx.var.remote_addr .. "|" .. msg .. "\n"
    line = msg .. "\n"
    response = string.format("resp=%s local_log_file=%s log_file=%s line=%s", response, local_log_file, log_file, line)
    local f = io.open(local_log_file, "a+")
    f:write(line)
    f:flush()
    f:close()
    ngx.say(response)
  else
    ngx.say("log_file is nil or empty")
  end
end

