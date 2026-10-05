task.spawn(function()
	local CoreGui = game:GetService("CoreGui")
	local root = (gethui and gethui()) or CoreGui

	local Dict = {
		-- 标签页
		["General"]="通用", ["Exploits"]="漏洞功能", ["Visuals"]="视觉", ["Floors"]="楼层",
		["New - Archives"]="新 - 档案馆", ["New - Stairwell"]="新 - 楼梯间",
		-- 分组
		["Character"]="角色", ["Self"]="自身", ["Automation"]="自动化", ["Miscellaneous"]="杂项",
		["Debug"]="调试", ["Bypass / Solve"]="绕过 / 解谜", ["Bypass"]="绕过", ["Bypasses"]="绕过",
		["Remove"]="移除", ["Audio"]="音频", ["Camera / Effects"]="相机 / 特效", ["Camera"]="相机",
		["Effects"]="特效", ["Entities / Settings / Entity Nodes"]="实体 / 设置 / 实体节点",
		["Entities"]="实体", ["Settings"]="设置", ["ESP/Settings"]="ESP/设置",
		["Completion"]="完成", ["Farming"]="刷取", ["Experimental"]="实验性",
		["Exploits / Anti"]="漏洞 / 防护", ["Exploits / Anti / Misc"]="漏洞 / 防护 / 杂项",
		-- 角色 / 自身
		["Speed Boost"]="速度加成", ["Enable Speed Boost"]="启用速度加成", ["Fly"]="飞行",
		["Fly Speed"]="飞行速度", ["Noclip"]="穿墙", ["Remove Closet Delay"]="移除出柜延迟",
		["Remove Acceleration"]="移除加速度", ["Enable Jumping"]="启用跳跃",
		["Enable Sliding"]="启用滑行", ["Infinite Jumps"]="无限跳跃",
		["Door Reach"]="开门距离", ["Disable Idle Kick"]="禁用挂机踢出",
		["Prompt Reach Multiplier"]="交互距离倍率", ["Instant Prompts"]="瞬时交互",
		["Prompt Clip"]="隔墙交互",
		-- 自动化
		["Auto Breaker Box"]="自动断路器", ["Auto Solve Anchors"]="自动解锚点",
		["Auto Heartbeat Minigame"]="自动心跳小游戏", ["Auto Unlock Padlock"]="自动开挂锁",
		["Unlock Distance"]="开锁距离", ["Guess Library Code"]="猜图书馆密码",
		["Auto Library"]="自动图书馆", ["Skip Seek (Hotel)"]="跳过 Seek（酒店）",
		["Skip Seek (Mines)"]="跳过 Seek（矿井）", ["Auto Breaker Room"]="自动断路器房间",
		["Auto Hotel"]="自动酒店", ["Ignore Entities"]="忽略实体", ["Auto Interact"]="自动交互",
		["Ignore List"]="忽略列表", ["Auto Closet"]="自动躲柜", ["Spectate Entity"]="观战实体",
		-- 杂项 / 调试
		["Play Again"]="再来一局", ["Return to Lobby"]="返回大厅", ["Revive"]="复活",
		["Reset Character"]="重置角色", ["Ladder Softlock Fix"]="修复梯子卡死",
		["Get Current Floor"]="获取当前楼层", ["Get Current Room"]="获取当前房间",
		["Void"]="虚空", ["Death"]="死亡", ["Exit Closet"]="离开柜子",
		["Tp Next Door"]="传送到下一扇门", ["Auto Tp Next Door"]="自动传送到下一扇门",
		["Risk Warning"]="风险警告", ["Features highlighted in red are risky."]="红色高亮的功能存在风险。",
		["Compatability/Risk Warning"]="兼容性/风险警告",
		["Features highlighted in red are risky / dont work in the current floor."]="红色高亮的功能存在风险，或在当前楼层无法使用。",
		-- 绕过
		["Bypass Giggle"]="绕过 Giggle", ["Bypass Dupe"]="绕过 Dupe", ["Bypass Eyes"]="绕过 Eyes",
		["Bypass Lookman"]="绕过 Lookman", ["Bypass Gloombat Eggs"]="绕过 Gloombat 蛋",
		["Bypass Seek Obstructions"]="绕过 Seek 障碍物", ["Bypass Vacuum"]="绕过 Vacuum",
		["Bypass Killbricks"]="绕过致命方块", ["Bypass Seeking Wall"]="绕过追逐墙",
		["Bypass Snare"]="绕过 Snare", ["Bypass Banana"]="绕过香蕉皮", ["Bypass Jeff"]="绕过 Jeff",
		["Anticheat Bypass"]="绕过反作弊", ["Velocity Manipulation"]="速度操控",
		["Manipulation Method"]="操控方式", ["Infinite Items"]="无限道具", ["Item List"]="道具列表",
		["Infinite Crucifix"]="无限十字架", ["Position Spoof"]="位置欺骗", ["Crouch Spoof"]="蹲下欺骗",
		-- 移除
		["Remove Screech"]="移除 Screech", ["Remove Halt"]="移除 Halt", ["Remove A-90"]="移除 A-90",
		["Remove Dread"]="移除 Dread", ["Remove Surge"]="移除 Surge",
		["No Screech Damage"]="无 Screech 伤害", ["No Halt Damage"]="无 Halt 伤害",
		["No A-90 Damage"]="无 A-90 伤害", ["No Surge Damage"]="无 Surge 伤害",
		["Remove Footstep Sounds"]="移除脚步声", ["Remove Jammin Music"]="移除 Jammin 音乐",
		["Remove Interacting Sounds"]="移除交互音效",
		-- 视觉
		["Ambient"]="环境光", ["Field of View"]="视野", ["Custom FOV"]="自定义视野",
		["Remove Camera Shake"]="移除镜头抖动", ["Remove Camera Bobbing"]="移除镜头晃动",
		["Remove Cutscenes"]="移除过场动画", ["Remove Fog"]="移除雾", ["Third Person"]="第三人称",
		["X Offset"]="X 偏移", ["Y Offset"]="Y 偏移", ["Z Offset"]="Z 偏移", ["Wall Check"]="墙壁检测",
		["Viewmodel Offset"]="手持模型偏移", ["Transparent Hiding Spots"]="透明藏身处",
		["Transparency"]="透明度", ["Disable Glitch Jumpscare"]="禁用 Glitch 惊吓",
		["Disable Timothy Jumpscare"]="禁用 Timothy 惊吓", ["Disable Void Jumpscare"]="禁用 Void 惊吓",
		["Disable Hide Vignette"]="禁用躲藏暗角", ["Disable Firedamp Effect"]="禁用沼气效果",
		["Disable Entity Jumpscares"]="禁用实体惊吓",
		["Entity List"]="实体列表", ["Notify Entities"]="实体提醒", ["Show Entity Path"]="显示实体路径",
		["Node Transparency"]="节点透明度", ["Line Transparency"]="线条透明度", ["Line Thickness"]="线条粗细",
		["Notify Items"]="道具提醒", ["Show Distance"]="显示距离", ["Notify Library Code"]="提示图书馆密码",
		["Notify Oxygen Level"]="提示氧气量", ["Notify Haste Time"]="提示 Haste 时间",
		["Notify Chat"]="聊天提醒", ["Message"]="消息", ["Notify Style"]="通知样式",
		["Sound Volume"]="音量", ["Play Sound"]="播放声音", ["Keep Notifications"]="保留通知",
		["Test Notification"]="测试通知", ["This is a test."]="这是一条测试通知。",
		-- ESP
		["Objectives"]="目标", ["Doors"]="门", ["Hiding Spots"]="藏身处", ["Players"]="玩家",
		["Chests"]="箱子", ["Items"]="道具", ["Currency"]="货币", ["Ladders"]="梯子", ["Misc"]="杂项",
		["Rainbow Effect"]="彩虹效果", ["Fill Transparency"]="填充透明度",
		["Outline Transparency"]="轮廓透明度", ["Text Transparency"]="文字透明度",
		["Text Outline Transparency"]="文字轮廓透明度", ["Fade Time"]="渐变时间",
		["Render Limit"]="渲染距离", ["Text Size"]="文字大小", ["Text Font"]="文字字体",
		["Tracer Origin"]="射线起点", ["Tracer Thickness"]="射线粗细", ["Enable Tracers"]="启用射线",
		["Arrow Radius"]="箭头半径", ["Enable Arrows"]="启用箭头",
		-- 楼层
		["Auto Steer Minecart"]="自动驾驶矿车", ["Turn Distance"]="转向距离", ["Crouch Distance"]="蹲下距离",
		["Auto Rooms"]="自动 Rooms", ["Pathfind Timeout"]="寻路超时", ["Ignore A-60"]="忽略 A-60",
		["Show Path"]="显示路径", ["Spoof Footsteps"]="伪造脚步", ["Path"]="路径",
		["Auto Complete Dam Seek"]="自动完成水坝 Seek", ["Auto Complete Cringle"]="自动完成 Cringle",
		["Show Seek Path"]="显示 Seek 路径", ["Seek Path"]="Seek 路径",
		["Show Eyestalk Path"]="显示 Eyestalk 路径", ["Eyestalk Path"]="Eyestalk 路径",
		["Delete Seek Trigger"]="删除 Seek 触发器", ["Delete Figure"]="删除 Figure",
		["Figure Godmode"]="Figure 无敌", ["Remove Basement Gate"]="移除地下室闸门",
		["Remove Paintings Door"]="移除画廊门", ["Remove Skeleton Door"]="移除骷髅门",
		["Knob Farm"]="刷旋钮", ["Start Knob Farm"]="开始刷旋钮", ["Start Death Farm"]="开始刷死亡",
		["Copy Death Farm Loadstring"]="复制刷死亡脚本",
		-- 档案馆
		["Anti Ransom"]="防 Ransom", ["Anti Closet Trash"]="防柜中杂物",
		["Forget Me Not Skipper"]="勿忘我跳过器", ["Time Shower"]="时间显示",
		["Stop Time/Anti Stampede"]="停止时间 / 防 Stampede",
		["Correct Box ESP/Auto Interact"]="正确箱子 ESP / 自动交互",
		["Bypass Electric Water"]="绕过带电水", ["Bypass Alma"]="绕过 Alma",
		["Bypass Drones"]="绕过 Drones", ["Bypass Scribbles"]="绕过 Scribbles",
		-- 楼梯间
		["Noise Tv Breaker"]="Noise 电视破坏器", ["Anti Noise"]="防 Noise", ["Item Number"]="道具数量",
		["Kill All (Requires ≥1 Cart)"]="全部击杀（需要至少 1 辆购物车）",
		["Bug Out Creak (Requires ≥5 Cart)"]="卡 Creak 的 Bug（需要至少 5 辆购物车）",
		["Creak Aggression Meter"]="Creak 攻击性计量", ["Disable Crushers"]="禁用粉碎机",
		["Delete Crushers"]="删除粉碎机", ["Remove Meld"]="移除 Meld",
		["TP to trash and drop trash."]="传送到垃圾处并丢弃垃圾",
		["TP Shopping Carts To Player"]="将购物车传送到玩家身边",
		["Shopping Cart Target"]="购物车目标", ["Refresh Players"]="刷新玩家列表",
		["TP All Drops to Nearest Grinder"]="将所有掉落物传送到最近的研磨机",
		["Bring Dropped Items"]="带来掉落道具", ["Enable Interval"]="启用定时", ["Interval"]="间隔",
		["Orbit Dropped Items"]="环绕掉落道具", ["Height"]="高度", ["Distance"]="距离", ["Speed"]="速度",
		-- 通知
		["Waiting for the game to load..."]="正在等待游戏加载…",
		["Your executor doesn't support this feature."]="你的执行器不支持此功能。",
		["Test"]="测试",
	}

	-- 带变量的句子，按顺序匹配
	local Patterns = {
		{"^Entity '(.-)' has spawned%.$", "实体 '%1' 已生成。"},
		{"^Item '(.-)' has spawned%.$", "道具 '%1' 已生成。"},
		{"^Entity '(.-)' will spawn in the next room%.$", "实体 '%1' 将在下一个房间生成。"},
		{"^Successfully loaded in (.-) seconds%.$", "加载成功，用时 %1 秒。"},
		{"^Press '(.-)' to toggle the UI%.$", "按 '%1' 显示/隐藏界面。"},
		{"^The code is: '(.-)'$", "密码是：'%1'"},
		{"^It is '(.-)' studs away from you%.$", "它距离你 '%1' 个单位。"},
		{"^Items: (.+)$", "道具: %1"},
		{"^Time: (.+)$", "时间: %1"},
		{"^Aggression (.+)$", "攻击性 %1"},
		{"^Door Key$", "门钥匙"}, {"^Hint Book$", "提示书"}, {"^Hint Paper$", "提示纸"},
		{"^Door (%d+)$", "门 %1"}, {"^Closet$", "柜子"}, {"^Locker$", "储物柜"},
		{"^Chest$", "箱子"}, {"^Locked Chest$", "上锁的箱子"}, {"^Bed$", "床"},
		{"^Gold Pile %[(.-)%]$", "金币堆 [%1]"},
	}
	local Single = {
		["Find a hiding spot."]="找个地方躲起来。", ["Dont get near it"]="不要靠近它。",
		["Dont let it touch you."]="别让它碰到你。", ["Dont touch him."]="别碰他。",
		["Avoid looking at it."]="避免看向它。", ["Avoid touching him."]="避免碰到他。",
		["Avoid stepping on the grass."]="避免踩到草地。",
		["Keep all light sources turned off."]="保持所有光源关闭。",
		["Use him to duplicate items."]="用他来复制道具。",
		["Dont worry, hes only annoying."]="别担心，他只是很烦人。",
		["It can't move while you are looking at it."]="你看着它时它无法移动。",
		["Interact with the breaker box."]="请与断路器交互。",
		["It will be automatically solved."]="它会被自动解开。",
		["Successfully solved the breaker box."]="已成功解开断路器。",
		["Try going to the elevator!"]="试试去电梯吧！",
		["Successfully disabled the anticheat."]="已成功关闭反作弊。",
		["The anticheat has been re-enabled."]="反作弊已重新开启。",
		["Interact with a ladder to disable it again."]="与梯子交互可再次关闭。",
		["Padlock code found!"]="已找到挂锁密码！",
		["Please wait."]="请稍候。",
	}
	for k, v in pairs(Single) do Dict[k] = v end

	local function translate(s)
		if type(s) ~= "string" or s == "" then return s end
		local hit = Dict[s]
		if hit then return hit end
		for _, p in ipairs(Patterns) do
			if s:match(p[1]) then return (s:gsub(p[1], p[2])) end
		end
		return s
	end

	local hooked = setmetatable({}, {__mode = "k"})
	local function hook(obj)
		if hooked[obj] then return end
		if not (obj:IsA("TextLabel") or obj:IsA("TextButton")) then return end
		hooked[obj] = true
		local function apply()
			local new = translate(obj.Text)
			if new ~= obj.Text then obj.Text = new end
		end
		apply()
		obj:GetPropertyChangedSignal("Text"):Connect(apply)
	end

	local function watch(container)
		for _, d in ipairs(container:GetDescendants()) do pcall(hook, d) end
		container.DescendantAdded:Connect(function(d) pcall(hook, d) end)
	end

	watch(root)
	if root ~= CoreGui then watch(CoreGui) end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/therealcookiemonsterof1966/AbysallContinued/main/Games/Doors/Main.luau"))()
