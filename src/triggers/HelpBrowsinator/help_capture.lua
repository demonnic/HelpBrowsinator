local info = copy2decho()
deleteLine()
if isPrompt() then return end
local naughty = {
  "An unseen presence whispers in your ear, \"There is no more, friend.\"",
  "BROWSINATOR START",
  "Type MORE to continue reading.",
  "Your current pagelength",
}
for _, phrase in pairs(naughty) do
  if line:find(phrase) then return end
end
browsinator:echo("\n"..info)