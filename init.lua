-- Compost init.lua
-- Copyright Duane Robertson (duane@duanerobertson.com), 2017
-- Distributed under the LGPLv2.1 (https://www.gnu.org/licenses/old-licenses/lgpl-2.1.en.html)

compost = {}
local mod = compost
local mod_name = 'compost'
mod.version = '20190608'
mod.path = minetest.get_modpath(minetest.get_current_modname())
mod.world = minetest.get_worldpath()


minetest.register_node(mod_name..':compost_heap', {
	description = 'Compost Heap',
	tiles = {'compost_heap.png'},
	paramtype = 'light',
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults(),
	on_construct = function(pos)
		local timer = minetest.get_node_timer(pos)
		local max = 180
		if timer then
			timer:set(max, math.random(max - 1))
		end
	end,
	on_timer = function(pos, elapsed)
		--local nod = minetest.get_node_or_nil(pos)
		minetest.set_node(pos, { name = 'default:dirt' })
	end,
})

minetest.register_craft({
	output = mod_name..':compost_heap',
	recipe = {
		{ 'group:leaves', 'group:leaves', 'group:leaves', },
		{ 'group:leaves', 'group:leaves', 'group:leaves', },
		{ 'group:leaves', 'group:leaves', 'group:leaves', },
	}
})
