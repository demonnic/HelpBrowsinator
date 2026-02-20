local naughty = {
"An unseen presence whispers in your ear, \"There is no more, friend.\"",
"POPIT STOP",
"POPIT START",
"Type MORE to continue reading.",
"Your current pagelength",
}
local info = copy2decho()
deleteLine()
if isPrompt() then return end
for _, phrase in pairs(naughty) do
  if line:find(phrase) then return end
end
popit.console:decho("\n"..info)