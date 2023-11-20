{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "RoomPlains",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_371BB243","path":"rooms/RoomPlains/RoomPlains.yy",},
    {"name":"inst_1AE7730B","path":"rooms/RoomPlains/RoomPlains.yy",},
    {"name":"inst_780C907E","path":"rooms/RoomPlains/RoomPlains.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Player","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_371BB243","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_player","path":"objects/obj_player/obj_player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":192.0,"y":128.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Enemy","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1AE7730B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_enemy_test","path":"objects/obj_enemy_test/obj_enemy_test.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":256.0,"y":32.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_780C907E","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_tree","path":"objects/obj_tree/obj_tree.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":224.0,"y":96.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":13,"SerialiseWidth":23,"TileSerialiseData":[
1,4,5,6,7,4,5,6,7,4,5,6,7,4,5,6,7,4,5,6,7,2,3,
1,2,3,10,11,8,9,11,1,2,3,11,1,2,3,11,1,2,3,10,11,6,7,
5,6,7,3,15,12,13,4,5,6,7,4,5,6,7,4,5,6,7,14,15,10,11,
9,10,11,7,3,11,1,8,9,10,11,8,9,10,11,8,9,10,11,2,3,14,15,
13,14,15,11,7,4,5,12,13,14,15,12,13,14,15,12,13,14,15,6,7,2,3,
12,5,14,15,11,8,9,10,11,8,9,10,11,8,9,10,11,8,9,10,11,6,7,
9,12,5,14,15,12,13,14,15,5,13,14,15,12,13,14,15,12,13,14,15,10,11,
5,14,15,12,13,10,15,12,10,14,15,5,13,14,15,11,10,11,2,5,13,14,15,
1,2,10,11,1,2,5,11,1,2,3,11,4,2,5,4,4,5,6,7,1,2,3,
5,6,5,4,5,6,7,4,5,6,7,4,5,6,11,8,8,9,10,11,3,6,7,
9,10,11,8,9,10,11,8,9,10,11,8,9,10,4,12,12,13,14,15,7,10,11,
13,14,15,12,13,14,15,12,13,14,10,12,13,14,5,9,10,8,9,10,11,14,15,
1,2,3,11,1,2,3,11,1,2,3,11,1,2,12,13,14,12,13,14,15,2,3,
],},"tilesetId":{"name":"ts_grass_tiles","path":"tilesets/ts_grass_tiles/ts_grass_tiles.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 200,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 356,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":360,"hspeed":-1,"hview":200,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":640,"wview":356,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}