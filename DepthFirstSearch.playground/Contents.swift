enum VerticeColor {
    case WHITE
    case GREY
    case BLACK
}

class Vertices {
    let key: String
    var color: VerticeColor = VerticeColor.WHITE
    var predecessor: Vertices?
    var startTime: Int = 0
    var finishTime: Int = 0
    var edge: [Vertices] = []
    init(key: String) {
        self.key = key
    }
    func setEdges(edge: [Vertices]) -> Void {
        self.edge = edge
    }
}

class Graph {
    let vertices: [Vertices]
    init(v: [Vertices]) {
        self.vertices = v
    }
    func getNumberOfVertices() -> Int {
        return vertices.count
    }
    func printTime() -> Void {
        for v in vertices {
            print("\(v.key) ---- \(v.startTime)/\(v.finishTime)")
        }
    }
}

var time: Int = 0

func DFS(G: Graph) {
    for vertice in G.vertices {
        vertice.color = .WHITE
        vertice.predecessor = nil
    }
    time = 0
    for vertice in G.vertices {
        if vertice.color == .WHITE {
            DFS_Visit(G: G, u: vertice)
        }
    }
}

func DFS_Visit(G: Graph, u: Vertices) {
    time = time + 1
    u.startTime = time
    u.color = .GREY
    for v in u.edge {
        if v.color == .WHITE {
            v.predecessor = u
            DFS_Visit(G: G, u: v)
        }
    }
    u.color = .BLACK
    time = time + 1
    u.finishTime = time
}


let u = Vertices(key: "u")
let v = Vertices(key: "v")
let w = Vertices(key: "w")
let x = Vertices(key: "x")
let y = Vertices(key: "y")
let z = Vertices(key: "z")

u.setEdges(edge: [v, x])
v.setEdges(edge: [y])
w.setEdges(edge: [y, z])
x.setEdges(edge: [v])
y.setEdges(edge: [x])
z.setEdges(edge: [z])


let G = Graph(v: [u, v, w, x, y, z])

//G.printTime()
DFS(G: G)
G.printTime()


//func printPath(G: Graph, s: Vertices, v: Vertices) {
//
//    if s.key == v.key {
//        print(s.key)
//    } else if v.predecessor == nil {
//        print("NO PATH")
//    } else {
//        if let parentOfv = v.predecessor {
//            printPath(G: G, s: s, v: parentOfv)
//            print(v.key)
//        }
//    }
//}
//
//printPath(G: G, s: s, v: t)
