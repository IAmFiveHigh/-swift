//
//  main.swift
//  函数式编程
//
//  Created by 每天农资 on 2017/11/17.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import Foundation

typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
    
}

extension Position {
    func inRange(_ range: Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}

struct Ship {
    
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canEngateOtherShip(targer: Ship) -> Bool {
        let dx = targer.position.x - position.x
        let dy = targer.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
}

extension Position {
    var length: Double {
        return sqrt(x * x + y * y)
    }
    
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
}

typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return { point in point.length <= radius}
}

func circle(radius: Distance, center: Position) -> Region {
    return { point in point.minus(p: center).length <= radius }
}

func shift(region: @escaping Region, offSet: Position) -> Region {
    return { point in region(point.minus(p: offSet)) }
}





