// ********************************************************************
//
// Minecraft Log Planner
//
// Rev 1.0
//
// By: Woz
//
// Date: 3-6-23
//
// ********************************************************************
//
// Description:
//
// Used to calculate how much logs to farm to build
// certain amount of wood items in minecraft
// this is used for practicing swift and I am tired of making
// celsius to fahrenheit programs and the usualy trope learning programs


import Foundation        // my book says Cocoa here but X-code is nahh Dawg -- UIKit

// *********************************************************************

// given a menu choice return back a string back for what we are trying to analyze for output --Woz replace with enum or table - we dont need a func here

func menuStr(menu: Int) -> String {
    
    switch menu {
    case 1:
        return "planks"
    case 2:
        return "slabs"
    case 3:
        return "sticks"
    case 4:
        return "fences"
    case 5:
        return "gates"
    case 6:
        return "ladders"
    case 7:
        return "doors"
    case 8:
        return "chests"
    case 9:
        return "signs"
    default:
        return "error"
    }
}

// *********************************************************************

func planksToLogs(planks: Int) -> Int {
    
    var logs: Int = 0
    
    logs = planks / 4
    if planks % 4 != 0 {
        logs = logs + 1
    }
    return logs
}

// *********************************************************************

func sticksToPlanks(sticks: Int) -> Int {
    
    var planks: Int = 0
    
    planks = sticks / 4
    if sticks % 4 != 0 {
        planks = planks + 1
    }
    planks = planks * 2

    return planks
}

// *********************************************************************


print ("*******************************************************************************************")
print ("*                                                                                         *")
print ("*                               MINECRAFT LOG PLANNER - REV 1.0                           *")
print ("*                                                                                         *")
print ("*******************************************************************************************")
print ("")
print ("Please Pick a Wood Item to Calculate - Selection a number below:")
print ("")
print (" 1) Planks")
print (" 2) Slabs")
print (" 3) Sticks")
print (" 4) Fences")
print (" 5) Gates")
print (" 6) Ladders")
print (" 7) Doors")
print (" 8) Chests")
print (" 9) Signs")
print ("")
print ("Enter # (1 to 9) of your Menu Choice --->")

let menuStr = readLine()
let menu = Int(menuStr!)
let menuItem = menuStr(menu: menu!)

print ("Enter how many \(menuItem) you want to create-->")

let countStr = readLine()
let count = Int(countStr!)

if count! < 0 {
    exit(0)
}

var logCount: Int = 0
var plankCount: Int = 0
var stickCount: Int = 0
var fenceCount: Int = 0
var signCount: Int = 0
var subLogCount1: Int = 0
var subLogCount2: Int = 0


switch menu {
    
case 1:                 // Planks
    
    logCount = planksToLogs(planks: count!)
    
case 2:                 // Slabs
    
    plankCount = count! / 6
    if count! % 6 != 0 {
        plankCount = plankCount + 1
    }
    plankCount = plankCount * 3
    logCount = planksToLogs(planks: plankCount)
    
    
case 3:                 // Sticks
    
    plankCount = sticksToPlanks(sticks: count!)
    logCount = planksToLogs(planks: plankCount)
    
    
case 4:                 // Fences
    
    // 3 fences = 4 planks and 2 sticks
    
    fenceCount = count! / 3
    if count! % 3 != 0 {
        fenceCount = fenceCount + 1
    }
    plankCount = fenceCount * 4
    stickCount = fenceCount * 2
    
    subLogCount1 = planksToLogs(planks: plankCount)
    subLogCount2 = sticksToPlanks(sticks: stickCount)
    subLogCount2 = planksToLogs(planks: subLogCount2)
    
    logCount = subLogCount1 + subLogCount2
    
case 5:                 // Gates
    
    // 4 Sticks and 2 planks makes 1 Gate
    
    
    plankCount = count! * 2
    stickCount = count! * 4
    
    
    subLogCount1 = planksToLogs(planks: plankCount)
    subLogCount2 = sticksToPlanks(sticks: stickCount)
    subLogCount2 = planksToLogs(planks: subLogCount2)
    
    logCount = subLogCount1 + subLogCount2
    
case 6:                 // Ladders
    
    stickCount = count! / 3
    if count! % 3 != 0 {
        stickCount = stickCount + 1
    }
    stickCount = stickCount * 7
    plankCount = sticksToPlanks(sticks: stickCount)
    logCount = planksToLogs(planks: plankCount)
    
case 7:                 // Doors 3 doors = 6 planks
    
    plankCount = count! / 3
    if (count! % 3 != 0) {
        plankCount = plankCount + 1
    }
    plankCount = plankCount * 6
    logCount = planksToLogs(planks: plankCount)
    
case 8:                 // Chests
    
    plankCount = count! * 8
    logCount = planksToLogs(planks: plankCount)
    
case 9:                 // Signs
    
    signCount = count! / 3
    if (count! % 3 != 0) {
        signCount = signCount + 1
    }
    plankCount = signCount * 6
    stickCount = signCount
    
    subLogCount1 = planksToLogs(planks: plankCount)
    subLogCount2 = sticksToPlanks(sticks: stickCount)
    subLogCount2 = planksToLogs(planks: subLogCount2)
    
    logCount = subLogCount1 + subLogCount2
    
default:                // ruh roh something did not go to plan here
    
    exit(0)
}

print("")
print("To make \(count!) \(menuItem)s you will need to harvest \(logCount) logs")
print("")

exit(0) // End of Program


