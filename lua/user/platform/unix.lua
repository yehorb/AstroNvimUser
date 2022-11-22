local Unix = {}
Unix.__index = Unix

function Unix.new()
  return setmetatable({}, Unix)
end

function Unix.shell()
  return {}
end

function Unix.fileformat()
  return {
    fileformat = "unix",
    fileformats = { "unix" },
  }
end

function Unix.home()
  return os.getenv "HOME"
end

return Unix
