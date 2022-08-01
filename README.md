# qb-grilling
Grilling For QB-Core

# License

    QBCore Framework
    Copyright (C) 2022 Kyle Gryder

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

# Instructions

    Add the following lines to the 'items.lua' file located in qb-core/shared/items.lua

    ```lua
    ['raw_steak'] 				 	 = {['name'] = 'raw_steak', 			  	  	['label'] = 'Raw Steak', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'raw_steak.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A nice steak ready for the backyard barbecue.'},
	['cooked_steak'] 				 = {['name'] = 'cooked_steak', 			  	  	['label'] = 'Steak', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'cooked_steak.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A nice juicy steak.'},
	['raw_sausage'] 				 = {['name'] = 'raw_sausage', 			  	  	['label'] = 'Raw Sausage', 				['weight'] = 200, 		['type'] = 'item', 		['image'] = 'raw_sausage.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Some raw links'},
	['cooked_sausage'] 			 	 = {['name'] = 'cooked_sausage', 			  	['label'] = 'Sausage', 					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'cooked_sausage.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Tasty sausages. Yum.'},	['outdoor_grill'] 			 	 = {['name'] = 'outdoor_grill', 				['label'] = 'Grill', 					['weight'] = 20000, 	['type'] = 'item', 		['image'] = 'grill-item.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'For all your outdoor bbq needs.'},
    ```

    The imgaes found in the 'images' folder should be placed in qb-inventory/html/images or your inventory of choice.

    Enjoy!
