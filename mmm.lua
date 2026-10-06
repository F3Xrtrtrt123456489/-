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
		["Ambient"]="环境光", ["Field of View"]="视野", ["Custom FOV"]="自定义视野", ["Custom Fov"]="自定义视野",
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
		-- ESP 常见名称
		["Key"]="钥匙", ["Lever"]="拉杆", ["Fuse"]="保险丝", ["Book"]="书", ["Generator"]="发电机",
		["Breaker Box"]="断路器", ["Padlock"]="挂锁", ["Elevator Breaker"]="电梯断路器",
		["Toolshed"]="工具棚", ["Dumpster"]="垃圾箱", ["Wardrobe"]="衣柜", ["Vent"]="通风口",
		["Lighter"]="打火机", ["Flashlight"]="手电筒", ["Vitamins"]="维生素", ["Bandage"]="绷带",
		["Lockpicks"]="撬锁器", ["Skeleton Key"]="骷髅钥匙", ["Crucifix"]="十字架",
		["Guiding Light"]="指引之光", ["Smoothie"]="冰沙", ["Battery"]="电池", ["Candy"]="糖果",
		["Gold"]="金币", ["Gold Pile"]="金币堆", ["Ladder"]="梯子", ["Player"]="玩家",
		["Locked"]="已上锁", ["Unlocked"]="已解锁",
		-- ESP 全部名称（来自源码）
		["Garage Door"]="车库门", ["Mirror"]="镜子", ["Shopping Cart"]="购物车", ["Fire Alarm"]="火警警报器",
		["Scrapper"]="粉碎机", ["BoxDeposit"]="箱子存放处", ["Package Deposit"]="包裹存放处",
		["Deposit"]="存放处", ["Correct Box"]="正确箱子", ["Cellar"]="地窖",
		["Fih Tank"]="Fih 水箱", ["Fish Tank"]="鱼缸",
		["Door Key"]="门钥匙", ["Electrical Key"]="电力钥匙",
		["Generator Fuse"]="发电机保险丝", ["Hint Book"]="提示书", ["Hint Paper"]="提示纸",
		["Fuse Breaker"]="保险丝断路器", ["Present"]="礼物", ["Gate Lever"]="闸门拉杆",
		["Gate Button"]="闸门按钮", ["Time Lever"]="时间拉杆", ["Anchor"]="锚点",
		["Water Pump"]="水泵", ["Vine Lever"]="藤蔓拉杆", ["Green Herb"]="绿草药",
		["Stardust Pile"]="星尘堆",
		["Hiding_Spot"]="藏身处", ["Hiding Spot"]="藏身处", ["Double Bed"]="双人床",
		["Toolbox"]="工具箱", ["Locked Toolbox"]="上锁的工具箱", ["Vine Chest"]="藤蔓箱",
		["Locked Item Locker"]="上锁的道具柜", ["Mouse"]="老鼠洞",
		["Noise_TV"]="Noise 电视", ["Portrait"]="肖像", ["DronesStampede"]="Drones 冲撞",
		["Gloombat Swarm"]="Gloombat 群", ["Gloombat Eggs"]="Gloombat 蛋",
		["Jeff the Killer"]="杀手 Jeff", ["Custom Entity"]="自定义实体", ["Frozen Ambush"]="冰冻 Ambush",
		["Snare"]="捕兽夹", ["Mandrake Hole"]="曼德拉草洞", ["Groundskeeper"]="园丁 Groundskeeper",
		["Bramble"]="荆棘 Bramble",
		["Hat"]="帽子", ["Screw"]="螺丝", ["Lamp"]="台灯", ["18+ Bottles"]="18+ 酒瓶",
		["Gween Soda Pack"]="Gween 汽水包", ["Broken Monitor"]="损坏的显示器", ["Jerry Can"]="油桶",
		["Sally Toy"]="Sally 玩具", ["Lunch Box"]="饭盒", ["Honey Pot"]="蜜罐", ["Fih Food"]="Fih 食物",
		["CD Disc"]="CD 光盘", ["Pizza"]="披萨", ["Paper Plane"]="纸飞机",
		["Starlight Vial"]="星光小瓶", ["Starlight Bottle"]="星光瓶", ["Starlight Barrel"]="星光桶",
		["Gummy Flashlight"]="软糖手电筒", ["Straplight"]="绑带灯", ["Spotlight"]="聚光灯",
		["Candle"]="蜡烛", ["Glowstick"]="荧光棒", ["Mini Shield Potion"]="小型护盾药水",
		["Big Shield Potion"]="大型护盾药水", ["Bandage Pack"]="绷带包", ["Battery Pack"]="电池包",
		["Moonlight Candle"]="月光蜡烛", ["Laser Pointer"]="激光笔", ["Holy Hand Grenade"]="圣手雷",
		["Shears"]="剪刀", ["Cheese"]="奶酪", ["Bread"]="面包", ["Alarm Clock"]="闹钟",
		["Moonlight Smoothie"]="月光冰沙", ["Gween Soda"]="Gween 汽水", ["Glitch Fragment"]="故障碎片",
		["Tablet"]="平板", ["Bomb"]="炸弹", ["Knockbomb"]="击退炸弹", ["Big Bomb"]="大炸弹",
		["Hiding Box"]="藏身盒", ["Golden Gun"]="黄金枪", ["Stop Sign"]="停止标志", ["Tip Jar"]="小费罐",
		["Lantern"]="提灯", ["Iron Key"]="铁钥匙", ["Lotus Petal"]="莲花瓣", ["Compass"]="指南针",
		["Multitool"]="多功能工具", ["Rift Jar"]="裂隙罐", ["Aloe Vera"]="芦荟", ["Donut"]="甜甜圈",
		["Lotus"]="莲花", ["Boxing Gloves"]="拳击手套",
		-- 楼层
		["Auto Steer Minecart"]="自动驾驶矿车", ["Turn Distance"]="转向距离", ["Crouch Distance"]="蹲下距离",
		["Auto Rooms"]="自动 Rooms", ["Pathfind Timeout"]="寻路超时", ["Ignore A-60"]="忽略 A-60",
		["Show Path"]="显示路径", ["Spoof Footsteps"]="伪造脚步", ["Path"]="路径",
		["Auto Complete Dam Seek"]="自动完成水坝 Seek", ["Auto Complete Cringle"]="自动完成 Cringle",
		["Show Seek Path"]="显示 Seek 路径", ["Seek Path"]="Seek 路径",
		["Show Eyestalk Path"]="显示 Eyestalk 路径", ["Eyestalk Path"]="Eyestalk 路径",
		["Delete Seek Trigger"]="删除 Seek 触发器", ["Delete Figure"]="删除 Figure",
		["Infinite Revives"]="无限复活",
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

		-- ===== 快捷键菜单 / 按钮 =====
		["Keybinds"]="快捷键", ["Toggle"]="切换", ["Lock"]="锁定", ["Hold"]="按住", ["Always"]="常开",

		-- ===== 设置页（按 Obsidian 标准设置页推测）=====
		["Menu"]="菜单", ["Menu bind"]="菜单快捷键", ["Menu Keybind"]="菜单快捷键",
		["Unload"]="卸载脚本", ["Show Keybinds"]="显示快捷键菜单", ["Keybind Menu"]="快捷键菜单",
		["Show Custom Cursor"]="显示自定义光标", ["Custom Cursor"]="自定义光标",
		["Notification Side"]="通知位置", ["Left"]="左", ["Right"]="右",
		["DPI Scale"]="界面缩放", ["Lock UI"]="锁定界面", ["Menu Fade Time"]="菜单渐变时间",
		["Themes"]="主题", ["Theme"]="主题", ["Background color"]="背景色", ["Main color"]="主色",
		["Accent color"]="强调色", ["Outline color"]="轮廓色", ["Font color"]="字体颜色",
		["Font Color"]="字体颜色", ["Font face"]="字体", ["Font Face"]="字体",
		["Theme list"]="主题列表", ["Custom theme name"]="自定义主题名称",
		["Create theme"]="创建主题", ["Load theme"]="加载主题", ["Overwrite theme"]="覆盖主题",
		["Save theme"]="保存主题", ["Set as default"]="设为默认", ["Reset default"]="重置默认",
		["Configuration"]="配置", ["Configs"]="配置", ["Config name"]="配置名称",
		["Config list"]="配置列表", ["Create config"]="创建配置", ["Load config"]="加载配置",
		["Overwrite config"]="覆盖配置", ["Refresh list"]="刷新列表",
		["Set as autoload"]="设为自动加载", ["Reset autoload"]="重置自动加载",
		["Info"]="信息",

		-- ===== 长按提示（Tooltip）=====
		["Increases your walkspeed by the specified amount."]="按设定值提高你的移动速度。",
		["Allows you to freely fly around the map."]="让你在地图中自由飞行。",
		["Allows your character to pass through solid objects."]="让角色穿过实体物体。",
		["Removes the short window where you can't exit out of a closet after the animation finishes."]="移除动画结束后短暂无法离开柜子的延迟。",
		["Prevents your character from sliding while moving."]="防止角色移动时打滑。",
		["Allows your character to jump."]="允许角色跳跃。",
		["Allows your character to slide."]="允许角色滑行。",
		["Allows you to jump while in the air."]="允许你在空中继续跳跃。",
		["Allows you to open doors from further away."]="让你从更远处开门。",
		["Prevents the kick from being idle for 20 minutes."]="防止挂机 20 分钟被踢出。",
		["Allows you to trigger all prompts instantly."]="让所有交互瞬间完成。",
		["Allows you to interact with prompts through walls."]="允许隔着墙交互。",
		["Automatically solves the breaker box."]="自动解开断路器。",
		["Automatically enters the correct code into anchors when you are near them."]="靠近锚点时自动输入正确密码。",
		["Prevents the 'Figure' minigame from ever failing."]="让 'Figure' 小游戏永不失败。",
		["Automatically enters the code into the library padlock."]="自动向图书馆挂锁输入密码。",
		["Attempts to guess the library code, but collecting some books is also necessary."]="尝试猜图书馆密码，但仍需收集部分书籍。",
		["Automatically gets books and paper."]="自动获取书籍和纸条。",
		["Skips the entire Seek sections."]="跳过整个 Seek 章节。",
		["Automatically completes the breaker sequence in Hotel Room 100."]="自动完成酒店 100 号房的断路器流程。",
		["Automatically progresses through the hotel floor."]="自动通关酒店楼层。",
		["Skip all entity waits and pauses."]="跳过所有等待实体的停顿。",
		["Automatically triggers nearby prompts."]="自动触发附近的交互。",
		["Automatically hides in a nearby closet when an entity is near."]="实体靠近时自动躲进附近的柜子。",
		["Spectates the entity while auto hiding."]="自动躲藏时观战该实体。",
		["Makes you join a new run, click again to cancel."]="让你加入新一局，再点一次可取消。",
		["Makes you teleport back to the lobby."]="让你传送回大厅。",
		["Makes you revive, if you have a revive and haven't already revived in this run."]="如果你有复活次数且本局未复活过，则让你复活。",
		["Kills your character on the server. (takes around 20 seconds if replicatesignal isn't supported)"]="在服务器上杀死你的角色。（若不支持 replicatesignal，约需 20 秒）",
		["Ladder Softlock Fix."]="修复梯子卡死。",
		["Prints the current floor to the console."]="在控制台输出当前楼层。",
		["Prints the current room number to the console."]="在控制台输出当前房间号。",
		["Teleports your character to Y -120."]="将角色传送到 Y -120。",
		["Exits the current closet."]="离开当前柜子。",
		["Teleports you to the next sequential unopened door."]="传送到下一扇未打开的门。",
		["Continuously teleports you to the next sequential unopened door."]="持续传送到下一扇未打开的门。",
		["Prevents 'Giggle' from attacking you."]="防止 'Giggle' 攻击你。",
		["Prevents you from open 'Dupe' fake doors."]="防止你打开 'Dupe' 的假门。",
		["Prevents 'Eyes' from hurting you."]="防止 'Eyes' 伤害你。",
		["Prevents 'Lookman' from hurting you."]="防止 'Lookman' 伤害你。",
		["Prevents taking damage from stepping on 'Gloombat' eggs."]="防止踩到 'Gloombat' 蛋时受伤。",
		["Prevents obstacles in the 'Seek' chase from harming you."]="防止 'Seek' 追逐中的障碍物伤害你。",
		["Prevents you from falling into 'Vacuum' fake doors."]="防止你掉进 'Vacuum' 的假门。",
		["Prevents 'Lava' from hurting you."]="防止岩浆伤害你。",
		["Prevents 'ScaryWall' from hurting you."]="防止追逐墙伤害你。",
		["Prevents 'Snare' from trapping you."]="防止 'Snare' 困住你。",
		["Prevents 'Banana Peel' from slipping you up (sometimes doesn't work)."]="防止香蕉皮让你滑倒（有时无效）。",
		["Prevents 'Jeff the Killer' from stabbing you (sometimes doesn't work)."]="防止杀手 Jeff 捅你（有时无效）。",
		["Completely disables the anticheat, after interacting with a ladder."]="与梯子交互后，彻底关闭反作弊。",
		["Moves your character forward slowly, mitigating the game's anti-noclip."]="让角色缓慢前移，规避游戏的反穿墙检测。",
		["Allows certain items to be used without draining their uses."]="让部分道具使用时不消耗次数。",
		["Risky! You can die or lose the Crucifix. Recommended to have low ping and stable fps."]="有风险！你可能死亡或丢失十字架。建议低延迟且帧数稳定。",
		["Makes your character appear underground on the server, protecting you from rush-like entities."]="让服务器认为你的角色在地下，以躲避 Rush 类实体。",
		["Makes the game think you are always crouching."]="让游戏认为你一直在蹲下。",
		["Prevents 'Screech' from spawning."]="防止 'Screech' 生成。",
		["Prevents 'Halt' from spawning."]="防止 'Halt' 生成。",
		["Prevents 'A-90' from spawning."]="防止 'A-90' 生成。",
		["Prevents 'Dread' from spawning."]="防止 'Dread' 生成。",
		["Prevents 'Surge' from spawning."]="防止 'Surge' 生成。",
		["Prevents 'Screech' from hurting you."]="防止 'Screech' 伤害你。",
		["Prevents 'Halt' from hurting you."]="防止 'Halt' 伤害你。",
		["Prevents 'A-90' from hurting you."]="防止 'A-90' 伤害你。",
		["Prevents 'Surge' from hurting you."]="防止 'Surge' 伤害你。",
		["Removes the sounds when walking."]="移除走路时的声音。",
		["Removes the music and muffle effect from the 'Jammin' modifier."]="移除 'Jammin' 修饰符的音乐和闷音效果。",
		["Removes the sounds when interacting with proximity prompts."]="移除交互时的音效。",
		["Changes the lighting color to the specified value."]="将环境光颜色改为设定值。",
		["Only applies the Field of View slider when enabled."]="仅在启用时应用视野滑块。",
		["Prevents the camera from shaking."]="防止镜头抖动。",
		["Prevents the camera from bobbing when moving."]="防止移动时镜头晃动。",
		["Removes all non-necessary cutscenes."]="移除所有非必要的过场动画。",
		["Removes all fog effects from the camera."]="移除镜头中的所有雾效。",
		["Zooms out your camera, allowing you to see your character from behind."]="拉远镜头，让你从身后看到自己的角色。",
		["Prevents third person from going through walls."]="防止第三人称视角穿墙。",
		["Changes the offset of your viewmodel while holding an item."]="更改手持道具时的模型偏移。",
		["Makes a hiding spot transparent when you enter it."]="进入藏身处时让它变透明。",
		["Disables the jumpscare from 'Glitch'"]="禁用 'Glitch' 的惊吓。",
		["Disables the jumpscare from 'Timothy'"]="禁用 'Timothy' 的惊吓。",
		["Disables the jumpscare from 'Void'"]="禁用 'Void' 的惊吓。",
		["Disables the hiding screen effect."]="禁用躲藏时的屏幕效果。",
		["Disables the firedamp screen effect."]="禁用沼气的屏幕效果。",
		["Disables jumpscares from entities like Rush and Ambush."]="禁用 Rush、Ambush 等实体的惊吓。",
		["Sends a notification when an entity spawns."]="实体生成时发送通知。",
		["Shows the path of entitys."]="显示实体的路径。",
		["Transparency of the path nodes when shown"]="显示时路径节点的透明度。",
		["Transparency of the path lines"]="路径线条的透明度。",
		["Sends a notification when an item spawns."]="道具生成时发送通知。",
		["Shows how far away the item is in the notification."]="在通知中显示道具距离。",
		["Automatically solves the code for the library padlock."]="自动解出图书馆挂锁的密码。",
		["Shows how much oxygen you have remaining."]="显示你剩余的氧气量。",
		["Shows how much time you have remaining before 'Haste' spawns."]="显示 'Haste' 生成前的剩余时间。",
		["Sends a message in the chat when an entity spawns."]="实体生成时在聊天中发送消息。",
		["Makes notifications play an alert sound."]="让通知播放提示音。",
		["Certain notifications will stay on screen until they are no longer needed."]="部分通知会一直停留在屏幕上，直到不再需要。",
		["Sends a test notifcation, so you can see how your settings look."]="发送测试通知，方便查看当前设置的效果。",
		["Highlights all objects required to progress."]="高亮所有通关所需的物体。",
		["Highlights the next door."]="高亮下一扇门。",
		["Highlights places where you can hide from entities"]="高亮可以躲避实体的地方。",
		["Highlights other players."]="高亮其他玩家。",
		["Highlights objects that can contain loot."]="高亮可能有战利品的物体。",
		["Highlights all collectable items/consumables."]="高亮所有可收集的道具/消耗品。",
		["Highlights all currency that spawns."]="高亮所有生成的货币。",
		["Highlights ladders that can be used to disable the anticheat."]="高亮可用来关闭反作弊的梯子。",
		["Highlights miscellaneous objects that can be used to disable the anticheat."]="高亮可用来关闭反作弊的杂项物体。",
		["Highlights all entities that spawn."]="高亮所有生成的实体。",
		["Makes the esp objects change colour like a rainbow."]="让 ESP 物体像彩虹一样变色。",
		["Shows how far away your character is from the object."]="显示角色与物体的距离。",
		["Draws a line to highlighted objects."]="向高亮物体画一条射线。",
		["Shows arrow that point to off-screen objects."]="显示指向屏幕外物体的箭头。",
		["Automatically completes the minecart chase."]="自动完成矿车追逐。",
		["Automatically moves and hides from entities in The Rooms."]="在 The Rooms 中自动移动并躲避实体。",
		["Continues to walk if entity 'A-60' is present, enables position spoof automatically."]="'A-60' 出现时继续行走，并自动开启位置欺骗。",
		["Shows the current path of rooms auto-walk."]="显示 Rooms 自动行走的当前路径。",
		["Makes it appear as if your character is walking normally."]="让角色看起来像在正常行走。",
		["Automatically teleports to and interacts with each water pump."]="自动传送到每个水泵并交互。",
		["Instantly completes the quest."]="立即完成任务。",
		["Shows you the correct path in seek chases."]="在 Seek 追逐中显示正确路线。",
		["Shows you the correct path in the eyestalk chase."]="在 Eyestalk 追逐中显示正确路线。",
		["Diables the 'Seek' chase trigger."]="禁用 'Seek' 追逐触发器。",
		["Completely removes the entity 'Figure' (doesn't always work)."]="彻底移除实体 'Figure'（不一定有效）。",
		["Automatically revives after dying, with unlimited respawns."]="死亡后自动复活，复活次数无限。",
		["Prevents 'Figure' from hurting you."]="防止 'Figure' 伤害你。",
		["Removes the gate from basement rooms."]="移除地下室房间的闸门。",
		["Removes the fireplace doors from painting rooms."]="移除画廊房间的壁炉门。",
		["Removes the skeleton door from the infirmary."]="移除医务室的骷髅门。",
		["Automatically gains knobs for you, dies and revives repeatedly."]="自动为你刷旋钮，反复死亡并复活。",
		["Starts farming knobs, click this when you have enough gold."]="开始刷旋钮，金币足够时点击。",
		["Automatically farms deaths, joining new runs."]="自动刷死亡，并加入新一局。",
		["Copies the death farm loadstring to your clipboard."]="将刷死亡脚本复制到剪贴板。",
		["Prevents 'Ransom' from attacking you."]="防止 'Ransom' 攻击你。",
		["Prevents 'Closet Trash' from spawning."]="防止柜中杂物生成。",
		["Automatically Skippes Forget Me Not doors."]="自动跳过勿忘我的门。",
		["Shows the Archives clock time."]="显示档案馆时钟的时间。",
		["Prevents 'The Drones Stampede' from attacking you."]="防止 'The Drones Stampede' 攻击你。",
		["ESP correct Archives boxes in the Honcho sequence and automatically interact with the correct deposit."]="在 Honcho 流程中 ESP 正确的档案馆箱子，并自动与正确的存放处交互。",
		["Prevents electric water from hurting you."]="防止带电水伤害你。",
		["Prevents 'Alma' from spawning."]="防止 'Alma' 生成。",
		["Prevents 'Drones' from attacking you."]="防止 'Drones' 攻击你。",
		["Prevents 'Scribbles' from attacking you."]="防止 'Scribbles' 攻击你。",
		["Breaks the tv of noise while holding it."]="手持时破坏 Noise 的电视。",
		["Prevents the game from making noise when moving (Visual studio auto ai lmfao ✌)."]="防止游戏在你移动时发出噪音。",
		["Shows the number of dropped items."]="显示掉落道具的数量。",
		["Shows Creak's aggression above its head."]="在 Creak 头顶显示其攻击性。",
		["DONT TOUCH THE CARTS URSELF, U WILL DIE"]="不要自己碰购物车，你会死！",
		["Combine with orbit, or bring all dropped items."]="可与环绕或带来所有掉落道具搭配使用。",
		["Teleports every dropped item to the grinder closest to you"]="将每个掉落道具传送到离你最近的研磨机。",
		["Brings all dropped items."]="带来所有掉落道具。",
		["Automatically brings dropped items at the selected interval."]="按所选间隔自动带来掉落道具。",
		["How often dropped items are brought."]="多久带来一次掉落道具。",
		["Orbits dropped items around you. Teleports them to you every 10s to prevent despawn."]="让掉落道具围着你转，每 10 秒传送到你身边以防消失。",
		["The height of the orbit."]="环绕的高度。",
		["The distance of the orbit."]="环绕的距离。",
		["The speed of the orbit."]="环绕的速度。",
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
		{"^Current autoload config: (.+)$", "当前自动加载配置：%1"},
		{"^Current default theme: (.+)$", "当前默认主题：%1"},
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

	local function translateOne(s)
		local hit = Dict[s]
		if hit then return hit end
		for _, p in ipairs(Patterns) do
			if s:match(p[1]) then return (s:gsub(p[1], p[2])) end
		end
		return s
	end

	local ModeMap = {Toggle="切换", Hold="按住", Always="常开"}

	local function translateLine(line)
		-- 快捷键菜单："[F] Fly (Toggle)"
		local key, name, mode = line:match("^%[(.-)%] (.-) %((%a+)%)$")
		if key and name then
			return "[" .. key .. "] " .. translateOne(name) .. " (" .. (ModeMap[mode] or mode) .. ")"
		end

		local r = translateOne(line)
		if r ~= line then return r end
		-- 去掉首尾空白再试一次
		local lead, core, tail = line:match("^(%s*)(.-)(%s*)$")
		if core and core ~= "" and core ~= line then
			local t = translateOne(core)
			if t ~= core then return lead .. t .. tail end
		end
		-- 处理 "名字 [距离]" / "名字 (xx)" 这类带后缀的 ESP 文字
		local name2, rest = line:match("^(.-)(%s*[%[%(].*)$")
		if name2 and name2 ~= "" then
			local t = translateOne(name2)
			if t ~= name2 then return t .. rest end
		end
		return line
	end

	local function translate(s)
		if type(s) ~= "string" or s == "" then return s end
		return (s:gsub("[^\n]+", translateLine)) -- 多行文字逐行翻译
	end

	local hooked = setmetatable({}, {__mode = "k"})
	local keyLabels = setmetatable({}, {__mode = "k"})
	local warned = {}
	local function hook(obj)
		if hooked[obj] then return end
		if not (obj:IsA("TextLabel") or obj:IsA("TextButton")) then return end
		hooked[obj] = true
		local function apply()
			local text = obj.Text
			if text:match("^%[.-%] .- %(%a+%)$") then keyLabels[obj] = true end
			local new = translate(text)
			if new ~= text then
				obj.Text = new
			elseif text:match("%a") and obj:IsDescendantOf(root) and not warned[text] then
				warned[text] = true
				warn("[未翻译] " .. text)
			end
		end
		apply()
		obj:GetPropertyChangedSignal("Text"):Connect(apply)
	end

	local function watch(container)
		for _, d in ipairs(container:GetDescendants()) do pcall(hook, d) end
		container.DescendantAdded:Connect(function(d) pcall(hook, d) end)
	end

	-- 每帧渲染的最后一步再翻译快捷键菜单，防止界面库把英文刷回来
	pcall(function()
		local RS = game:GetService("RunService")
		pcall(function() RS:UnbindFromRenderStep("ZH_Keybinds") end)
		RS:BindToRenderStep("ZH_Keybinds", Enum.RenderPriority.Last.Value, function()
			for obj in pairs(keyLabels) do
				if obj.Parent then
					local text = obj.Text
					if text:match("^%[.-%] .- %(%a+%)$") then
						local new = translate(text)
						if new ~= text then obj.Text = new end
					end
				end
			end
		end)
	end)

	-- ESP 文字翻译：等 ESP 库加载后，包装它的 AddESP，在画出来之前先翻译
	task.spawn(function()
		local function wrap()
			local A = getgenv and getgenv().Abysall
			local lib = A and A.ESPLibrary
			if not lib or type(lib.AddESP) ~= "function" then return false end
			if rawget(lib, "__zh") then return true end
			rawset(lib, "__zh", true)
			local old = lib.AddESP
			lib.AddESP = function(self, opts, ...)
				if type(opts) == "table" and type(opts.Text) == "string" then
					opts.Text = translate(opts.Text)
				end
				return old(self, opts, ...)
			end
			return true
		end
		while not wrap() do task.wait(0.05) end
	end)

	-- 长按提示：在界面库创建提示之前先翻译
	task.spawn(function()
		local function wrapTip()
			local A = getgenv and getgenv().Abysall
			local lib = A and A.Interface and A.Interface.Library
			if not lib or type(lib.AddTooltip) ~= "function" then return false end
			if rawget(lib, "__zhtip") then return true end
			rawset(lib, "__zhtip", true)
			local old = lib.AddTooltip
			lib.AddTooltip = function(self, info, disabled, ...)
				if type(info) == "string" then
					local t = translate(info)
					if t == info and info:match("%a") then
						warn("[未翻译提示] " .. info)
					end
					info = t
				end
				if type(disabled) == "string" then disabled = translate(disabled) end
				return old(self, info, disabled, ...)
			end
			return true
		end
		repeat task.wait() until wrapTip()
	end)

	watch(root)
	if root ~= CoreGui then watch(CoreGui) end
	local lp = game:GetService("Players").LocalPlayer
	if lp then
		local pg = lp:FindFirstChildOfClass("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
		if pg then watch(pg) end
	end
	watch(workspace) -- ESP 的 BillboardGui 可能挂在这里
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/therealcookiemonsterof1966/AbysallContinued/main/Games/Doors/Main.luau"))()
