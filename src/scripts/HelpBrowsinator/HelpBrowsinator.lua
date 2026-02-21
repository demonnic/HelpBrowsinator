browsinator = browsinator or {}
browsinator.pagelength = 25
local emco = require("@PKGNAME@.emco")
local consoles = {
  "HELP",
  "CHELP",
  "GHELP",
  "AB"
}
local defaultConfig = {
  activeColor = "black",
  inactiveColor = "black",
  activeBorder = "green",
  activeText = "green",
  inactiveText = "violet",
  background = "black",
  windowBorder = "green",
  title = "green"
}
local baseStyle = Geyser.StyleSheet:new([[
  border-width: 2px; 
  border-style: solid; 
]])
local activeStyle = Geyser.StyleSheet:new(f [[
  border-color: {defaultConfig.activeBorder};
  background-color: {defaultConfig.activeColor};
]], baseStyle)
local inactiveStyle = Geyser.StyleSheet:new(f [[
  border-color: {defaultConfig.inactiveColor};
  background-color: {defaultConfig.inactiveColor};
]], baseStyle)
local adjLabelStyle = Geyser.StyleSheet:new(f[[
  background-color: rgba(0,0,0,100%);
  border: 4px double;
  border-color: {defaultConfig.windowBorder};
  border-radius: 4px;
]])

function browsinator:create()
  self.container = Adjustable.Container:new({
    name = "Help Browser",
    padding = 0,
    width = "750px",
    height = "500px",
    autoSave = false,
    autoLoad = false,
    titleText = "Help Browser",
    adjLabelStyle =  adjLabelStyle:getCSS()
  })
  self.emco = emco:new({
    y = 22,
    width = "95%",
    height = "95%",
    color = "black",
    autoWrap = false,
    wrapAt = 100,
    allTab = false,
    blankLine = false,
    blink = false,
    commandLine = true,
    mapTab = false,
    consoles = consoles,
    cmdActions = {
      HELP = function(msg) browsinator:execute("HELP"," " .. msg) end,
      CHELP = function(msg) browsinator:execute("CHELP", " " .. msg) end,
      GHELP = function(msg) browsinator:execute("GHELP", " " .. msg) end,
      AB = function(msg) browsinator:execute("AB", " " .. msg) end,
    },
    consoleColor = defaultConfig.background,
    activeTabCSS = activeStyle:getCSS(),
    inactiveTabCSS = inactiveStyle:getCSS(),
    activeTabFGColor = defaultConfig.activeText,
    inactiveTabFGColor = defaultConfig.inactiveText,
  }, self.container)
end

function browsinator:execute(command, params)
  if not self.emco then
    self:create()
  end
  local fullCommand = command .. params or ""
  self.lastCommand = command
  self.container:show()
  self.emco:clear(command)
  self.emco:switchTab(command)
  local cmds = table.concat({
    "echo BROWSINATOR START",
    fullCommand,
    "more",
    "more",
    "more",
    "config pagelength " .. self.pagelength,
  }, self.sep)
  tempExactMatchTrigger("Your current pagelength: 250", deleteFull, 1)
  sendAll("config pagelength 250", cmds, false)
end

function browsinator:echo(msg)
  self.emco:decho(self.lastCommand, msg)
end

registerNamedEventHandler("browsinator", "login", "gmcp.Char.Name", function()
  tempTimer(0.5, [[send("config separator", false)]])
end)