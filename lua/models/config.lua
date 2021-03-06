local inspect = require 'inspect'
local jor = require 'jor'

local resty_random = require "resty.random"
local str = require "resty.string"
local lock = require "lock"

local Model = require 'model'
local Config  =  Model:new()

Config.collection = 'config'
Config.localhost = '127.0.0.1:7071' -- used by brain.lua and consumers/mail.lua

Config.update_except_slug_name = function(self, changes)
  changes.slug_name = nil

  local config = Config.get()
  return Config:update({_id = config._id}, changes)
end

Config.update_missing = function(changes)
  local config = Config.get()
  local update = {}
  local defaults = Config.default()

  -- add missing fields from passed table
  for key,value in pairs(changes) do
    if not config[key] then
      update[key] = value
    end
  end

  -- add missing fields from defaults
  for key,value in pairs(defaults) do
    if not config[key] and not update[key] then
      update[key] = value
    end
  end

  Config:update_except_slug_name(update)
end

Config.update_missing = lock.wrapper('update_missing', Config.update_missing)

Config.default = function()
  return {
    csrf_secret = Config.csrf_secret()
  }
end

Config.get = function()
  local config =  Config:all({})[1]
  config = config or Config:create(Config.default())
  return config
end

Config.reset = function()
  Config:delete(Config.default())
  return Config.get()
end

Config.csrf_secret = function()
  local strong_random = resty_random.bytes(32,true)
  ngx.shared.config_dict:add('csrf_secret', str.to_hex(strong_random))
  return ngx.shared.config_dict:get('csrf_secret')
end

Config.get_slug_name = function(no_jor)
  local an_hour = 60 * 60
  local slug_name = ngx.shared.config_dict:get('slug_name')

  if not slug_name and not no_jor then -- not cached
    if no_jor then
      local config = jor.driver:find(Config.collection, {})[1]
      if config then
        slug_name = config.slug_name
      end
    else
      slug_name = Config.get().slug_name
    end

    if slug_name then -- it's in the db, cache it for an hour
      local success, err, forcible = ngx.shared.config_dict:set('slug_name', slug_name, an_hour)
    else
      return false -- not in the db
    end
  end
  return slug_name
end

Config.set_slug_name = function(str)
  local c = Config.get() -- create config if it does not exist
  return Config:update({_id = c._id}, {slug_name = str})
end

return Config
