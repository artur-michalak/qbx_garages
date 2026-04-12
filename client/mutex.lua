---@class Mutex
---@field acquire fun(): boolean  -- tries to acquire the lock, returns true/false
---@field release fun(): nil      -- releases the lock

---@return Mutex
return function()
    local lock = false

    ---Attempts to acquire the lock
    ---@return boolean  -- true if lock acquired, false if already locked
    local function acquireLock()
        if lock then
            return false
        end

        -- lock acquired
        lock = true
        return true
    end

    ---Releases the lock
    local function releaseLock()
        lock = false
    end

    return {
        acquire = acquireLock,
        release = releaseLock,
    }
end
