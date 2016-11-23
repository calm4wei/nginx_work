local logger = require("logger")
local args   = {}

ngx.req.read_body()
args = ngx.req.get_post_args()
if args then
  response = args
  vs = ''
  for val in pairs(args) do
    if val == nil then
      ngx.say("No post data found")
    else 
      response = string.format('val=%s',tostring(val))
      ngx.say(response)
    end

    if type(val) == "table" then
      vs = table.concat(val,"^")
    else 
      vs = val
      response = '{"flag":"1", "msg":"OK"}'
      log_file = ngx.var.log_file .. "." .. os.date(ngx.var.date_fmt, ngx.time())
      logger.info(log_file, val)
    end
    break
  end
  ngx.say(response)
else
  ngx.say('{"flag":"-1", "msg":"No post data found"}')
end

