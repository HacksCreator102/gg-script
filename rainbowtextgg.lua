-- Rainbow Text Effect Script for Game Guardian

-- Function to convert HSV to RGB
function hsvToRgb(h, s, v)
    local r, g, b
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)

    i = i % 6
    if i == 0 then
        r, g, b = v, t, p
    elseif i == 1 then
        r, g, b = q, v, p
    elseif i == 2 then
        r, g, b = p, v, t
    elseif i == 3 then
        r, g, b = p, q, v
    elseif i == 4 then
        r, g, b = t, p, v
    elseif i == 5 then
        r, g, b = v, p, q
    end

    return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
end

-- Rainbow animation loop
local hue = 0 -- Initial hue value
local hueSpeed = 0.01 -- Speed of hue change

while true do
    -- Increment hue and reset when it exceeds 1
    hue = hue + hueSpeed
    if hue > 1 then hue = 0 end

    -- Convert the hue to RGB
    local r, g, b = hsvToRgb(hue, 1, 1)

    -- Apply the RGB values to the text color in the game
    -- Use Game Guardian's memory editor functions here
    -- Example: gg.setValues or gg.searchNumber
    gg.toast(string.format("Color: R=%d, G=%d, B=%d", r, g, b))

    -- Delay to control animation speed
    gg.sleep(50) -- Sleep for 50ms
end
