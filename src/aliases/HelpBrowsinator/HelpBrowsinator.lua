browsinator = browsinator or {}
browsinator.pagelength = 30

function browsinator.create()
  browsinator.container = Adjustable.Container:new({
  padding = 0,
  width = "750px",
  height = "500px",
  autoSave = false,
  autoLoad = false,
  })
  browsinator.console = Geyser.MiniConsole:new({
  width = "95%",
  height = "95%",
  color = "black",
  wrapAt = 100,
  }, browsinator.container)
end

function browsinator.pop(command, new)
  if new or not browsinator.container then
    browsinator.create()
  else
  end
  browsinator.container:show()
  browsinator.console:clear()
  sendAll(
    "config pagelength 250",
    table.concat(
      {
        "echo POPIT START",
        command,
        "more",
        "more",
        "more",
        "config pagelength " .. browsinator.pagelength,
      },
      snd.sep
    ),
    false
  )
  tempExactMatchTrigger("Your current pagelength: 250", deleteFull, 1)
end