function enableHitbox()
  gg.setRanges(4^7)
  gg.searchNumber(';쳍뷌쳍뷌쳍뷌쳍㷌')
  gg.getResults(9)
  gg.editAll(';쇰쇰쇰䇰', 2)
  gg.clearResults()
  gg.toast("Hitbox Enabled!")
end
function BigNameOn()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("Invisible Nama", gg.TYPE_DWORD)
    gg.getResults(999)
    gg.editAll("ZoomI7", gg.TYPE_DWORD)
    gg.clearResults()
    gg.processResume()
    
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-2.9923919798b", gg.TYPE_DWORD)
    gg.getResults(999)
    gg.editAll("Fov Hac0", gg.TYPE_DWORD)
    gg.clearResults()
    
    gg.toast("999e")
end
function AntiCheatOn()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("Fast (Wool) Break\n◀ɴᴏ ᴏꜰꜰ�7", gg.TYPE_FLOAT)
    gg.getResults(9999)
    gg.editAll("1.2461022138c", gg.TYPE_FLOAT)
    gg.refineNumber("Far Visio4", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("-99926172020")
end

function FlyHackOn()
  gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("79", gg.TYPE_DWORD)
    gg.getResults(999)
    gg.editAll("9998201827f", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("Fly Hack Enabled")
end
function HitBox5x()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("2;1;6", gg.TYPE_BYTE)
    gg.getResults(8)
    gg.editAll("253", gg.TYPE_BYTE)
    gg.clearResults()
    gg.toast("1087373316")
end

function FovHackOn()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("Fast (Wool) Block Brea3", gg.TYPE_FLOAT)
    gg.getResults(999)
    gg.editAll("Fly Hac1", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("Big Namf")
end

function infiniteHp()
  gg.setVisible(false)
  gg.setRanges(gg.REGION_C_ALLOC)
  local qb = gg.prompt({"desired HP: "}, nil, {"number"})
  if qb == nil then return end
  gg.searchNumber("1.62", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.setVisible(false)
  local t = gg.getResults(100)
  gg.addListItems(t)
  local copy = false
  for i, v in ipairs(t) do
    v.address = v.address + 300
    v.flags = gg.TYPE_FLOAT
    if copy then v.name = v.name..' #2' end
  end
  gg.addListItems(t)
  gg.loadResults(t)
  local g = gg.getResults(3000)
  gg.clearList()
  gg.addListItems(g)
  for i, v in ipairs(g) do
    v.address = v.address - 188
    v.flags = gg.TYPE_DOUBLE
    v.freeze = true
    v.value = qb[1]
  end
  gg.addListItems(g)
  gg.setValues(g)
  gg.clearResults()
  gg.toast("Infinite Hp activated")
end

function deleteHitbox()
  gg.setRanges(4^7)
  gg.searchNumber(';쇰쇰쇰䇰')
  gg.getResults(9)
  gg.editAll(';쳍뷌쳍뷌쳍뷌쳍㷌', 2)
  gg.clearResults()
  gg.toast("Hitbox Deleted (reset to original state)!")
end

function enableNoDelay()
  gg.setRanges(4)
  gg.searchNumber(';쳍뷌쳍뷌쳍뷌쳍㷌')
  gg.getResults(9)
  gg.editAll(';쇰쇰쇰䇰', 2)
  gg.clearResults()
  gg.toast("No Delay Enabled!")
end

function disableNoDelay()
  gg.setRanges(4)
  gg.searchNumber(';쇰쇰쇰䇰')
  gg.getResults(9)
  gg.editAll(';쳍뷌쳍뷌쳍뷌쳍㷌', 2)
  gg.clearResults()
  gg.toast("No Delay Disabled!")
end

function r()
  local options = {
    "Enable Hitbox",
    "Disable Hitbox",
    "Enable No Delay",
    "Disable No Delay",
    "Infinite Health",
    "Enable Fly",
    "Hitbox x5",
    "Back"
  }
  
  local menu = gg.choice(options, nil, "Select Options")
  
  if menu == 1 then
    enableHitbox()
  elseif menu == 2 then
    deleteHitbox()
  elseif menu == 3 then
    enableNoDelay()
  elseif menu == 4 then
    disableNoDelay()
  elseif menu == 5 then
    infiniteHp()
  elseif menu == 6 then
    FlyHackOn()
  elseif menu == 7 then
    HitBox5()
  elseif menu == 8 then
    return
  else
    gg.toast("No valid option selected.")
  end
end

function s()
  local options = {
    "Big Name"
  }
  local menu = gg.choice(options, nil, "Select Options")
  if menu == 1 then
    BigNameOn()
  end
end
function main()
  local mainMenu = gg.choice({
    "📂 - Player",
    "📂 - Game",
    "📂 - Settings"
  }, nil)

  if mainMenu == 1 then
    r()
  elseif mainMenu == 2 then
    gg.toast("Game menu selected")
  elseif mainMenu == 3 then
    gg.toast("Settings menu selected")
  end
end

-- Loop to open main when clicking Game Guardian logo
while true do
  if gg.isVisible(true) then
    gg.setVisible(false) -- Hide Game Guardian interface
    main()-- Open the main menu
  end
end
AntiCheatOn()