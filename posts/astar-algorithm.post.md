;;;;;
title: A* 算法
tags: algorithm, a*
date: 2014-04-22 18:10:18
format: md
;;;;;

A*算法是一种经典的启发式搜索算法,公式表示为：f(n)=g(n)+h(n)，其中f(n)
是从初始点到目标点的估价函数，g(n)是从初始点到节点n的代价，h(n)是从节
点n到目标节点的估计代价，保证找到最短路径关键在于估价函数h(n)的选取。    
一、几个相关知识：    
**启发式搜索**：启发式搜索就是在状态空间中的搜索对每一个搜索的位置进行评估，得到最好的位置，再从这个位置进行搜索直到目标。这样可以省略大量无畏的搜索路径，提到了效率。在启发式搜索中，对位置的估价是十分重要的。采用了不同的估价可以有不同的效果。

**估价函数**：从当前节点移动到目标节点的预估费用；这个估计就是启发式的。在寻路问题和迷宫问题中，我们通常用曼哈顿（manhattan）估价函数。

**A*算法的特点**：A*算法在理论上是时间最优的，但是也有缺点：它的空间增长是指数级别的。

**A*算法与BFS**：可以这样说，BFS是A*算法的一个特例。对于一个BFS算法，从当前节点扩展出来的每一个节点（如果没有被访问过的话）都要放进队列进行进一步扩展。也就是说BFS的估计函数h永远等于0，没有一点启发式的信息，可以认为BFS是“最烂的”A*算法。

**IDA*算法**：这种算法被称为迭代加深A*算法，可以有效的解决A*空间增长带来的问题，甚至可以不用到优先级队列。

二、A*伪代码

``` javascript
    push startNode onto openList
    while(openList is not empty) {
        if current is goal return path

        remove currentNode from openList
        push currentNode onto closedList
        for each neighbor in negighbors {
            if neighbor is not in openList {
                save g, h, and f
                save current parent
                add neighbor to openList
            }
            
            if neighbor is in openList
                And g is better than previous g {
                save g and f
                save the current parent
            }
            
        }
    }
```

三、coffeescript实现

``` coffeescript
astar =
    init: (grid) ->
        for x in [0...grid.length]
            for y in [0...grid[x].length]
                grid[x][y].f = 0
                grid[x][y].g = 0
                grid[x][y].h = 0
                grid[x][y].debug = ""
                grid[x][y].parent = null
                
    search: (grid, start, end) ->
        astar.init grid

        openList = []
        closeList = []
        openList.push start

        while openList.length > 0

            # 获取最小的f(x)的点
            lowInd = 0
            for i in [0...openList.length]
                lowInd = i if openList[i].f < openList[lowInd].f
            currentNode = openList[lowInd]

            # 到达目标点，返回路径
            if currentNode.pos is end.pos
                curr = currentNode
                ret = []
                while curr.parent
                    ret.push curr
                    curr = curr.parent
                return ret.reverse()

            # 最短路径搜索过程
            # 将当前点从openList移至closeList
            # 处理当前点的每个相邻点
            openList.removeGraphNode currentNode
            closeList.push currentNode
            neightbors = astar.neighbors grid, currentNode

            for i in [0...neighbors.length]
                neighbor = neighbor[i]
                if closeList.findGraphNode(neighbor) or neighbor.isWall()
                    # 无效点，跳至下一个相邻点
                    continue

                # gScore 是起始点到当前点所经过的距离
                # 需要判断当前相邻是否是最短距离
                gScore = currentNode.g + 1 # 1是当前点到相邻点的距离
                gScoreIsBest = false

                if !openList.findGraphNode(neighbor)
                    # 第一次到达当前点， 它必是当前最短距离
                    # 并且，需要计算 h(x) 
                    gScoreIsBest = true
                    neighbor.h = astar.heuristic neighbor.pos, end.pos
                    openList.push neighbor
                else if gScore < neighbor.g
                    # 已经到达过该点，并且路径短于上次
                    gScoreIsBest = true

                if gScoreIsBest
                    # 找到当前的最短路径，将它保存起来
                    neighbor.parent = currentNode
                    neighbor.g = gScore
                    neighbor.f = neighbor.g + neighbor.h
                    neighbor.debug = "F: " + neighbor.f +
                        "<br/>G: " + neighbor.g + "<br/>H:" + neighbor.h

        # 未找到最短路径，返回空
        return []
        
    heuristic: (pos0, pos1) ->
        return Math.abs(pos1.x - pos0.x) + Math.abs(pos1.y -pos0.y)
        
    neighbors: (grid, node) ->
        ret = []
        x = node.pos.x
        y = node.pos.y

        ret.push grid[x-1][y] if grid[x-1]?[y]? 
        ret.push grid[x+1][y] if grid[x+1]?[y]? 
        ret.push grid[x][y-1] if grid[x]?[y-1]? 
        ret.push grid[x][y+1] if grid[x]?[y+1]? 

```


参考：   
[A* search algorithm description on wiki](http://en.wikipedia.org/wiki/A*_search_algorithm#Algorithm_description)   
[astar-search-algorithm-in-javascript](http://www.briangrinstead.com/blog/astar-search-algorithm-in-javascript)   
[vistual PathFinding.js](http://qiao.github.io/PathFinding.js/visual/)    
[A*算法入门](http://www.cppblog.com/mythit/archive/2009/04/19/80492.aspx)
